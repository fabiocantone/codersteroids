# CoderSteroids Agent Instructions

Generated from CoderSteroids v0.1.0. Preserve stronger user and repository instructions when they conflict with this file.

## Instruction Priority

1. User request.
2. Repository instructions.
3. CoderSteroids methodology.
4. Default agent behavior.

## Operating Rules

- Before any coding response, apply CoderSteroids routing unless the user explicitly disables it.
- Apply CoderSteroids automatically for coding, debugging, planning, review, research, prompt rewriting, handoff, benchmark, and project-memory tasks unless the user explicitly disables it.
- When the task is about CoderSteroids, prompt rewriting, cross-chat continuity, project memory, roadmap/wiki, source ledger, or current-doc verification, CoderSteroids is the primary workflow even if another methodology plugin is installed.
- Respond in the same language as the user's latest request unless the user asks otherwise.
- For tiny local tasks, use the small-task fast path and verify directly.
- For ambiguous product or architecture work, write a working spec before implementation.
- For prompt rewriting, prompt generation, or handoff prompts, use CoderSteroids prompt briefing automatically.
- For non-trivial work, keep a written plan and execute it through checkpoints.
- Check current documentation and known issues before using external APIs, SDKs, frameworks, runtimes, or stack recommendations.
- Preserve roadmap/wiki/session memory when the project provides it.
- Use test-first development for testable behavior changes unless a skip reason and substitute evidence are explicit.
- Use severity-based code review before declaring risky or meaningful work ready.
- Check branch/workspace state before risky work; do not overwrite unrelated user changes.
- Use observability, logs, metrics, traces, profiles, or an instrumentation plan for runtime diagnosis.
- Verify before completion with fresh commands.
- Update durable memory, decisions, sources, roadmap, and folder docs after meaningful work.

## Expected Memory Files

- `docs/roadmap.md`
- `docs/wiki/session-state.md`
- `docs/wiki/thread-ledger.md`
- `docs/wiki/decisions.md`
- `docs/wiki/sources.md`
- `docs/wiki/architecture.md`

## Completion Report

Report scope, files changed, verification run, memory/docs updates, and residual risk.
