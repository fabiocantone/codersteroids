# Benchmark Run

## Metadata

- Date: 2026-05-26
- Runner: Codex with CoderSteroids
- Methodology: CoderSteroids `benchmark-against-superpowers`, local Superpowers skill inspection, recorded CoderSteroids benchmark results, GitHub API metadata
- Scenario: Direct comparison against Superpowers

## Research Summary

**Date checked:** 2026-05-26

**Superpowers source checked:** local installed Superpowers skill set and GitHub API metadata for `obra/superpowers`.

**Superpowers metadata:** `obra/superpowers` had 207200 stars, 18450 forks, MIT license, latest release `v5.1.0` published 2026-05-04, and last push 2026-05-24.

**Superpowers local skills found:** `using-superpowers`, `brainstorming`, `writing-plans`, `executing-plans`, `test-driven-development`, `systematic-debugging`, `verification-before-completion`, `requesting-code-review`, `receiving-code-review`, `subagent-driven-development`, `dispatching-parallel-agents`, `using-git-worktrees`, `finishing-a-development-branch`, and `writing-skills`.

**CoderSteroids evidence checked:** recorded benchmark results for external-library feature, multi-step bugfix, interrupted-session recovery, chat continuity, recommendation verification, similar-project research, skill ecosystem research, and known-issues stack recommendation.

**Limitation:** This is an artifact-level and local-skill comparison, not a fully controlled live A/B run where both plugins execute every prompt in separate clean sessions. Treat conclusions as directional until a benchmark runner automates repeatable dual runs.

## Scorecard

| Dimension | CoderSteroids | Superpowers | Evidence |
| --- | ---: | ---: | --- |
| Current docs before external APIs | 2 | 1 | CoderSteroids has `context7-research`, `web-and-github-research`, source ledger, and known-issues gate. Local Superpowers skills emphasize planning/TDD/debugging, not current-doc/source-ledger behavior. |
| Written plan before implementation | 2 | 2 | Both have explicit planning workflows. Superpowers has mature brainstorming/writing/executing plan skills. |
| Roadmap updated | 2 | 1 | CoderSteroids has `docs/roadmap.md` as a first-class operational memory. Superpowers plans are strong but local skills do not define a living roadmap artifact by default. |
| Wiki/project memory updated | 2 | 0 | CoderSteroids has Markdown wiki, session state, sources, decisions, and thread ledger. Superpowers has no installed project-memory skill in the inspected set. |
| Decisions reused after interruption | 2 | 1 | CoderSteroids chat-continuity benchmark passed through session-state/thread-ledger. Superpowers may rely on plans and conversation context, but not a dedicated ledger in the inspected skills. |
| Verification evidence | 2 | 2 | Both have verification-before-completion. Superpowers also has strong TDD/review workflows. |
| Debugging discipline | 2 | 2 | Both include systematic-debugging-style workflows. |
| TDD/review/worktree breadth | 1 | 2 | Superpowers is stronger: TDD, code review, branch finishing, worktrees, and broader subagent workflows are first-class. |
| Install/update diagnostics | 2 | 0 | CoderSteroids now has `skill-lifecycle-doctor` and `scripts/doctor.sh`; Superpowers local skill list has no equivalent install/cache doctor. |
| Overhead acceptable | 1 | 1 | Both impose workflow overhead. CoderSteroids is heavier for research/memory; Superpowers is heavier for brainstorming/spec approval/TDD gates. |

## Verdict

CoderSteroids should continue, but only with focused expansion. It is not better than Superpowers as a broad coding methodology. Superpowers is more mature for TDD, design/spec/planning, review, worktrees, and subagent-driven development.

CoderSteroids is stronger on the target thesis:

- current-doc and known-issue checks before recommendations;
- roadmap/wiki/source-ledger continuity;
- cross-chat thread ledger;
- recommendation verification;
- plugin lifecycle diagnostics.

## Next Build Priority

1. Keep `skill-lifecycle-doctor` and make it part of normal install/test flow.
2. Add `memory-hygiene-audit` next.
3. Add `benchmark-runner` after memory hygiene so future comparisons are repeatable instead of manually scored.
4. Do not add broad workflow skills until these diagnostics are solid.

## Go/No-Go Implication

Go, but stay narrow. CoderSteroids should not try to replace Superpowers. It should become the best Codex-first continuity, evidence, memory, and diagnostics layer for long-running coding projects.
