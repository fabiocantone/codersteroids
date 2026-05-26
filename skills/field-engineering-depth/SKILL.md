---
name: field-engineering-depth
description: Use when analyzing real code behavior, performance issues, architecture tradeoffs, production bugs, or any field task where shallow file inspection could miss secondary causes
---

# Field Engineering Depth

## Overview

Field work must beat polished workflow theater. Before recommending a fix or architecture direction, inspect the complete local flow, search for secondary bottlenecks, research implementation libraries, define falsification checks, and verify every affected slice.

Use this skill to close the gap found in the first Superpowers field battle: CoderSteroids preserved memory better, but Superpowers inspected more local causes and verification surfaces.

## Required Gate

For non-trivial real-code analysis, performance work, architecture decisions, or production bugs, produce a field-depth report with these sections:

1. `## Local Flow Map`
2. `## Primary Hypotheses`
3. `## Secondary Bottlenecks`
4. `## Implementation Library Research`
5. `## Falsification Checks`
6. `## Affected Verification Matrix`
7. `## Decision And Next Step`
8. `## Durable Memory Updates`

After drafting the report, validate it:

```bash
./scripts/check-field-depth-report.sh path/to/report.md
```

## Local Flow Map

Trace the behavior beyond the obvious files:

- UI entrypoint and rendering path.
- State ownership and derived data.
- Network/IPC/native boundaries.
- Persistence and cache paths.
- Background tasks, workers, timers, or subscriptions.
- Tests and diagnostics that already cover the flow.

List concrete files/functions and what each contributes to the behavior.

## Primary Hypotheses

Rank the likely root causes by evidence:

- Hypothesis.
- Evidence.
- Counter-evidence.
- What would prove or disprove it.
- First diagnostic or benchmark.

## Secondary Bottlenecks

After the first hypothesis list, do a second pass for less obvious causes:

- Startup/load scope.
- Refresh/reload paths.
- Serialization or persistence costs.
- Native/backend slices that affect frontend behavior.
- Re-render or invalidation fanout.
- Library/runtime constraints.
- Platform-specific behavior.

Do not stop at the first plausible cause when the task is field-critical.

## Implementation Library Research

If the recommendation implies a concrete library, framework, or runtime, research options before recommending:

- Official docs.
- Current version/activity.
- Known issues and limitations.
- Fit with local patterns.
- Migration effort.
- Alternative libraries.

Example: if recommending chat virtualization, compare TanStack Virtual, React Virtuoso, custom virtualizer, and whether any chat-specific package is commercial or unsuitable.

## Falsification Checks

Every major claim needs a way to be wrong:

- What measurement would disprove it?
- Which command/test/profile would show that?
- What result would change the recommendation?

## Affected Verification Matrix

Verification must cover every affected slice, not only the edited language:

| Slice | Command or inspection | Proves | Status |
| --- | --- | --- | --- |
| Frontend | ... | ... | pending/pass/fail |
| Backend/native | ... | ... | pending/pass/fail |
| Integration | ... | ... | pending/pass/fail |
| Performance | ... | ... | pending/pass/fail |
| Docs/memory | ... | ... | pending/pass/fail |

## Stop Conditions

Stop and say the analysis is incomplete when:

- You cannot trace the local flow end to end.
- The report has no secondary bottleneck pass.
- Implementation options are recommended without current library research.
- No falsification check exists for the leading hypothesis.
- Verification only covers one layer while the behavior crosses layers.

## Completion Criteria

Before claiming the field analysis is ready:

- Validate the report with `check-field-depth-report.sh`.
- Run relevant fresh verification commands.
- Update roadmap/wiki/thread ledger when the conclusion changes future work.
- Record source links and limitations.
