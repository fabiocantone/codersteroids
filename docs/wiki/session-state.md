# Session State

## Current Goal

Build and validate the CoderSteroids plugin MVP.

## Active Plan

Use `docs/roadmap.md` and `docs/specs/plugin-methodology-validation.md`.

## Last Verified State

2026-05-26: Added `recommendation-verification` to prevent unverified suggestions for names, tools, services, libraries, domains, and other availability-dependent options.

2026-05-26: `./scripts/validate.sh` initially failed because the external plugin validator imports PyYAML and bare `python3` had no `yaml` module. Added a bootstrap fallback through `uv run --with PyYAML`; `./scripts/validate.sh` and `./scripts/check-benchmark-artifacts.sh` now pass. The recommendation-verification naming dry run filtered unavailable/conflicting names before presenting recommendations, but it was partial because GitHub account/org availability was out of scope; see `benchmarks/results/2026-05-26-recommendation-verification.md`.

2026-05-26: Added `chat-continuity` and `docs/wiki/thread-ledger.md` so separate Codex chats can resume from durable project memory instead of implicit chat history.

2026-05-26: Ran the chat-continuity benchmark in a fresh Codex chat using the prompt in `benchmarks/prompts/chat-continuity.md`. The run passed the project-memory recovery criteria and saved `benchmarks/results/2026-05-26-chat-continuity.md`. The repository has `skills/chat-continuity/SKILL.md`; the cached installed plugin initially did not expose that skill, so the local cache at `/Users/fabio/.codex/plugins/cache/personal/codersteroids/0.1.0/skills` was refreshed from the repository and verified with `diff -qr`.

2026-05-26: Ran the full recommendation-verification test with GitHub account/org availability and exact repository-name conflict checks. The assistant returned only verified names and stated API limitations. Independent verification confirmed all 10 names returned account/org 404 and no exact repo-name matches; see `benchmarks/results/2026-05-26-recommendation-verification-full.md`.

2026-05-26: Added `web-and-github-research` to make browser/search/GitHub-similar-project research explicit. Recorded the three original benchmark scenarios as result files and updated source ledger with Playwright and Google Programmable Search docs.

2026-05-26: Ran live similar-project research for CoderSteroids using web search and GitHub API checks. Exact-name GitHub search found only `fabiocantone/codersteroids`, but adjacent projects are active: Superpowers, ADD, SpecMem, Jumbo, agentmemory, AGENTS.md, and multiple skill-library/port projects. Conclusion: CoderSteroids is meaningfully different only as a small Codex-focused composition around roadmap/wiki/current-doc verification, not as a wholly novel category.

2026-05-26: Independently verified similar-project metadata with GitHub API and recorded `benchmarks/results/2026-05-26-web-similar-project-research.md`. Notable confirmed values: `obra/superpowers` had 207090 stars and release `v5.1.0`; `agentsmd/agents.md` had 21695 stars; `fabiocantone/codersteroids` had 0 stars/forks and no release/license reported by API.

2026-05-26: Added `benchmarks/prompts/skill-ecosystem-improvement-research.md` to test whether CoderSteroids can research popular coding-agent skill systems, public user pain points, and improvement opportunities before proposing roadmap changes.

2026-05-26: Ran the skill ecosystem improvement research benchmark using current web docs, GitHub API metadata, and public issue searches. Saved `benchmarks/results/2026-05-26-skill-ecosystem-improvement-research.md`. Main conclusion: CoderSteroids should not chase breadth; the highest-value next work is skill lifecycle diagnostics, memory hygiene auditing, runnable benchmark execution, cross-agent exports, repo/docs mapping, and stricter current-doc checks. Public pain points repeatedly involved lost context after compaction, stale/conflicting memory, instruction non-adherence, duplicate/ambiguous skill loading, weak versioning/locking, cross-agent rule duplication, and missing memory/skill evals.

2026-05-26: Added a known-issues gate after the user reported a Tauri AI chat rendering/performance problem. `recommendation-verification`, `web-and-github-research`, `context7-research`, and `using-methodology` now require known-issue and mitigation checks when stack/runtime/library choices affect performance, rendering, deployment, security, or data durability. Added `benchmarks/prompts/known-issues-stack-recommendation.md` to test a Tauri AI chat stack recommendation workflow.

## Next Action

Run the known-issues stack recommendation benchmark, then run the direct Superpowers comparison and decide whether to implement `skill-lifecycle-doctor`, `memory-hygiene-audit`, and `benchmark-runner` as the next CoderSteroids expansion.

## Risks

- Context7 may not be configured in the host environment.
- Skill behavior needs live agent testing; static validation only checks structure.
- Superpowers comparison is still pending.
