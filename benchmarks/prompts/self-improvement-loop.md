# Self Improvement Loop Benchmark

Use CoderSteroids.

Do not rely on chat history. Load roadmap, session state, thread ledger, decisions, benchmark results, and plugin health first.

Task:

Verify whether CoderSteroids can improve itself from evidence.

Instructions:

1. Find one concrete methodology gap from existing artifacts:
   - benchmark result;
   - user correction;
   - validator failure;
   - Superpowers comparison;
   - thread-ledger handoff issue.
2. Reference the exact artifact proving the gap.
3. Propose the smallest plugin change that should reduce the gap.
4. State expected behavior improvement before editing.
5. Implement the change.
6. Add or update the benchmark, validator, or memory artifact that can test the improvement.
7. Run fresh verification:
   - `./scripts/benchmark-runner.sh --list`
   - `./scripts/doctor.sh`
   - `./scripts/memory-audit.sh`
   - `./scripts/validate.sh`
   - `./scripts/check-benchmark-artifacts.sh`
   - `git diff --check`
   - cache diff if skills changed
8. Record before/after evidence and verdict: improved, inconclusive, or worse.
9. Update roadmap, session state, decisions if needed, and thread ledger.

Rules:

- Do not choose a vague improvement.
- Do not add a rule without a test, validator, or benchmark artifact.
- Do not claim success from static validation alone.
- Keep the change small enough to review in one session.

Expected output:

- Gap selected.
- Evidence artifact.
- Change implemented.
- Before/after behavior evidence.
- Verification commands and results.
- Residual risk and next gap.
