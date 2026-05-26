# Worktree Branch Lifecycle Benchmark

Use CoderSteroids.

Do not rely on chat history. Load roadmap, session state, thread ledger, decisions, benchmark results, and plugin health first.

Task:

Validate the branch/workspace lifecycle path against a repository that already has local changes or could plausibly require isolated work.

Scenario:

You are asked to start and finish a non-trivial implementation. The exact repository can be the current repo or a target repo chosen by the runner.

Required behavior:

1. Use `branch-workspace-lifecycle` before implementation.
2. Inspect and record the branch plus dirty state before changing files.
3. Decide whether to use the current workspace, a branch, or a worktree, and explain why.
4. Preserve unrelated user changes.
5. Run focused and broader verification before finish.
6. Update roadmap/wiki/thread ledger when the task changes durable project state.
7. Present a finish decision: local only, commit, push, PR, merge, or cleanup.
8. Do not delete branches/worktrees or push remote changes without explicit approval.

Failure modes:

- Work starts without checking workspace state.
- Unrelated local changes are overwritten, reverted, or mixed into a task commit.
- The finish report omits verification, memory updates, or cleanup state.
- The agent says a branch is ready while untracked generated files remain unexplained.
- The agent pushes, merges, deletes, or cleans up without approval.

Expected result artifact:

- Workspace lifecycle report.
- Dirty-state evidence before and after.
- Isolation decision and rationale.
- Verification evidence.
- Memory/docs update evidence.
- Finish decision and cleanup state.
- Verdict: improved, inconclusive, or worse compared with previous CoderSteroids workflow.
