# Benchmark Run

## Metadata

- Date: 2026-05-26
- Runner: Codex with CoderSteroids
- Methodology: CoderSteroids `using-methodology`, `web-and-github-research`, `benchmark-against-superpowers`, `llm-wiki-memory`
- Scenario: Skill ecosystem improvement research

## Research Summary

**Date checked:** 2026-05-26

**Question:** What should CoderSteroids improve after comparing current coding-agent skill systems, instruction formats, workflow plugins, memory/context tools, and public user requests?

**Primary sources checked:** OpenAI Codex docs, Anthropic Claude Code docs, Agent Skills spec, AGENTS.md site and repo, Cursor docs/search result, Continue docs, Cline docs, GitHub repo metadata and issue search through GitHub API/`gh api`.

**Limitations:** GitHub stars/forks and open issue counts are popularity/activity proxies, not usage telemetry. Cursor docs rendered poorly through static fetch, so Cursor rules/memories conclusions rely on search-indexed official docs snippets plus visible route metadata. Some products are closed-source; only public docs and public issues were inspected. GitHub issue search was keyword-based, so it may miss differently worded requests.

## Ecosystem Snapshot

Repository metadata was checked via GitHub API on 2026-05-26.

| System | Repo | Stars | Forks | Latest release | Last push | Relevance |
| --- | --- | ---: | ---: | --- | --- | --- |
| Superpowers | https://github.com/obra/superpowers | 207109 | 18440 | v5.1.0, 2026-05-04 | 2026-05-24 | Most directly comparable methodology/skills framework. |
| OpenAI Codex | https://github.com/openai/codex | 85767 | 12521 | rust-v0.133.0, 2026-05-21 | 2026-05-26 | Native Codex host for AGENTS.md, plugins, and skills. |
| Claude Code | https://github.com/anthropics/claude-code | 126615 | 20759 | v2.1.150, 2026-05-23 | 2026-05-23 | Strong memory, skills, hooks, plugins, subagents. |
| Agent Skills spec | https://github.com/agentskills/agentskills | 19373 | 1187 | no GitHub release found | 2026-05-20 | Cross-tool skill format. |
| AGENTS.md | https://github.com/agentsmd/agents.md | 21694 | 1586 | no GitHub release found | 2026-03-12 | Open repository instruction format. |
| Cline | https://github.com/cline/cline | 62337 | 6522 | v3.85.0, 2026-05-25 | 2026-05-25 | Memory Bank, planning/acting, IDE agent workflows. |
| Roo Code | https://github.com/RooCodeInc/Roo-Code | 24152 | 3271 | v3.54.0, 2026-05-15 | 2026-05-15 | Multi-mode IDE agent and memory-bank-adjacent workflows. |
| Continue | https://github.com/continuedev/continue | 33387 | 4562 | v1.2.22-vscode, 2026-03-27 | 2026-05-26 | Rules, prompts, hub sharing, checks. |
| Aider | https://github.com/Aider-AI/aider | 45338 | 4483 | v0.86.0, 2025-08-09 | 2026-05-22 | Repo map/code navigation precedent. |
| Mem0 | https://github.com/mem0ai/mem0 | 56732 | 6472 | cli-v0.2.7, 2026-05-20 | 2026-05-26 | General agent memory layer. |
| Graphiti | https://github.com/getzep/graphiti | 26561 | 2641 | v0.29.1, 2026-05-21 | 2026-05-21 | Temporal knowledge graph memory. |
| SpecMem | https://github.com/SuperagenticAI/specmem | 24 | 4 | no GitHub release found | 2026-05-26 | Adjacent unified coding-agent memory idea. |
| Jumbo CLI | https://github.com/jumbocontext/jumbo.cli | 83 | 6 | 3.2.1, 2026-05-25 | 2026-05-26 | Adjacent context/memory orchestration. |
| ADD | https://github.com/MountainUnicorn/add | 11 | 5 | v0.9.5, 2026-04-30 | 2026-04-30 | Agent-driven development/TDD orchestration. |

## Repeated Pain Points From Public Issues

- Lost or degraded context after compaction: Claude Code issues include requests to exempt `CLAUDE.md` or auto-memory from compaction and reports of terminal/session details lost after compaction. Examples: https://github.com/anthropics/claude-code/issues/44166, https://github.com/anthropics/claude-code/issues/62316, https://github.com/anthropics/claude-code/issues/60526.
- Persistent instructions are advisory and can be violated: Claude Code issue https://github.com/anthropics/claude-code/issues/51728 reports repeated violations of `CLAUDE.md` or memory rules. Claude docs also say hooks are needed for lifecycle-critical enforcement.
- Skill install/update/discovery behavior is brittle: Codex issues request a team Skill Hub and report explicit skill invocation/disabling edge cases: https://github.com/openai/codex/issues/24517, https://github.com/openai/codex/issues/23454, https://github.com/openai/codex/issues/23987. Claude Code issues report plugin skill duplicate loading and install schema rejection: https://github.com/anthropics/claude-code/issues/60375, https://github.com/anthropics/claude-code/issues/60884. Agent Skills has a versioning/locking request at https://github.com/agentskills/agentskills/issues/46.
- Cross-agent instruction duplication is unresolved: AGENTS.md issues ask for agent-specific variants and a standardized rule directory because teams duplicate the same conventions across `.claude/rules`, `.cursor/rules`, and other formats: https://github.com/agentsmd/agents.md/issues/185, https://github.com/agentsmd/agents.md/issues/179.
- Memory quality needs evals, not vibes: Mem0 issue https://github.com/mem0ai/mem0/issues/5235 asks for memory quality/retrieval evaluation because stale or conflicting memory silently hurts agents.
- Memory-bank protocol adherence can fail: Cline issue https://github.com/cline/cline/issues/2097 reports loss of Memory Bank protocol adherence after task completion.
- Code navigation over Markdown/docs is still a gap: Aider issue https://github.com/Aider-AI/aider/issues/965 requests Markdown parser support in repository maps so documentation structure can become context alongside code.
- Superpowers users are asking for memory/context improvements: https://github.com/obra/superpowers/issues/551 requests project memory, and https://github.com/obra/superpowers/issues/1503 requests phase-based context resets.

