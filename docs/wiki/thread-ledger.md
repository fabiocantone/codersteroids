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

## 2026-05-26: Field Depth Rerun Result

**Intent:** Score the updated CoderSteroids Tauri chat rendering analysis after adding the field engineering depth gate.

**Completed:** Reviewed updated target-repo artifacts and the user's pasted summary. Recorded `benchmarks/results/2026-05-26-superpowers-field-battle-chat-rendering-rerun.md`.

**Changed:** Benchmark result, roadmap, session state, decisions, and this ledger.

**Decisions:** Updated CoderSteroids beats the prior Superpowers output on technical-analysis depth, but needs stronger affected-slice verification and a way to export validation helpers into target repos.

**Verification:** `./scripts/check-field-depth-report.sh docs/examples/field-depth-report-template.md`, `./scripts/benchmark-runner.sh --list`, `./scripts/doctor.sh`, `./scripts/memory-audit.sh`, `./scripts/validate.sh`, `./scripts/check-benchmark-artifacts.sh`, `git diff --check`, and `diff -qr skills /Users/fabio/.codex/plugins/cache/personal/codersteroids/0.1.0/skills` passed.

**Next:** Add project bootstrap/export for CoderSteroids validation helpers.

## 2026-05-26: Project Bootstrap For Target Repos

**Intent:** Make CoderSteroids validation helpers available inside target repositories.

**Completed:** Added `project-bootstrap`, `scripts/project-bootstrap.sh`, validation wiring, README/docs updates, tested bootstrap on a temporary target directory, and bootstrapped `/Users/fabio/Projects/local-first-personal-assistant`.

**Changed:** `skills/project-bootstrap/SKILL.md`, `scripts/project-bootstrap.sh`, `scripts/validate.sh`, README, skills folder docs, architecture, roadmap, decisions, session state, and this ledger.

**Decisions:** Export lightweight helpers under `scripts/codersteroids/` and `docs/codersteroids/`; do not copy plugin memory, benchmark results, local config, or secrets into target repos.

**Verification:** `./scripts/project-bootstrap.sh /Users/fabio/Projects/local-first-personal-assistant`, `./scripts/project-bootstrap.sh --check /Users/fabio/Projects/local-first-personal-assistant`, and `/Users/fabio/Projects/local-first-personal-assistant/scripts/codersteroids/check-field-depth-report.sh /Users/fabio/Projects/local-first-personal-assistant/docs/codersteroids/field-depth-report-template.md` passed.

**Next:** Rerun the Tauri chat rendering field check using the target-local validator.

## 2026-05-26: Observability Logging Gate

**Intent:** Make logging, metrics, traces, profiles, benchmark reports, and instrumentation planning a required pillar of runtime diagnosis.

**Completed:** Added `observability-logging`, updated `field-engineering-depth`, `systematic-debugging`, `using-methodology`, the field-depth template, checker, project bootstrap, validation, README, skills docs, architecture, roadmap, decisions, and session state.

**Changed:** `skills/observability-logging/SKILL.md`, `skills/field-engineering-depth/SKILL.md`, `skills/systematic-debugging/SKILL.md`, `skills/using-methodology/SKILL.md`, `docs/examples/field-depth-report-template.md`, `scripts/check-field-depth-report.sh`, `scripts/project-bootstrap.sh`, validation/docs/wiki files.

**Decisions:** Runtime diagnosis must prefer measured signals over static guesses. If signals are missing, the analysis must explicitly propose minimal instrumentation and state whether missing observability blocks the conclusion.

**Verification:** `./scripts/project-bootstrap.sh --check /Users/fabio/Projects/local-first-personal-assistant`, target-local `scripts/codersteroids/check-field-depth-report.sh`, plugin-local `./scripts/check-field-depth-report.sh`, `./scripts/benchmark-runner.sh --list`, `./scripts/doctor.sh`, `./scripts/memory-audit.sh`, `./scripts/validate.sh`, `./scripts/check-benchmark-artifacts.sh`, `git diff --check`, and cache `diff -qr` passed after target helper refresh.

**Next:** Refresh target helpers and rerun the Tauri chat rendering field check with an observability plan.

