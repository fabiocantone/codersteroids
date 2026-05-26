# Skill Lifecycle Doctor Plan

## Goal

Add a CoderSteroids doctor workflow that detects stale plugin installs, cache drift, duplicate or malformed skills, manifest/config mismatch, marketplace mismatch, and missing benchmark artifacts.

## Scope

- Add `skill-lifecycle-doctor` skill.
- Add a runnable script for local diagnostics.
- Wire the new skill/script into validation.
- Update README, folder docs, roadmap, wiki, and benchmark results.

## Non-Scope

- Do not auto-modify Codex config or marketplace files in the doctor.
- Do not print secrets or full config contents.
- Do not implement memory hygiene or benchmark runner in this step.

## Files

- `skills/skill-lifecycle-doctor/SKILL.md`
- `scripts/doctor.sh`
- `scripts/validate.sh`
- `README.md`
- `skills/FOLDER.md`
- `benchmarks/results/2026-05-26-known-issues-stack-recommendation.md`
- `benchmarks/results/2026-05-26-superpowers-comparison.md`
- `docs/wiki/*`
- `docs/roadmap.md`

## Verification

- `./scripts/doctor.sh`
- `./scripts/validate.sh`
- `./scripts/check-benchmark-artifacts.sh`
- `git diff --check`
- `diff -qr skills /Users/fabio/.codex/plugins/cache/personal/codersteroids/0.1.0/skills`
