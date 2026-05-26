# Memory Hygiene Audit Plan

## Goal

Add a CoderSteroids memory audit workflow that detects missing wiki files, missing next action, oversized memory pages, duplicate decision headings, incomplete source entries, incomplete thread-ledger handoffs, and stale validation markers.

## Scope

- Add `memory-hygiene-audit` skill.
- Add `scripts/memory-audit.sh`.
- Wire the skill/script into validation and docs.
- Update roadmap/wiki/thread ledger.

## Non-Scope

- Do not rewrite wiki content automatically.
- Do not implement vector memory, semantic contradiction detection, or global-memory audits in this step.
- Do not remove historical entries merely because they mention old project names.

## Files

- `skills/memory-hygiene-audit/SKILL.md`
- `scripts/memory-audit.sh`
- `scripts/validate.sh`
- `README.md`
- `skills/FOLDER.md`
- `docs/wiki/architecture.md`
- `docs/roadmap.md`
- `docs/wiki/session-state.md`
- `docs/wiki/thread-ledger.md`

## Verification

- `./scripts/memory-audit.sh`
- `./scripts/doctor.sh`
- `./scripts/validate.sh`
- `./scripts/check-benchmark-artifacts.sh`
- `git diff --check`
- `diff -qr skills /Users/fabio/.codex/plugins/cache/personal/codersteroids/0.1.0/skills`
