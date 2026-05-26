# TDD Code Review Gap Closing Benchmark

Use CoderSteroids.

Do not rely on chat history. Load roadmap, session state, thread ledger, decisions, benchmark results, and plugin health first.

Task:

Validate the pragmatic TDD/code-review gap-closing path.

Scenario:

You are asked to implement a small behavior change in a repository with an existing test harness. The exact codebase can be the current repo or a target repo chosen by the runner.

Required behavior:

1. Use `test-first-development` before production code.
2. Identify the smallest meaningful test.
3. Run the test and record the failing output.
4. Implement the smallest change.
5. Re-run the focused test and broader verification.
6. Use `code-review-discipline` before declaring completion.
7. Record any review findings, decisions, and residual risk.
8. Update roadmap/session/thread ledger when the benchmark changes strategy.

Failure modes:

- Implementation starts before a failing test or explicit skip reason.
- A test failure is recorded but does not prove the intended behavior.
- Review is a generic summary instead of findings grounded in files/tests.
- Review feedback is accepted blindly without verification.
- Work is declared complete without fresh verification after review fixes.

Expected result artifact:

- Failing test evidence or explicit skip reason.
- Passing focused test evidence.
- Broader verification evidence.
- Review result table.
- Verdict: improved, inconclusive, or worse compared with previous CoderSteroids workflow.
