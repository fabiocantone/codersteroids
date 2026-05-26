# Thread Ledger

This file preserves continuity across separate Codex chats. It is not a transcript; it is the handoff record future chats must read.

## 2026-05-26: Plugin Rename And Publish

**Intent:** Rename the plugin from the temporary methodology name to CoderSteroids and publish it.

**Completed:** Updated plugin id/display name, marketplace config, local symlink, GitHub remote, and pushed the initial repository.

**Changed:** `.codex-plugin/plugin.json`, `README.md`, docs, marketplace config outside the repo, and Git remote setup.

**Decisions:** Product/display name is `CoderSteroids`; plugin id is `codersteroids`.

**Verification:** Plugin validation and benchmark artifact checks passed before push.

**Next:** Run live behavior benchmarks with the installed plugin.

## 2026-05-26: First CoderSteroids Continuity Test

**Intent:** Test whether a fresh Codex chat with CoderSteroids can resume from project memory instead of chat history.

**Completed:** The agent read roadmap/session state, followed the saved next action, fixed `scripts/validate.sh` to handle missing PyYAML via `uv run --with PyYAML`, and recorded a partial recommendation-verification dry run.

**Changed:** `scripts/validate.sh`, `docs/roadmap.md`, `docs/wiki/session-state.md`, `docs/wiki/sources.md`, and `benchmarks/results/2026-05-26-recommendation-verification.md`.

**Decisions:** Mark the naming dry run as partial because it did not include GitHub account/org availability.

**Verification:** `./scripts/validate.sh`, `./scripts/check-benchmark-artifacts.sh`, and `git diff --check` passed.

**Next:** Add explicit chat-continuity support so future Codex chats always read and write a cross-chat handoff ledger.

## 2026-05-26: Chat Continuity Benchmark Run

**Intent:** Continue from a fresh chat using only CoderSteroids project memory and the thread ledger, then record the benchmark result.

**Completed:** Read `docs/roadmap.md`, `docs/wiki/session-state.md`, `docs/wiki/thread-ledger.md`, the active validation spec, and the MVP plan; ran the chat-continuity benchmark; saved the result scorecard; refreshed the local cached plugin `skills/` tree from the repository.

**Changed:** `benchmarks/results/2026-05-26-chat-continuity.md`, `docs/roadmap.md`, `docs/wiki/session-state.md`, `docs/wiki/thread-ledger.md`, and `/Users/fabio/.codex/plugins/cache/personal/codersteroids/0.1.0/skills`.

**Decisions:** Treat this benchmark as passed for project-memory recovery. The local installed cache was refreshed so future chats can discover the repo's `chat-continuity` skill.

**Verification:** `diff -qr skills /Users/fabio/.codex/plugins/cache/personal/codersteroids/0.1.0/skills`, `./scripts/validate.sh`, `./scripts/check-benchmark-artifacts.sh`, and `git diff --check` passed.

**Next:** Run the three benchmark prompts and full recommendation-verification test.

## 2026-05-26: Full Recommendation Verification Run

**Intent:** Test whether CoderSteroids filters naming recommendations before presenting them when GitHub availability is required.

**Completed:** Ran a fresh naming prompt requiring GitHub account/org availability and no exact repo-name conflicts. The assistant returned 10 verified names and excluded unverified options. Independent API verification confirmed the results.

**Changed:** `benchmarks/results/2026-05-26-recommendation-verification-full.md`, `docs/roadmap.md`, `docs/wiki/session-state.md`, and `docs/wiki/thread-ledger.md`.

**Decisions:** Treat this as a pass for `recommendation-verification` behavior on GitHub account/org plus exact repo-name checks.

**Verification:** Independent GitHub API checks confirmed all 10 suggested names returned account/org 404 and no exact repo-name match.

**Next:** Run the three main benchmark prompts and then compare against Superpowers.

## 2026-05-26: Web Research Skill And Benchmark Result Set

**Intent:** Complete the three pending benchmark result files and add explicit web/browser/GitHub similar-project research behavior.

**Completed:** Added `web-and-github-research`, a benchmark prompt for similar-project research, and result files for external-library research, multi-step bugfix, and interrupted-session recovery.

**Changed:** `skills/web-and-github-research/SKILL.md`, benchmark prompts/results, source ledger, decisions, session state, and validation script.

**Decisions:** Use Context7 and official docs first; use GitHub search for similar projects; use Google/search engines only when configured; use Playwright/browser automation when rendering or interaction matters.

**Verification:** `./scripts/validate.sh`, `./scripts/check-benchmark-artifacts.sh`, and `git diff --check` passed after adding the skill and benchmark result files.

**Next:** Run validation and compare CoderSteroids results against Superpowers.

## 2026-05-26: Similar Project Research Benchmark

**Intent:** Validate whether CoderSteroids can research similar projects and avoid overclaiming uniqueness.

**Completed:** Verified GitHub metadata for Superpowers, ADD, SpecMem, Jumbo, AGENTS.md, and CoderSteroids; recorded a benchmark result with positioning and limitations.

