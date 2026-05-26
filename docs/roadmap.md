# CoderSteroids Roadmap

## Active Goal

Build and validate the CoderSteroids plugin: bootstrap, Context7 research, roadmap-first planning, LLM Wiki memory, coding standards, folder docs, debugging, verification, post-task memory flush, global memory, subagent support, and benchmark artifacts.

## Current Phase

Phase 8-10 artifact implementation complete; Codex plugin install smoke test, recommendation-verification, chat-continuity, known-issues stack recommendation, direct Superpowers comparison, skill ecosystem improvement research, and updated Superpowers repo/plugin gap analysis complete. Skill lifecycle doctor, memory hygiene audit, benchmark runner, field engineering depth gate, observability/logging gate, project bootstrap, prompt briefing, self-improvement loop, pragmatic test-first development, code review discipline, branch/workspace lifecycle, small-task fast path, subagent execution controller, spec discovery, plan execution checkpoints, skill authoring pressure tests, and cross-agent export implemented. Latest strategic position: CoderSteroids covers the practical local methodology gaps with Superpowers while preserving stronger evidence, memory, current-doc, and continuity behavior.

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
- [x] Run known-issues stack recommendation benchmark.
- [x] Compare results against Superpowers.
- [x] Implement `skill-lifecycle-doctor`.
- [x] Implement `memory-hygiene-audit`.
- [x] Implement `benchmark-runner`.
- [x] Run first Superpowers field battle on Tauri chat rendering.
- [x] Add field engineering depth gate.
- [x] Rerun CoderSteroids Tauri chat rendering analysis with field-depth gate.
- [x] Add project bootstrap/export for CoderSteroids validation helpers.
- [x] Add observability/logging gate for runtime diagnosis.
- [x] Add prompt briefing for short request to execution-prompt workflows.
- [x] Add self-improvement loop benchmark and skill.
- [x] Run the self-improvement benchmark against a real recent gap.
- [x] Run updated Superpowers repository/plugin/methodology gap analysis.
- [x] Add pragmatic TDD/code-review gap-closing path.
- [x] Add branch/workspace lifecycle gap-closing path.
- [x] Add small-task fast path to reduce overhead.
- [x] Add subagent execution controller.
- [x] Add dirty-worktree lifecycle benchmark evidence.
- [x] Add benchmark runner `--check` path.
- [x] Add spec discovery workflow.
- [x] Add plan execution checkpoint workflow.
- [x] Add skill authoring pressure-test workflow.
- [x] Add cross-agent AGENTS.md/CLAUDE.md export path.
- [x] Add skill routing smoke test.

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
- `/Users/fabio/Projects/local-first-personal-assistant` is no longer a valid Tauri rendering test target because the app is moving to Electron. Use it for Electron rendering validation only; use a separate Tauri fixture or historical result for Tauri-specific comparisons.
- Short user briefs for broad work should be compiled into an execution prompt with assumptions, missing context, and approval before running in Codex, Claude, subagents, or benchmark sessions.
- Self-improvement must be evidence-backed: choose one gap, implement one scoped change, verify, and record before/after behavior.
- Self-improvement benchmark results must include gap, change, expected behavior, before evidence, after evidence, and an explicit verdict; the benchmark artifact checker enforces this shape.
- CoderSteroids should selectively adapt Superpowers' TDD, code review, worktree/branch, and subagent execution ideas, but should not copy Superpowers' full breadth or always-on rigidity.
- Test-first and code-review workflows are now structurally implemented, but still need a live benchmark run before claiming field parity with Superpowers.
- Branch/workspace lifecycle is implemented and benchmarked on clean finish and dirty-parent isolation paths.
- Subagent execution controller is implemented and structurally benchmarked, but real multi-agent execution still depends on host tooling.
- Public adoption, issue volume, and multi-harness maturity remain outside the scope of a local plugin implementation.
- Local methodology gap coverage is complete at the artifact/skill/script level. Remaining gaps are external: public adoption, marketplace distribution, and host runtime capabilities.

## Next Action

Keep CoderSteroids stable; next engineering work can return to product-specific tasks such as the Electron `bench:chat-render` harness.
