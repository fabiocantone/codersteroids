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

2026-05-26: Ran the known-issues stack recommendation benchmark for a Tauri AI chat desktop app and saved `benchmarks/results/2026-05-26-known-issues-stack-recommendation.md`. Main result: recommend Electron first when smooth cross-platform chat rendering is core, unless Tauri's smaller/Rust/security profile matters more and a target-platform prototype validates rendering. Wails does not remove native-webview risk.

2026-05-26: Completed direct Superpowers comparison in `benchmarks/results/2026-05-26-superpowers-comparison.md`. Verdict: continue CoderSteroids narrowly for continuity/evidence/memory/diagnostics; do not try to beat Superpowers on broad TDD/review/worktree/subagent breadth.

2026-05-26: Implemented `skill-lifecycle-doctor` and `scripts/doctor.sh`. The first run correctly detected stale cached skills after adding the new skill, proving the diagnostic catches a real failure mode.

2026-05-26: Implemented `memory-hygiene-audit` and `scripts/memory-audit.sh`. The first run checked required wiki files, roadmap/session next actions, source row shape, duplicate decision headings, thread-ledger fields, page sizes, and stale markers.

2026-05-26: Implemented `benchmark-runner` and `scripts/benchmark-runner.sh`. The runner lists prompt slugs and creates non-overwriting benchmark result scaffolds with metadata, preflight checks, scorecard, notes, and embedded prompt.

2026-05-26: Updated strategy after user feedback: CoderSteroids should not merely stay narrow defensively; it must beat Superpowers in real field tasks. Added `docs/specs/superpowers-field-benchmark.md` and `benchmarks/prompts/superpowers-field-battle.md` to force paired fresh-session comparisons and gap-closing work.

2026-05-26: Recorded first Superpowers field battle on `/Users/fabio/Projects/local-first-personal-assistant` Tauri chat rendering performance. Result: numeric tie, but Superpowers wins technical-analysis depth. CoderSteroids wins durable memory and handoff. Next gap to close: add a field engineering depth gate requiring broader local flow inspection, secondary bottleneck pass, implementation-library research, and affected-slice verification.

2026-05-26: Implemented `field-engineering-depth` and `scripts/check-field-depth-report.sh`. The gate requires Local Flow Map, Primary Hypotheses, Secondary Bottlenecks, Implementation Library Research, Falsification Checks, Affected Verification Matrix, Decision And Next Step, and Durable Memory Updates. Updated routing, debugging, web research, Superpowers field battle prompt/spec, roadmap, and validation.

2026-05-26: Reviewed updated CoderSteroids Tauri chat rendering analysis after field-depth gate. The rerun corrected stale virtualization assumptions, produced local flow map, secondary bottlenecks, implementation library research, falsification checks, and a verification matrix. It now beats the prior Superpowers output on technical-analysis depth, but still loses on verification breadth and revealed target-repo portability gap: `scripts/check-field-depth-report.sh` exists in the plugin repo, not in `local-first-personal-assistant`.

2026-05-26: Implemented `project-bootstrap` and `scripts/project-bootstrap.sh`. It exports `scripts/codersteroids/check-field-depth-report.sh`, `docs/codersteroids/field-depth-report-template.md`, and `docs/codersteroids/README.md` into a target repo, refuses to overwrite drifted files, and supports `--check`.

2026-05-26: Ran project bootstrap in `/Users/fabio/Projects/local-first-personal-assistant`. Exported helpers were written and `scripts/codersteroids/check-field-depth-report.sh docs/codersteroids/field-depth-report-template.md` passed inside the target repo.

2026-05-26: Added `observability-logging` and made observability/logging a required section of field-depth reports. `check-field-depth-report.sh` now requires `## Observability And Logging Plan` and a signal/source/proves/gap/action table. Project bootstrap now supports `--force` so generated helpers can be refreshed in target repos.

2026-05-26: User clarified that `/Users/fabio/Projects/local-first-personal-assistant` is moving from Tauri to Electron, so it is no longer valid for fresh Tauri rendering tests. Keep prior Tauri findings as historical evidence only. Future tests in that repo should validate Electron rendering behavior; any new Tauri-specific comparison needs a separate Tauri fixture or target repo.

2026-05-26: Implemented `prompt-briefing` so users can write short natural requests and have CoderSteroids produce execution-ready prompts for Codex, Claude, subagents, reviewers, or benchmarks. The skill requires a draft prompt, assumptions, missing context, and approval/edit request for broad or risky work. Added a prompt-briefing benchmark prompt and routed ambiguous short task briefs through the skill.

## Next Action

Run the prompt-briefing benchmark, then use that approval flow to define and run the Electron field benchmark for `local-first-personal-assistant`.

## Risks

- Context7 may not be configured in the host environment.
- Skill behavior needs live agent testing; static validation only checks structure.
- Superpowers comparison is still pending.
