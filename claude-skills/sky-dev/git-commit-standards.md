---
name: git-commit-standards
description: "Generate concise, precise Git commit messages following Conventional Commits. Use for any commit operation. Keep messages SHORT and ACCURATE."
---

# Git Commit Standards

## Format
```
<type>(<scope>): <subject>
```
Subject only, no body unless absolutely necessary.

## Types
| Type | Use |
|------|-----|
| `feat` | New feature |
| `fix` | Bug fix |
| `refactor` | Code restructure (no behavior change) |
| `perf` | Performance improvement |
| `docs` | Documentation only |
| `test` | Tests only |
| `chore` | Build/dependencies/config |
| `style` | Formatting only (no logic change) |

## Rules
- Subject: 50 chars max, lowercase, imperative mood, no period
- Scope: Optional, lowercase, one word (`auth`/`api`/`db`/`ui`/`docker`)
- Body: Only if truly needed (breaking changes, complex WHY)
- Be precise: Say exactly what changed, nothing more

## Examples

✅ Good:
```
feat(auth): add JWT login
fix(inventory): correct stock calculation
refactor(db): use connection pooling
perf(api): add query indexes
docs: update deployment steps
chore(deps): upgrade express to 4.18
```

❌ Bad:
```
feat(auth): implement comprehensive JWT-based authentication with refresh tokens  # TOO LONG
fix: fixed some bugs                                                              # TOO VAGUE
Added login feature                                                               # WRONG TENSE
feat(auth): Add JWT authentication.                                               # PERIOD AT END
```

## Analysis Process
1. `git diff --stat` — which files changed?
2. Determine type — feat/fix/refactor/etc
3. Identify scope — primary module affected
4. Write subject — verb + what changed (under 50 chars)
5. Skip body unless breaking change or complex reasoning needed

## Multi-file Commits
Single logical change → one commit:
```
feat(parts): add bulk import
```
Unrelated changes → separate commits:
```
feat(parts): add CSV export
fix(ui): correct table layout
```

## Breaking Changes
Only add body for breaking changes:
```
feat(api): change auth to OAuth2

BREAKING CHANGE: JWT no longer supported
```

## Decision Tree
```
New feature?      → feat
Bug fix?          → fix
Performance?      → perf
Code cleanup?     → refactor
Docs only?        → docs
Tests only?       → test
Build/deps?       → chore
Style only?       → style
```