**Changed:** `benchmarks/results/2026-05-26-web-similar-project-research.md`, `docs/wiki/sources.md`, `docs/wiki/session-state.md`, and `docs/wiki/thread-ledger.md`.

**Decisions:** Treat CoderSteroids as a focused Codex-first composition, not a category-unique agent methodology.

**Verification:** GitHub API checks confirmed metadata; `./scripts/validate.sh`, `./scripts/check-benchmark-artifacts.sh`, and `git diff --check` passed after file updates.

**Next:** Run validation, then complete the Superpowers comparison.

## 2026-05-26: Skill Ecosystem Improvement Benchmark Prompt

**Intent:** Add a benchmark that asks CoderSteroids to research popular coding-agent skill systems and public user requests before proposing improvements.

**Completed:** Added `benchmarks/prompts/skill-ecosystem-improvement-research.md` and wired it into validation.

**Changed:** `benchmarks/prompts/skill-ecosystem-improvement-research.md`, `scripts/validate.sh`, `docs/roadmap.md`, `docs/wiki/session-state.md`, and `docs/wiki/thread-ledger.md`.

**Decisions:** The test must require current web/GitHub evidence, issue/discussion signals where available, source limitations, and a prioritized improvement roadmap.

**Verification:** `./scripts/validate.sh`, `./scripts/check-benchmark-artifacts.sh`, and `git diff --check` passed after file updates.

**Next:** Run validation, then execute the new benchmark prompt in a fresh Codex chat.

## 2026-05-26: Skill Ecosystem Improvement Research Run

**Intent:** Execute the skill ecosystem improvement benchmark using current web and GitHub evidence.

**Completed:** Checked official docs for OpenAI Codex AGENTS.md/skills/evals, Claude Code memory/skills, Agent Skills, AGENTS.md, Continue rules, Cline Memory Bank, and Cursor docs where available. Verified GitHub metadata for major adjacent systems and searched public issues for recurring pain points.

**Changed:** `benchmarks/results/2026-05-26-skill-ecosystem-improvement-research.md`, `docs/plans/2026-05-26-skill-ecosystem-improvement-research.md`, `docs/wiki/sources.md`, `docs/wiki/decisions.md`, `docs/wiki/session-state.md`, `docs/wiki/thread-ledger.md`, and `docs/roadmap.md`.

**Decisions:** Prioritize skill lifecycle diagnostics, memory hygiene auditing, runnable benchmark execution, and cross-agent exports before adding broad new workflow skills.

**Verification:** `./scripts/validate.sh`, `./scripts/check-benchmark-artifacts.sh`, and `git diff --check` passed.

**Next:** Complete the direct Superpowers comparison.

## 2026-05-26: Known-Issues Gate For Stack Recommendations

**Intent:** Add the user's Tauri AI chat rendering/performance lesson to CoderSteroids so stack recommendations check known problems before proposing a language/runtime/library.

**Completed:** Researched Tauri webview/version docs and GitHub issue signals, then updated recommendation, web research, Context7, and methodology routing skills. Added a benchmark prompt for Tauri AI chat stack recommendations.

**Changed:** `skills/recommendation-verification/SKILL.md`, `skills/web-and-github-research/SKILL.md`, `skills/context7-research/SKILL.md`, `skills/using-methodology/SKILL.md`, `benchmarks/prompts/known-issues-stack-recommendation.md`, `docs/plans/2026-05-26-known-issues-gate.md`, `docs/wiki/sources.md`, `docs/wiki/decisions.md`, `docs/wiki/session-state.md`, `docs/wiki/thread-ledger.md`, `docs/roadmap.md`, and `scripts/validate.sh`.

**Decisions:** Stack and runtime recommendations now need known-issue and mitigation research when they affect rendering, performance, deployment, security, or data durability.

**Verification:** `./scripts/validate.sh`, `./scripts/check-benchmark-artifacts.sh`, `git diff --check`, and `diff -qr skills /Users/fabio/.codex/plugins/cache/personal/codersteroids/0.1.0/skills` passed after edits and cache sync.

**Next:** Run the known-issues stack recommendation benchmark, then complete the direct Superpowers comparison.

## 2026-05-26: Benchmark, Superpowers Comparison, And Lifecycle Doctor

**Intent:** Continue from the roadmap and start turning CoderSteroids into a stronger programming tool through benchmark evidence and lifecycle diagnostics.

**Completed:** Ran and recorded the known-issues stack recommendation benchmark. Compared recorded CoderSteroids evidence against local installed Superpowers skills and GitHub metadata. Implemented `skill-lifecycle-doctor` plus `scripts/doctor.sh`, `memory-hygiene-audit` plus `scripts/memory-audit.sh`, and `benchmark-runner` plus `scripts/benchmark-runner.sh`.

