# Field Engineering Depth Gate Plan

## Goal

Add a CoderSteroids field engineering depth gate so real-code analyses inspect broader local flows, secondary bottlenecks, implementation-library choices, falsification checks, and affected verification slices.

## Scope

- Add `field-engineering-depth` skill.
- Add `scripts/check-field-depth-report.sh`.
- Route complex debugging/performance/architecture tasks through the new skill.
- Update Superpowers field benchmark prompt and docs.
- Update roadmap/wiki/thread ledger.

## Non-Scope

- Do not solve the Tauri chat rendering problem in the target repo.
- Do not build a full profiler or benchmark harness in this plugin step.
- Do not remove existing debugging/research skills; this gate complements them.

## Files

- `skills/field-engineering-depth/SKILL.md`
- `scripts/check-field-depth-report.sh`
- `skills/using-methodology/SKILL.md`
- `skills/systematic-debugging/SKILL.md`
- `skills/web-and-github-research/SKILL.md`
- `skills/benchmark-against-superpowers/SKILL.md`
- `benchmarks/prompts/superpowers-field-battle.md`
- `docs/specs/superpowers-field-benchmark.md`
- `docs/wiki/*`
- `docs/roadmap.md`

## Verification

- `./scripts/check-field-depth-report.sh docs/examples/field-depth-report-template.md`
- `./scripts/benchmark-runner.sh --list`
- `./scripts/doctor.sh`
- `./scripts/memory-audit.sh`
- `./scripts/validate.sh`
- `./scripts/check-benchmark-artifacts.sh`
- `git diff --check`
- `diff -qr skills /Users/fabio/.codex/plugins/cache/personal/codersteroids/0.1.0/skills`