## 2026-05-26: Retire Local Assistant As Tauri Test Target

**Intent:** Correct the benchmark direction after the target app moved from Tauri to Electron.

**Completed:** Updated roadmap, session state, decisions, and this ledger to mark `/Users/fabio/Projects/local-first-personal-assistant` as an Electron validation target, not a fresh Tauri benchmark target.

**Changed:** `docs/roadmap.md`, `docs/wiki/session-state.md`, `docs/wiki/decisions.md`, and `docs/wiki/thread-ledger.md`.

**Decisions:** Do not run new Tauri-specific claims against the migrated Electron app. Use prior Tauri artifacts only as historical evidence; use a separate Tauri fixture if fresh Tauri comparison is required.

**Verification:** `./scripts/memory-audit.sh`, `./scripts/validate.sh`, `./scripts/check-benchmark-artifacts.sh`, and `git diff --check` passed.

**Next:** Define the next field benchmark for the Electron app with observability/logging and render benchmark evidence.

## 2026-05-26: Prompt Briefing Skill

**Intent:** Let users write short natural requests while CoderSteroids produces execution-ready prompts for Codex, Claude, subagents, reviewers, or benchmarks.

**Completed:** Added `prompt-briefing`, routed short ambiguous task briefs through it, added a prompt-briefing benchmark prompt, and updated subagent context packing to include a prompt brief when the source request is underspecified.

**Changed:** `skills/prompt-briefing/SKILL.md`, `skills/using-methodology/SKILL.md`, `skills/subagent-context-packing/SKILL.md`, `benchmarks/prompts/prompt-briefing.md`, validation scripts, README, skills docs, architecture, roadmap, decisions, and session state.

**Decisions:** Broad or risky work can be converted from a short brief into a draft prompt with assumptions, missing context, and approval/edit request before execution.

**Verification:** `./scripts/benchmark-runner.sh --list`, `./scripts/doctor.sh`, `./scripts/memory-audit.sh`, `./scripts/validate.sh`, `./scripts/check-benchmark-artifacts.sh`, `git diff --check`, and `diff -qr skills /Users/fabio/.codex/plugins/cache/personal/codersteroids/0.1.0/skills` passed after cache sync.

**Next:** Run the prompt-briefing benchmark, then use the approved-prompt workflow for the Electron field benchmark.

## 2026-05-26: Prompt Briefing Electron Field Run

**Intent:** Verify the prompt-briefing workflow on the real Electron chat rendering analysis.

**Completed:** Reviewed the user-reported field analysis from `/Users/fabio/Projects/local-first-personal-assistant` and independently checked the target report with the target-local field-depth validator.

**Changed:** Added `benchmarks/results/2026-05-26-prompt-briefing-electron-field.md`, updated roadmap and session state.

**Decisions:** Treat the Electron field report as a valid analysis result but not a solved performance claim. The next engineering step must be `bench:chat-render` with real Electron `BrowserWindow` console/performance capture.

**Verification:** `scripts/codersteroids/check-field-depth-report.sh docs/plans/2026-05-26-electron-chat-rendering-field-report.md` passed in the target repo. In CoderSteroids, `./scripts/benchmark-runner.sh --list`, `./scripts/doctor.sh`, `./scripts/memory-audit.sh`, `./scripts/validate.sh`, `./scripts/check-benchmark-artifacts.sh`, `git diff --check`, and cache `diff -qr` passed.

**Next:** Implement or request the Electron-aware chat render benchmark harness.

## 2026-05-26: Self Improvement Loop

**Intent:** Verify whether CoderSteroids can improve itself from evidence instead of ad hoc suggestions.

**Completed:** Added `self-improvement-loop`, a benchmark prompt, routing, validation coverage, benchmark artifact checks, and wiki/roadmap entries.

**Changed:** `skills/self-improvement-loop/SKILL.md`, `benchmarks/prompts/self-improvement-loop.md`, `docs/plans/2026-05-26-self-improvement-loop.md`, validation scripts, README, skills docs, architecture, roadmap, decisions, session state, and this ledger.

