---
name: self-improvement-loop
description: Use when evaluating whether CoderSteroids can improve itself, converting benchmark failures into plugin changes, running before/after comparisons, or deciding whether a methodology change actually improved agent behavior
---

# Self Improvement Loop

## Overview

Self-improvement is not brainstorming. A methodology improves itself only when it uses evidence from a real failure or benchmark, makes a scoped change, verifies the change, and records whether behavior actually improved.

## Required Loop

1. Select one evidence-backed gap.
2. Reference the artifact that proves the gap.
3. Define the smallest useful change.
4. Predict what behavior should improve.
5. Implement the change.
6. Run structural validation.
7. Run or define a before/after behavior test.
8. Record result, residual risk, and next gap.

## Evidence Sources

Prefer benchmark result files, thread ledger entries, validator failures, concrete user corrections, direct Superpowers comparisons, or repeated missing-memory, missing-source, missing-log, or stale-cache failures.

Do not use vague preferences as evidence unless the user confirms them as durable requirements.

## Change Rules

- Make one focused improvement per loop.
- Prefer a skill, validator, benchmark prompt, helper script, or memory-rule update over broad rewrites.
- Do not add a skill unless routing, validation, benchmark coverage, and memory updates are also handled.
- Do not claim improvement from static validation alone.

## Before/After Test Shape

```markdown
## Gap

...

## Change

...

## Expected Behavior Improvement

...

## Before Evidence

...

## After Evidence

...

## Verdict

Improved / inconclusive / worse
```

## Stop Conditions

Stop and ask for a narrower target when:

- No evidence-backed gap is available.
- The proposed change is too broad to verify in one loop.
- The benchmark cannot distinguish old behavior from new behavior.
- The change would only add rules without a test or validator.

## Completion Criteria

Before claiming the self-improvement worked:

- Run plugin validation, doctor, memory audit, benchmark artifact checks, and `git diff --check`.
- Sync and check installed cache when skills changed.
- Save a benchmark result or decision entry with before/after evidence.
- Update roadmap, session state, and thread ledger.
