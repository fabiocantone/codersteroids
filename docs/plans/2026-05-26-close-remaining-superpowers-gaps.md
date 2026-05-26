# Close Remaining Superpowers Gaps Plan

## Scope

Cover the remaining practical gaps from the Superpowers comparison: small-task overhead, subagent execution control, benchmark automation, and dirty-worktree lifecycle proof.

## Non-Scope

- Public adoption or star parity.
- Full multi-harness packaging across every agent platform.
- Launching real remote subagents from this repository.
- Building a complete external benchmark lab.

## Files

- `skills/small-task-fast-path/SKILL.md`
- `skills/subagent-execution-controller/SKILL.md`
- `benchmarks/prompts/small-task-fast-path.md`
- `benchmarks/prompts/subagent-execution-controller.md`
- `benchmarks/results/2026-05-26-small-task-fast-path.md`
- `benchmarks/results/2026-05-26-subagent-execution-controller.md`
- `benchmarks/results/2026-05-26-worktree-branch-lifecycle-dirty.md`
- `scripts/benchmark-runner.sh`
- `scripts/check-benchmark-artifacts.sh`
- validation, README, skills docs, roadmap, and wiki files

## Test Strategy

- Structural validation must require the new skills and prompt artifacts.
- Benchmark checker must validate small-task and subagent result shapes.
- `benchmark-runner.sh --check` must call the artifact checker.
- Dirty-worktree benchmark must record a real temp-repo worktree isolation check.

## Verification Commands

```bash
./scripts/benchmark-runner.sh --list
./scripts/benchmark-runner.sh --check
./scripts/doctor.sh
./scripts/memory-audit.sh
./scripts/validate.sh
./scripts/check-benchmark-artifacts.sh
git diff --check
diff -qr skills /Users/fabio/.codex/plugins/cache/personal/codersteroids/0.1.0/skills
```

## Acceptance Criteria

- Remaining broad workflow gaps are covered by installed skills or explicit benchmark evidence.
- Any residual gap is outside plugin behavior, such as adoption/multi-harness maturity, and is recorded honestly.
- Installed cache matches repository skills.
