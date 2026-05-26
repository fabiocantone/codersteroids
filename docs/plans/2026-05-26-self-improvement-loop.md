# Self Improvement Loop Plan

## Scope

Add a CoderSteroids capability and benchmark for evidence-backed self-improvement.

## Non-Scope

- Do not implement autonomous background mutation.
- Do not let the plugin rewrite itself without user-visible artifacts.
- Do not claim behavior improvement without before/after evidence.

## Files

- `skills/self-improvement-loop/SKILL.md`
- `benchmarks/prompts/self-improvement-loop.md`
- validation scripts and benchmark checks
- roadmap/wiki/thread ledger

## Acceptance Criteria

- CoderSteroids has an explicit self-improvement loop.
- The loop requires evidence, a scoped change, expected improvement, verification, and before/after verdict.
- Benchmark artifact checks include the self-improvement prompt.
- The next session can run the benchmark against a real gap.

## Verification

```bash
./scripts/benchmark-runner.sh --list
./scripts/doctor.sh
./scripts/memory-audit.sh
./scripts/validate.sh
./scripts/check-benchmark-artifacts.sh
git diff --check
diff -qr skills /Users/fabio/.codex/plugins/cache/personal/codersteroids/0.1.0/skills
```
