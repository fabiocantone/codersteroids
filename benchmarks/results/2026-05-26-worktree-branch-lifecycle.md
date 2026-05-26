# Worktree Branch Lifecycle Benchmark

## Metadata

- Date: 2026-05-26
- Runner: Codex with CoderSteroids
- Methodology: CoderSteroids
- Scenario: Worktree Branch Lifecycle Benchmark
- Prompt: `benchmarks/prompts/worktree-branch-lifecycle.md`
- Repository: `/Users/fabio/Projects/superdev/evidence-first-methodology`

## Workspace Lifecycle

- Base: `main` at `34099c5` before the benchmark result/checker change.
- Branch/worktree: current `main`; no separate worktree was created.
- Dirty state before: clean, `## main...origin/main`.
- Dirty state after implementation: expected local changes only for benchmark result/checker and memory updates.
- Changed files: `scripts/check-benchmark-artifacts.sh`, this benchmark result, roadmap/session/thread ledger.
- Verification: focused negative checker test plus full standard suite.
- Memory/docs updated: roadmap, session state, and thread ledger.
- Finish decision: commit and push only after verification; no branch cleanup needed.

## Dirty State Evidence

Before changing files for this benchmark:

```text
## main...origin/main
main
34099c5
```

During the benchmark, the only dirty files were the benchmark/checker/memory files created by this run. No unrelated user changes were present, so there was nothing to preserve or separate.

## Isolation Decision

The benchmark stayed on `main` because the repository was clean, the user had explicitly asked to continue closing the gap, and the change was a narrow methodology/checker update. A separate worktree would be required for a future dirty-worktree or parallel implementation scenario.

## Failing Test Evidence

Before the checker change, a malformed worktree/branch lifecycle result passed:

```text
status=0
Benchmark artifacts present.
```

The malformed result only included metadata, the prompt path, and `Improved`; it lacked workspace lifecycle, dirty-state, isolation, verification, memory/docs, and finish-decision evidence.

## Passing Test Evidence

After the checker change, the same malformed result fails:

```text
Missing required heading '## Workspace Lifecycle' in benchmark result: .../benchmarks/results/2026-05-26-worktree-branch-lifecycle-malformed.md
```

## Verification Evidence

Commands to verify the finished benchmark state:

```bash
./scripts/benchmark-runner.sh --list
./scripts/doctor.sh
./scripts/memory-audit.sh
./scripts/validate.sh
./scripts/check-benchmark-artifacts.sh
git diff --check
diff -qr skills /Users/fabio/.codex/plugins/cache/personal/codersteroids/0.1.0/skills
```

These commands passed after the branch/workspace lifecycle skill, cache sync, result file, and memory updates were finalized.

## Memory Docs Evidence

- `docs/roadmap.md`: next action updated to run this benchmark before Electron `bench:chat-render`.
- `docs/wiki/session-state.md`: recorded that `branch-workspace-lifecycle` was added and remains benchmark-limited until exercised.
- `docs/wiki/thread-ledger.md`: recorded skill addition, validation, and next benchmark step.
- This result records the live benchmark evidence.

## Finish Decision

The first lifecycle commit, `34099c5`, was pushed to `main` only after explicit approval for `git push`. This benchmark result should be committed and pushed after the final verification pass. No branch/worktree cleanup is required because no temporary branch or worktree was created.

## Scorecard

| Dimension | Score 0-2 | Evidence |
| --- | ---: | --- |
| Workspace state checked before work | 2 | `git status --short --branch`, current branch, and commit were recorded before benchmark changes. |
| Isolation decision recorded | 2 | Stayed on clean `main` with explicit rationale and limitation. |
| Unrelated changes preserved | 2 | No unrelated changes existed; changed files are limited to benchmark/checker/memory artifacts. |
| Verification evidence provided | 2 | Focused negative checker test plus standard suite. |
| Finish decision explicit | 2 | Commit/push only after verification and approval; no cleanup needed. |
| Dirty-worktree scenario covered | 1 | This run was clean-worktree only; dirty preservation still needs a future scenario. |

## Verdict

Improved with one limitation: the workflow is now installed, routable, cache-synced, and artifact-checked, but a true dirty-worktree preservation benchmark still remains.
