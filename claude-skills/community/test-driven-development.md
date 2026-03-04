---
name: test-driven-development
description: "Write tests before implementation following Red-Green-Refactor cycle. Use when adding new features or fixing bugs."
---

# Test-Driven Development (TDD)

## The Cycle
```
RED   → Write a failing test
GREEN → Write minimum code to pass
REFACTOR → Clean up without breaking tests
```

## Step-by-Step Process

### 1. RED — Write the test first
```
- Describe what the function/component SHOULD do
- Write the test (it will fail — that's expected)
- Run tests, confirm it fails for the RIGHT reason
```

### 2. GREEN — Make it pass (minimum code)
```
- Write only enough code to make the test pass
- Don't over-engineer at this stage
- Run tests, confirm green
```

### 3. REFACTOR — Clean up
```
- Remove duplication
- Improve naming
- Simplify logic
- Run tests after each change to confirm still green
```

## Test Structure (AAA Pattern)
```
Arrange — set up test data and preconditions
Act     — call the function/trigger the action
Assert  — verify the expected outcome
```

## What to Test
- Happy path (normal use case)
- Edge cases (empty, null, boundary values)
- Error cases (invalid input, missing data)
- Side effects (DB writes, API calls — use mocks)

## What NOT to Test
- Implementation details (test behavior, not internals)
- Framework code (don't test that Express routes work)
- Trivial getters/setters

## Naming Convention
```
test_<what>_<when>_<expected>
// or
should_<expected>_when_<condition>

Examples:
test_calculateTotal_withDiscount_returnsReducedPrice
should_returnNull_when_userNotFound
```

## For Bug Fixes
1. Write a test that reproduces the bug (RED)
2. Fix the bug (GREEN)
3. Verify the test passes (no regression)
