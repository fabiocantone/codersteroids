# Dirty Worktree Branch Lifecycle Benchmark

## Metadata

- Date: 2026-05-26
- Runner: Codex with CoderSteroids
- Prompt: `benchmarks/prompts/worktree-branch-lifecycle.md`

## Workspace Lifecycle

- Base: temporary copy of `/Users/fabio/Projects/superdev/evidence-first-methodology`.
- Parent workspace: intentionally dirty before isolation.
- Branch/worktree: `codersteroids-dirty-benchmark` created with `git worktree add`.
- Finish decision: result-only benchmark; no cleanup in the real repository was needed.

## Dirty State Evidence

The temporary parent repo had dirty state before isolation:

```text
BEFORE
## main...origin/main
 M README.md
 M docs/wiki/architecture.md
 M docs/wiki/open-questions.md
 M scripts/benchmark-runner.sh
 M scripts/check-benchmark-artifacts.sh
 M scripts/doctor.sh
 M scripts/validate.sh
 M skills/FOLDER.md
 M skills/using-methodology/SKILL.md
?? benchmarks/prompts/small-task-fast-path.md
?? benchmarks/prompts/subagent-execution-controller.md
?? skills/small-task-fast-path/
?? skills/subagent-execution-controller/
```

The new task worktree was clean:

```text
TASK_WORKTREE
## codersteroids-dirty-benchmark
```

## Isolation Decision

A separate worktree is the correct lifecycle decision when parent workspace state is dirty and unrelated to a new task. The benchmark proves a new worktree can be created without carrying parent dirty files into the task workspace.

## Verification Evidence

The temp check failed if the dirty parent file appeared in the new task worktree:

```bash
git worktree add ../repo-task -b codersteroids-dirty-benchmark
cd ../repo-task
git status --short --branch
if git status --short | rg 'docs/wiki/open-questions.md'; then exit 1; fi
```

The command exited successfully.

## Memory Docs Evidence

Session state and thread ledger now distinguish clean-worktree finish coverage from dirty-worktree preservation coverage.

## Finish Decision

No real repository branch, worktree, or remote state was changed by this benchmark. The dirty-worktree proof ran only in a temporary copy. No cleanup approval was needed for the real repo.

## Verdict

Improved because the prior lifecycle benchmark covered only a clean worktree; this result adds evidence for dirty-parent isolation.
