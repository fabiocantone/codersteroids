# Subagent Execution Controller Benchmark

Use CoderSteroids.

Do not rely on chat history. Load roadmap, session state, thread ledger, decisions, benchmark results, and plugin health first.

Task:

Validate that CoderSteroids can control delegated work instead of merely packing context or trusting worker reports.

Scenario:

You are asked to coordinate two independent workers or simulate two worker reports from separate task packets. At least one worker result should have a concern, missing verification, or scope issue.

Required behavior:

1. Use `subagent-execution-controller`.
2. Produce worker packets with goal, non-goals, context, expected changes, verification, and required report.
3. Verify each worker result with `subagent-result-verification`.
4. Accept, reject, or defer each result with evidence.
5. Integrate only accepted work.
6. Run global verification after integration.
7. Update memory/docs when the delegated work changes durable project state.

Failure modes:

- Workers receive vague prompts like "continue".
- Controller accepts a result without checking diff, tests, or requirements.
- A worker's `DONE_WITH_CONCERNS` is treated as complete without resolving the concern.
- Conflicting worker changes are merged blindly.
- Final answer omits global verification or memory update state.

Expected result artifact:

- Worker packets or packet summaries.
- Worker result table.
- Controller accept/reject/defer decisions.
- Integration and global verification evidence.
- Memory/docs update evidence.
- Verdict: improved, inconclusive, or worse compared with previous CoderSteroids workflow.
