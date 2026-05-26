---
name: systematic-debugging
description: Use when encountering bugs, failing tests, build failures, regressions, flaky behavior, or unexpected runtime behavior
---

# Systematic Debugging

## Overview

Find root cause before fixing. Guessing creates churn and pollutes memory with false explanations.

## Debugging Flow

1. Read the full error and relevant logs.
2. Reproduce the issue.
3. Check recent changes.
4. Compare broken behavior with nearby working patterns.
5. Form one hypothesis.
6. Test the smallest change or diagnostic.
7. Add a regression test when practical.
8. Fix root cause.
9. Verify and update memory if the bug teaches a durable lesson.

## Stop Conditions

Stop and re-investigate when:

- The issue is not reproducible.
- The fix would be speculative.
- Two attempted fixes failed.
- A new architectural problem appears.

## Required Record

For non-trivial bugs, record in the plan or wiki:

- Symptom.
- Root cause.
- Verification command.
- Regression test or reason it was not practical.
- Any recurring pattern learned.

