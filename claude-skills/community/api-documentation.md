---
name: api-documentation
description: "Generate clear, consistent API documentation. Use when documenting REST endpoints, functions, or modules."
---

# API Documentation Generator

## REST Endpoint Format
```markdown
### POST /api/v1/resource

Brief one-line description.

**Auth:** Bearer token required

**Request Body:**
| Field    | Type   | Required | Description        |
|----------|--------|----------|--------------------|
| name     | string | Yes      | Resource name      |
| options  | object | No       | Additional options |

**Response 200:**
```json
{
  "id": "abc123",
  "name": "example",
  "createdAt": "2024-01-01T00:00:00Z"
}
```

**Errors:**
| Code | Meaning              |
|------|----------------------|
| 400  | Invalid request body |
| 401  | Unauthorized         |
| 404  | Resource not found   |
| 500  | Internal server error|
```

## Function/Method Format
```markdown
### functionName(param1, param2)

Brief description.

**Parameters:**
- `param1` (string) — description
- `param2` (number, optional, default: 0) — description

**Returns:** (type) — description

**Throws:** ErrorType — when this happens

**Example:**
```js
const result = functionName('value', 42)
// → { success: true, data: [...] }
```
```

## Documentation Rules
- One sentence description: what it does, not how
- List all parameters with types
- Document all possible return values
- Document all error cases
- Include a minimal working example
- No redundant phrases ("This function is used to...")

## Process
1. Read the function/endpoint signature
2. Identify all inputs, outputs, side effects
3. Write description first (forces clarity)
4. Fill in parameter table
5. Write example showing typical use
