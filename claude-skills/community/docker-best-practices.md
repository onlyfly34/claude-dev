---
name: docker-best-practices
description: "Apply Docker and docker-compose best practices for smaller images, faster builds, and secure containers. Use when writing or reviewing Dockerfiles."
---

# Docker Best Practices

## Dockerfile Optimization

### Layer Ordering (cache-friendly)
```dockerfile
# 1. Base image (changes rarely)
FROM node:20-alpine

# 2. System deps (changes rarely)
RUN apk add --no-cache curl

# 3. App deps (changes sometimes)
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production

# 4. App code (changes often)
COPY . .

CMD ["node", "src/index.js"]
```

### Multi-Stage Build (smaller final image)
```dockerfile
# Build stage
FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

# Production stage
FROM node:20-alpine AS production
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production
COPY --from=builder /app/dist ./dist
CMD ["node", "dist/index.js"]
```

## Security Rules
- Never run as root — add `USER node` before CMD
- Never use `latest` tag — pin exact versions (`node:20.11.0-alpine`)
- No secrets in ENV or ARG (use Docker secrets or `.env` at runtime)
- Scan images: `docker scout cves <image>`

## .dockerignore (always include)
```
node_modules
.git
.env
*.log
dist
coverage
README.md
```

## docker-compose Best Practices
```yaml
services:
  app:
    build:
      context: .
      target: production        # use multi-stage target
    restart: unless-stopped
    environment:
      NODE_ENV: production
    env_file: .env              # secrets from file, not hardcoded
    depends_on:
      db:
        condition: service_healthy
    networks:
      - internal

  db:
    image: postgres:16-alpine   # pin version
    volumes:
      - pgdata:/var/lib/postgresql/data
    healthcheck:
      test: ["CMD", "pg_isready", "-U", "postgres"]
      interval: 10s
      retries: 5
    networks:
      - internal

volumes:
  pgdata:

networks:
  internal:                     # isolate from host network
```

## Quick Checklist
- [ ] Pinned base image version
- [ ] `.dockerignore` present
- [ ] Dependencies copied before source code
- [ ] `--only=production` or `--omit=dev` on final stage
- [ ] Non-root user set
- [ ] Healthcheck defined
- [ ] No secrets in image layers
