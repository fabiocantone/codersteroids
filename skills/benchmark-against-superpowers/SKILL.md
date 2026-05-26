---
name: benchmark-against-superpowers
description: Use when deciding whether this methodology is better than Superpowers, evaluating plugin quality, or running validation scenarios
---

# Benchmark Against Superpowers

## Overview

CoderSteroids must beat Superpowers on real coding outcomes, not only on a narrow positioning statement. Compare field performance end to end: correctness, continuity, current-source use, debugging quality, verification, maintainability, and overhead.

Superpowers may remain stronger in specific workflow breadth areas such as TDD, review, worktrees, and subagent orchestration. Treat those as gaps to close or deliberately integrate around, not as excuses to avoid field comparison.

## Scenarios

Run both methodologies against:

1. External-library feature.
2. Multi-step bugfix.
3. Interrupted-session recovery.
4. Stack recommendation with known-issue research.
5. Medium feature with tests, docs, and follow-up changes.
6. Review/fix loop after an intentionally flawed implementation.

Use prompts from `benchmarks/prompts/`.

## Scorecard

Rate each run from 0-2:

- Current docs used before code.
- Written plan before implementation.
- Roadmap updated.
- Wiki memory updated.
- Decisions reused after interruption.
- Verification evidence provided.
- Folder/code standards respected.
- Known issues and source limitations handled.
- Install/cache/memory health checked.
- Final implementation quality.
- Field engineering depth: local flow map, secondary bottlenecks, falsification checks, implementation-library research, and affected verification matrix.
- Overhead acceptable.

## Go/No-Go

Continue serious development only if CoderSteroids can beat Superpowers in repeated field tasks or produce a concrete gap-closing roadmap for the dimensions where it loses.

Do not claim victory from artifact inspection alone. Require live or replayable benchmark evidence.

## Record

Save results in `benchmarks/results/YYYY-MM-DD-run.md`.
