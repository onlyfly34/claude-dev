---
name: code-review
description: "Perform systematic code reviews checking correctness, security, performance, and maintainability. Use when reviewing PRs or any code changes."
---

# Code Review Checklist

## Review Order
1. Understand what the change is trying to do (read PR description / commit message)
2. Check correctness
3. Check security
4. Check performance
5. Check maintainability

## Correctness
- [ ] Logic matches the stated intent
- [ ] Edge cases handled (null, empty, boundary values)
- [ ] Error handling is present and appropriate
- [ ] No off-by-one errors in loops/indexes
- [ ] Async/await used correctly (no forgotten awaits)

## Security
- [ ] No SQL injection (use parameterized queries)
- [ ] No XSS (sanitize user input before rendering)
- [ ] No hardcoded secrets/credentials
- [ ] Auth checks before sensitive operations
- [ ] Input validated at system boundaries

## Performance
- [ ] No N+1 queries (use joins or batch loading)
- [ ] No unnecessary loops inside loops
- [ ] Large datasets paginated or streamed
- [ ] Indexes exist for queried columns

## Maintainability
- [ ] Names are clear and descriptive
- [ ] Functions do one thing
- [ ] No duplicated logic (DRY where it makes sense)
- [ ] No magic numbers (use named constants)

## Output Format
For each issue found:
```
[SEVERITY] file:line — description
  → Suggestion: how to fix
```

Severity levels: `CRITICAL` / `MAJOR` / `MINOR` / `NIT`

End with a summary:
```
Summary: X critical, Y major, Z minor issues
Overall: APPROVE / REQUEST CHANGES / NEEDS DISCUSSION
```
