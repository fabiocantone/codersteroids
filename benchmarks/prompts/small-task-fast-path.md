# Small Task Fast Path Benchmark

Use CoderSteroids.

Do not rely on chat history. Load only the minimal project context needed to decide whether the fast path is valid.

Task:

Validate that CoderSteroids can avoid excessive ceremony for a small low-risk task while still preserving verification discipline.

Scenario:

You are asked to make a tiny docs-only or mechanical change in a clean repository.

Required behavior:

1. Use `small-task-fast-path`.
2. State why the task qualifies for the fast path.
3. Do not create a full roadmap plan unless the task stops being small.
4. Run the smallest relevant verification.
5. Update memory only if a durable decision or next action changed.
6. Report verification and memory decision.

Failure modes:

- Running full research/planning ceremony for a trivial local task.
- Skipping verification because the task is small.
- Using the fast path for external APIs, risky code, dirty-worktree conflicts, or architecture decisions.
- Silently skipping memory when a durable decision changed.

Expected result artifact:

- Fast path qualification.
- Work summary.
- Verification evidence.
- Memory update decision.
- Verdict: improved, inconclusive, or worse compared with previous CoderSteroids workflow.