**Decisions:** A self-improvement loop must choose one evidence-backed gap, implement one scoped change, run validation, and record before/after behavior before claiming improvement.

**Verification:** `./scripts/benchmark-runner.sh --list`, `./scripts/doctor.sh`, `./scripts/memory-audit.sh`, `./scripts/validate.sh`, `./scripts/check-benchmark-artifacts.sh`, `git diff --check`, and cache `diff -qr` passed after cache sync.

**Next:** Run the self-improvement benchmark against a real recent gap.

## 2026-05-26: Self Improvement Benchmark Run

**Intent:** Run the self-improvement-loop benchmark using only project artifacts and plugin health checks as context.

**Completed:** Loaded roadmap, session state, thread ledger, decisions, benchmark results, doctor output, and memory-audit output first. Selected the gap that self-improvement results could pass artifact checks without before/after evidence. Updated `scripts/check-benchmark-artifacts.sh` to validate self-improvement result shape. Recorded before/after behavior evidence in `benchmarks/results/2026-05-26-self-improvement-loop.md`.

**Changed:** `scripts/check-benchmark-artifacts.sh`, `benchmarks/results/2026-05-26-self-improvement-loop.md`, `docs/roadmap.md`, `docs/wiki/session-state.md`, `docs/wiki/decisions.md`, and this ledger.

**Decisions:** Self-improvement benchmark results must include gap, change, expected behavior, before evidence, after evidence, and explicit verdict to pass artifact checks.

**Verification:** Before the change, a malformed self-improvement result passed `check-benchmark-artifacts.sh`; after the change, the same malformed result failed with a missing `## Gap` error. Full verification suite was run after memory updates.

**Next:** Continue with the Electron `bench:chat-render` harness.

## 2026-05-26: Updated Superpowers Repo Plugin Gap Analysis

**Intent:** Re-run the CoderSteroids vs Superpowers analysis without relying on chat history, using local memory, installed plugin files, benchmark results, plugin/memory health, and live GitHub/web evidence.
**Completed:** Loaded project memory, installed plugin files, active curated Superpowers cache, older full local Superpowers checkout, and live `obra/superpowers` API/web data. Saved `benchmarks/results/2026-05-26-superpowers-repo-plugin-gap-analysis.md`.
**Changed:** Added the benchmark result and updated roadmap, session state, decisions, sources, and this ledger.
**Decisions:** Continue CoderSteroids as a Codex-first evidence, continuity, field-diagnosis, and memory hygiene layer. Selectively adapt Superpowers' TDD, code review, worktree/branch, and subagent execution ideas.
**Verification:** `./scripts/doctor.sh`, `./scripts/memory-audit.sh`, `./scripts/validate.sh`, `./scripts/check-benchmark-artifacts.sh`, and `git diff --check` passed after updates.
**Next:** Add pragmatic CoderSteroids TDD/code-review gap-closing, then continue with the Electron `bench:chat-render` harness.

## 2026-05-26: Pragmatic TDD Code Review Gap Closing
**Intent:** Close the highest-priority Superpowers gap without copying Superpowers wholesale.
**Completed:** Added `test-first-development`, `code-review-discipline`, a TDD/code-review benchmark prompt, validation wiring, and roadmap/wiki updates.
**Changed:** TDD/review skills, benchmark prompt, plan, validation, README, skills docs, architecture, roadmap, decisions, session state, and this ledger.
**Decisions:** Use pragmatic failing-test-first discipline for testable behavior changes and severity/evidence-based review discipline for readiness checks. Do not claim parity with Superpowers until a live benchmark passes.
**Verification:** `./scripts/benchmark-runner.sh --list`, `./scripts/doctor.sh`, `./scripts/memory-audit.sh`, `./scripts/validate.sh`, `./scripts/check-benchmark-artifacts.sh`, `git diff --check`, and cache `diff -qr` passed after cache sync.

