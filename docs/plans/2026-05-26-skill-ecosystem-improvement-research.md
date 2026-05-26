# Skill Ecosystem Improvement Research Plan

## Goal

Run the skill ecosystem benchmark prompt using current web and GitHub research, then update benchmark and wiki artifacts with evidence-backed CoderSteroids improvement priorities.

## Scope

- Compare influential coding-agent instruction and workflow systems: Superpowers, AGENTS.md, OpenAI Codex-style instructions, Claude/Claude Code skills and memory, Cursor rules/memories, and selected memory/context tools.
- Verify current public metadata where relevant: repository activity, stars/forks, releases, and documentation dates when available.
- Look for repeated public user pain points in GitHub issues/discussions where available.
- Produce a benchmark result under `benchmarks/results/`.
- Update `docs/wiki/sources.md`, `docs/wiki/decisions.md`, `docs/wiki/session-state.md`, and `docs/wiki/thread-ledger.md`.

## Non-Scope

- Do not implement new CoderSteroids skills in this run.
- Do not claim market share from GitHub stars alone.
- Do not use private telemetry or unauthenticated guesses about closed-source products.

## Likely Files

- `benchmarks/results/2026-05-26-skill-ecosystem-improvement-research.md`
- `docs/wiki/sources.md`
- `docs/wiki/decisions.md`
- `docs/wiki/session-state.md`
- `docs/wiki/thread-ledger.md`
- `docs/plans/2026-05-26-skill-ecosystem-improvement-research.md`

## Verification

- `./scripts/validate.sh`
- `./scripts/check-benchmark-artifacts.sh`
- `git diff --check`
