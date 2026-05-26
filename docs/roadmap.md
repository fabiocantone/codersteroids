# CoderSteroids Roadmap

## Active Goal

Build and validate the CoderSteroids plugin: bootstrap, Context7 research, roadmap-first planning, LLM Wiki memory, coding standards, folder docs, debugging, verification, post-task memory flush, global memory, subagent support, and benchmark artifacts.

## Current Phase

Phase 8-10 artifact implementation complete; Codex plugin install smoke test, partial recommendation-verification dry run, chat-continuity benchmark, local plugin cache skill refresh, three live benchmark scenarios, and skill ecosystem improvement research complete. Direct Superpowers comparison remains pending.

## Milestones

- [x] Create plugin scaffold.
- [x] Add MVP skill library.
- [x] Add extended skill library for global memory, subagents, and benchmarking.
- [x] Add standard roadmap/wiki/spec artifacts.
- [x] Add Context7 setup policy.
- [x] Add benchmark prompts and score template.
- [x] Add structural validation script.
- [x] Add benchmark artifact checker.
- [x] Run local structural validation.
- [x] Add recommendation verification gate after naming workflow failure.
- [x] Run recommendation-verification naming dry run.
- [x] Run validation in a real Codex plugin install.
- [x] Add chat-continuity skill and thread ledger.
- [x] Run chat-continuity benchmark in a fresh Codex chat.
- [x] Refresh or reinstall the local Codex plugin cache so installed skills include `chat-continuity`.
- [x] Run the three benchmark scenarios from `docs/specs/plugin-methodology-validation.md`.
- [x] Run full recommendation-verification test with GitHub account/org checks.
- [x] Add web/browser/GitHub similar-project research workflow.
- [x] Add skill ecosystem improvement research benchmark prompt.
- [x] Run skill ecosystem improvement research benchmark.
- [x] Add known-issues gate for stack and runtime recommendations.
- [ ] Compare results against Superpowers.

## Deferred Phases

- None at artifact level. Live validation and benchmark execution remain.

## Blockers

- Context7 availability depends on the user's Codex/MCP setup or local `ctx7` CLI.
- The plugin can guide behavior, but hard enforcement depends on the host agent following skill instructions.

## Recent Decisions

- Keep the MVP small instead of shipping a large untested skill set.
- Use Markdown-first memory instead of a vector database.
- Treat Context7 as preferred but not mandatory; official docs are the fallback.
- Do not commit a hardcoded Context7 MCP config or API key.
- Add global-memory and subagent support as skills, but require live testing before claiming behavioral superiority.
- After ecosystem research, prioritize skill lifecycle diagnostics, memory hygiene auditing, runnable benchmark execution, and cross-agent exports before adding broad workflow breadth.
- Stack, language, runtime, and library recommendations must check known issues and mitigations when the choice affects rendering, performance, deployment, security, or data durability.

## Next Action

Run `benchmarks/prompts/known-issues-stack-recommendation.md` against a Tauri AI chat scenario, then compare recorded CoderSteroids benchmark results against Superpowers and decide whether to implement `skill-lifecycle-doctor`, `memory-hygiene-audit`, and `benchmark-runner`.
