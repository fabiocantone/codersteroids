# Superpowers Field Benchmark

## Goal

Make CoderSteroids beat Superpowers in real coding tasks, not only in artifact-level comparison.

## Thesis

CoderSteroids should win by combining:

- current documentation and known-issue research before implementation;
- roadmap and wiki continuity across sessions;
- explicit decision/source ledgers;
- install/cache diagnostics;
- memory hygiene audits;
- benchmark artifacts and repeatable scorecards.

Superpowers currently has stronger breadth in TDD, review workflows, worktrees, branch finishing, and subagent-driven development. CoderSteroids must either close those gaps or prove that its continuity/evidence/memory layer produces better outcomes in real tasks.

## Field Scenarios

1. **External API feature:** implement a feature using a current API/SDK.
2. **Known-issue stack choice:** recommend or implement around a stack with public performance/runtime risks.
3. **Multi-step bugfix:** reproduce, root cause, test, fix, verify.
4. **Interrupted recovery:** resume from a fresh chat without relying on chat history.
5. **Review loop:** inspect flawed code, reject weak assumptions, implement corrections.
6. **Medium feature:** code, tests, docs, memory, and follow-up handoff.

## Metrics

- Correctness of final diff.
- Current docs and known issues checked before implementation.
- Quality of written plan and acceptance criteria.
- Test or verification strength.
- Field engineering depth: local flow map, secondary bottlenecks, falsification checks, implementation-library research, affected verification matrix.
- Cross-chat continuity.
- Decision/source reuse.
- Memory and handoff quality.
- Codebase pattern adherence.
- Review/debug rigor.
- Token/time overhead.
- Number of user corrections needed.

## Win Condition

CoderSteroids must beat Superpowers on aggregate field score across repeated scenarios, or show a short gap-closing roadmap with the next missing capability.

## Required Evidence

- Same task and starting state for both methodologies.
- Result files under `benchmarks/results/`.
- Commands run and outputs summarized.
- Diff quality review.
- Roadmap/wiki updates.
- Explicit limitation statement.
