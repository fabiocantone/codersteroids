# Known-Issues Gate Plan

## Goal

Add a CoderSteroids rule that stack, language, runtime, and library recommendations must include known-issue and mitigation research when the choice affects performance, rendering, deployment, security, or data durability.

## Scope

- Update recommendation and research skills.
- Add a benchmark prompt based on a Tauri AI chat rendering/performance risk scenario.
- Record source evidence and durable decision.
- Update roadmap, session state, and thread ledger.

## Non-Scope

- Do not choose the final Tauri/Electron/native stack for the user's separate app in this repo.
- Do not implement a runnable benchmark harness in this step.
- Do not claim every recommendation needs exhaustive issue mining; apply this gate to meaningful architectural or high-risk choices.

## Files

- `skills/recommendation-verification/SKILL.md`
- `skills/web-and-github-research/SKILL.md`
- `skills/context7-research/SKILL.md`
- `skills/using-methodology/SKILL.md`
- `benchmarks/prompts/known-issues-stack-recommendation.md`
- `docs/wiki/sources.md`
- `docs/wiki/decisions.md`
- `docs/wiki/session-state.md`
- `docs/wiki/thread-ledger.md`
- `docs/roadmap.md`

## Verification

- `./scripts/validate.sh`
- `./scripts/check-benchmark-artifacts.sh`
- `git diff --check`