## 2026-05-26: TDD Code Review Benchmark Run
**Intent:** Validate the new TDD/code-review skills with a small real behavior change.
**Completed:** Used test-first discipline on `scripts/check-benchmark-artifacts.sh`; malformed TDD/code-review results now fail unless they include red/green evidence, broader verification, review table, and verdict.
**Changed:** `scripts/check-benchmark-artifacts.sh`, `benchmarks/results/2026-05-26-tdd-code-review-gap-closing.md`, roadmap, session state, and this ledger.
**Decisions:** TDD/code-review benchmark results must include red/green evidence, broader verification, review result table, and explicit verdict.
**Verification:** Focused negative test and standard suite passed.

## 2026-05-26: Branch Workspace Lifecycle Gap Closing
**Intent:** Close the next Superpowers gap around isolated workspaces, dirty worktree handling, branch finishing, and cleanup safety.
**Completed:** Added `branch-workspace-lifecycle`, routed it from `using-methodology`, added `benchmarks/prompts/worktree-branch-lifecycle.md`, required both in validation, and synced the installed cache.
**Changed:** New lifecycle skill, benchmark prompt, plan, validation scripts, README, skills docs, architecture, roadmap, decisions, session state, and this ledger.
**Decisions:** Use one pragmatic lifecycle skill rather than copying Superpowers' separate worktree and branch-finishing skills. Require branch/dirty-state inspection, explicit isolation choice, unrelated-change preservation, no push/merge/delete/cleanup without approval, and a finish report with verification plus memory/docs state.
**Verification:** `./scripts/benchmark-runner.sh --list`, `./scripts/doctor.sh`, `./scripts/memory-audit.sh`, `./scripts/validate.sh`, `./scripts/check-benchmark-artifacts.sh`, `git diff --check`, and cache `diff -qr` passed before this note was finalized.

## 2026-05-26: Branch Workspace Lifecycle Benchmark Run
**Intent:** Validate the new branch/workspace lifecycle workflow against a concrete checker behavior change and recorded finish path.
**Completed:** Created `benchmarks/results/2026-05-26-worktree-branch-lifecycle.md` and updated `scripts/check-benchmark-artifacts.sh` so malformed lifecycle results no longer pass with only `Improved`.
**Changed:** Benchmark checker, lifecycle result artifact, roadmap, session state, and this ledger.
**Decisions:** Treat the clean-worktree finish path as improved, but keep dirty-worktree preservation as a remaining benchmark gap.
**Verification:** Focused negative test confirmed a malformed lifecycle result now fails with missing `## Workspace Lifecycle`; standard suite passed after the benchmark artifact was corrected.

## 2026-05-26: Remaining Superpowers Gap Coverage
**Intent:** Cover the remaining local workflow gaps: small-task overhead, subagent execution control, benchmark automation, and dirty-worktree proof.
**Completed:** Added `small-task-fast-path`, `subagent-execution-controller`, `benchmark-runner.sh --check`, small-task/subagent result shape checks, and dirty-worktree lifecycle result evidence.
**Changed:** New skills/prompts/results, benchmark runner/checker, validation/doctor wiring, README, skills docs, architecture, roadmap, decisions, session state, and this ledger.
**Decisions:** Treat local practical gaps as covered; keep public adoption, multi-harness maturity, and real external multi-agent execution as honest residual Superpowers advantages.
**Verification:** Full suite passed after cache sync and benchmark checker fix.

## 2026-05-26: Zero Local Superpowers Methodology Gap
**Intent:** Ignore the Electron benchmark and close remaining local methodology differences with Superpowers.
**Completed:** Added `spec-discovery`, `plan-execution-checkpoints`, `skill-authoring-pressure-test`, `cross-agent-export`, `scripts/cross-agent-export.sh`, and `scripts/skill-smoke-test.sh`.
**Changed:** New skills/scripts/plan, routing, validation, doctor, README, skills docs, architecture, roadmap, decisions, session state, and this ledger.
**Decisions:** Treat local methodology gap as covered; remaining Superpowers advantages are external adoption/distribution and host-runtime execution, not missing CoderSteroids skill artifacts.
**Verification:** Cross-agent export temp check, skill smoke test, doctor, memory audit, validation, benchmark artifact check, diff check, and cache diff passed.
**Next:** Keep CoderSteroids stable; product work can resume later.