## What CoderSteroids Should Improve

1. Add first-class skill lifecycle hygiene: a `doctor`/sync workflow that detects stale installed caches, duplicate skills, missing local cache refreshes, unsupported host formats, and version drift.
2. Make memory hygiene explicit: define what belongs in session state, thread ledger, decisions, sources, and long-term global memory; add audits for stale, duplicated, or contradicted memory.
3. Turn benchmarks into a runnable harness: keep the Markdown scorecards, but add scripts that run prompts, capture source checks, and fail when benchmark/wiki artifacts are missing.
4. Improve cross-agent portability: generate or validate `AGENTS.md`, `CLAUDE.md` import wrappers, `.cursor/rules`, `.continue/rules`, and Cline-style memory-bank exports from the same CoderSteroids wiki.
5. Add current-doc enforcement for volatile APIs: keep source-ledger requirements, but make stale-doc/API checks easier to execute and verify.
6. Improve code and docs navigation: add a lightweight repo/docs map workflow so agents can find relevant folders, Markdown memory, and source files before editing.

## Already Solved Well Elsewhere

- AGENTS.md solves the lowest-friction, cross-agent repository instruction file. Its site claims use in 60k+ open-source projects and lists many compatible agents.
- Agent Skills, Codex skills, and Claude Code skills solve progressive-disclosure workflow packaging well: discover name/description first, load full `SKILL.md` only when relevant.
- Claude Code has the strongest documented memory stack: scoped `CLAUDE.md`, rules, imports, auto memory, `/memory`, and documented troubleshooting.
- Cursor and Continue already solve scoped rules and team-sharing primitives better than CoderSteroids currently does. Continue has local `.continue/rules` plus Hub Rules.
- Cline Memory Bank solves a clear structured Markdown memory pattern for projectbrief/product context/active context/progress, including explicit context-window handoff commands.
- Aider has a strong precedent for codebase navigation through repository maps.
- Mem0 and Graphiti are stronger than CoderSteroids for general-purpose runtime memory retrieval and knowledge-graph memory.
- OpenAI's evals guidance for agent skills already frames skill improvement as prompt plus trace/artifacts plus checks plus score.

## Unique Opportunities For CoderSteroids

- Be the small, Codex-first methodology that ties skills, roadmap, wiki memory, source ledger, and benchmark evidence into one low-runtime-overhead package.
- Provide memory hygiene that is human-auditable by default: Markdown pages with explicit ownership and write rules, not opaque vector memory.
- Build cross-agent export/adapters without trying to replace host-native systems: keep CoderSteroids as the source of durable project knowledge and generate the host-specific instruction/rule surfaces.
- Focus on "evidence before claims" as a product-level differentiator: every recommendation, benchmark, and external-library decision should carry dated source evidence and limitations.
- Add install/update/cache diagnostics, because public issues show that even mature host systems still have confusing skill lifecycle behavior.

## Build Next, Priority Order

1. `skill-lifecycle-doctor`: validate installed plugin/cache state, duplicate skill names, stale cache vs repo, host support, and skill metadata/version hints.
2. `memory-hygiene-audit`: scan wiki/thread ledger/global memory for stale dates, contradictions, oversized pages, missing next action, and missing source links.
3. `benchmark-runner`: script or skill that creates benchmark result files from prompts, records source checks, and updates roadmap/wiki state.
4. `cross-agent-export`: generate AGENTS.md/CLAUDE.md/.cursor rules/.continue rules/Cline memory-bank views from the CoderSteroids wiki without duplicating source truth.
5. `repo-docs-map`: index folder docs, Markdown memory, and key source files so agents can navigate large repos before editing.
6. `current-doc-check`: tighten `context7-research` and `web-and-github-research` into a reusable dated evidence checklist for volatile APIs and tool recommendations.
7. `Superpowers comparison`: complete the pending direct comparison, but evaluate CoderSteroids on the areas it targets rather than on breadth of available skills.

## Scorecard

| Dimension | Score 0-2 | Evidence |
| --- | ---: | --- |
| Current docs used before code | 2 | Checked official OpenAI, Anthropic, Agent Skills, AGENTS.md, Continue, Cline docs plus GitHub API on 2026-05-26. |
| Written plan before implementation | 2 | Added `docs/plans/2026-05-26-skill-ecosystem-improvement-research.md` before repository edits. |
| Roadmap updated | 2 | Roadmap updated after benchmark execution. |
| Wiki memory updated | 2 | Sources, decisions, session state, and thread ledger updated. |
| Decisions reused after interruption | 2 | Used existing next action from session state/thread ledger and prior decision to avoid category-unique claims. |
| Verification evidence provided | 2 | `./scripts/validate.sh`, `./scripts/check-benchmark-artifacts.sh`, and `git diff --check` passed. |
| Folder/code standards respected | 2 | Used existing benchmark result and wiki conventions; no unrelated refactor. |
| Overhead acceptable | 1 | Research was necessarily heavier than normal work; useful for roadmap decisions, too much for routine feature work. |

## Go/No-Go Implication

Go for focused expansion. CoderSteroids should not try to out-breadth Superpowers or out-memory Mem0/Graphiti. It should improve the evidence-first Codex workflow around lifecycle diagnostics, memory hygiene, benchmark execution, and cross-agent exports.