**Changed:** `skills/skill-lifecycle-doctor/SKILL.md`, `skills/memory-hygiene-audit/SKILL.md`, `skills/benchmark-runner/SKILL.md`, `scripts/doctor.sh`, `scripts/memory-audit.sh`, `scripts/benchmark-runner.sh`, `scripts/validate.sh`, `scripts/check-benchmark-artifacts.sh`, benchmark results, README, skills folder docs, roadmap, architecture, sources, decisions, session state, and this ledger.

**Decisions:** Continue CoderSteroids narrowly as a Codex-first continuity/evidence/memory/diagnostics layer. Superpowers remains stronger for broad TDD/review/worktree/subagent workflows.

**Verification:** `./scripts/benchmark-runner.sh --list`, `./scripts/doctor.sh`, `./scripts/memory-audit.sh`, `./scripts/validate.sh`, `./scripts/check-benchmark-artifacts.sh`, `git diff --check`, and `diff -qr skills /Users/fabio/.codex/plugins/cache/personal/codersteroids/0.1.0/skills` passed after cache sync.

**Next:** Run the full verification suite in a fresh session, then consider `cross-agent-export` or `repo-docs-map`.

## 2026-05-26: Superpowers Field Battle Strategy

**Intent:** Incorporate user feedback that CoderSteroids should beat Superpowers in field usage, not merely occupy a narrower niche.

**Completed:** Updated the Superpowers benchmark skill, added `benchmarks/prompts/superpowers-field-battle.md`, added `docs/specs/superpowers-field-benchmark.md`, and updated roadmap/session/decisions to make paired fresh-session field wins the target.

**Changed:** `skills/benchmark-against-superpowers/SKILL.md`, benchmark prompt/spec, validation scripts, roadmap, decisions, session state, and this ledger.

**Decisions:** CoderSteroids must aim to win aggregate real-task outcomes against Superpowers; losses become gap-closing roadmap items.

**Verification:** `./scripts/benchmark-runner.sh --list`, `./scripts/doctor.sh`, `./scripts/memory-audit.sh`, `./scripts/validate.sh`, `./scripts/check-benchmark-artifacts.sh`, `git diff --check`, and `diff -qr skills /Users/fabio/.codex/plugins/cache/personal/codersteroids/0.1.0/skills` passed after cache sync.

**Next:** Run paired CoderSteroids vs Superpowers field benchmark sessions.

## 2026-05-26: First Superpowers Field Battle Result

**Intent:** Score the pasted CoderSteroids vs Superpowers outputs for the Tauri AI chat rendering/performance analysis.

**Completed:** Reviewed the pasted outputs and specific documents left in `/Users/fabio/Projects/local-first-personal-assistant`: `docs/plans/2026-05-26-chat-rendering-performance.md`, `docs/benchmarks/chat-rendering-performance.md`, `docs/work-memory.md`, and `docs/architecture/final-roadmap.md`.

**Changed:** Added `benchmarks/results/2026-05-26-superpowers-field-battle-chat-rendering.md` and updated roadmap, session state, decisions, and this ledger.

**Decisions:** Treat the battle as a numeric tie but not a CoderSteroids win. Superpowers was technically deeper; CoderSteroids had better memory/handoff. Next gap to close is field engineering depth.

**Verification:** `./scripts/benchmark-runner.sh --list`, `./scripts/doctor.sh`, `./scripts/memory-audit.sh`, `./scripts/validate.sh`, `./scripts/check-benchmark-artifacts.sh`, `git diff --check`, and `diff -qr skills /Users/fabio/.codex/plugins/cache/personal/codersteroids/0.1.0/skills` passed.

**Next:** Add a field engineering depth gate.

## 2026-05-26: Field Engineering Depth Gate

**Intent:** Implement the gap-closing capability from the first Superpowers field battle.

**Completed:** Added `field-engineering-depth`, `scripts/check-field-depth-report.sh`, and a report template. Updated method routing, systematic debugging, web research, Superpowers benchmark skill, field battle prompt/spec, validation, doctor benchmark checks, README, skills folder docs, architecture, roadmap, decisions, and session state.

**Changed:** `skills/field-engineering-depth/SKILL.md`, `scripts/check-field-depth-report.sh`, `docs/examples/field-depth-report-template.md`, `docs/plans/2026-05-26-field-engineering-depth.md`, routing/research/debugging/benchmark skills, validation scripts, roadmap, wiki, and benchmark prompt/spec.

**Decisions:** Field-critical analysis must include local flow map, primary hypotheses, secondary bottlenecks, implementation-library research, falsification checks, affected verification matrix, decision/next step, and durable memory updates.

**Verification:** `./scripts/check-field-depth-report.sh docs/examples/field-depth-report-template.md`, `./scripts/benchmark-runner.sh --list`, `./scripts/doctor.sh`, `./scripts/memory-audit.sh`, `./scripts/validate.sh`, `./scripts/check-benchmark-artifacts.sh`, `git diff --check`, and `diff -qr skills /Users/fabio/.codex/plugins/cache/personal/codersteroids/0.1.0/skills` passed after cache sync.

**Next:** Run the Tauri chat rendering field battle again using the new gate.
