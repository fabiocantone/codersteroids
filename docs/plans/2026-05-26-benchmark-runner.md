# Benchmark Runner Plan

## Goal

Add a benchmark runner workflow that makes benchmark result creation repeatable from existing prompt files and reduces missing-artifact drift.

## Scope

- Add `benchmark-runner` skill.
- Add `scripts/benchmark-runner.sh`.
- Wire the skill/script into validation and docs.
- Update roadmap/wiki/thread ledger.

## Non-Scope

- Do not attempt to launch a separate Codex chat from the script.
- Do not auto-score results without human/agent evidence.
- Do not replace future live A/B benchmark automation.

## Files

- `skills/benchmark-runner/SKILL.md`
- `scripts/benchmark-runner.sh`
- `scripts/validate.sh`
- `README.md`
- `skills/FOLDER.md`
- `docs/wiki/architecture.md`
- `docs/roadmap.md`
- `docs/wiki/session-state.md`
- `docs/wiki/thread-ledger.md`

## Verification

- `./scripts/benchmark-runner.sh --list`
- `./scripts/doctor.sh`
- `./scripts/memory-audit.sh`
- `./scripts/validate.sh`
- `./scripts/check-benchmark-artifacts.sh`
- `git diff --check`
- `diff -qr skills /Users/fabio/.codex/plugins/cache/personal/codersteroids/0.1.0/skills`
