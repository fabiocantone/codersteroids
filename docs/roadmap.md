# CoderSteroids Roadmap

## Active Goal

Build and validate the CoderSteroids plugin: bootstrap, Context7 research, roadmap-first planning, LLM Wiki memory, coding standards, folder docs, debugging, verification, post-task memory flush, global memory, subagent support, and benchmark artifacts.

## Current Phase

Phase 8-10 artifact implementation complete; live benchmark still pending.

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
- [ ] Run validation in a real Codex plugin install.
- [ ] Run the three benchmark scenarios from `docs/specs/plugin-methodology-validation.md`.
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

## Next Action

Install or load the plugin in Codex, then run the benchmark prompts in `benchmarks/prompts/` and save scorecards under `benchmarks/results/`.
