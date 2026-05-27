# Thread Ledger

This file preserves continuity across separate Codex chats. It is not a transcript; it is the compact handoff record future chats must read.

## Current Handoff

**Intent:** Improve CoderSteroids' public presentation and prepare a promotion path without overclaiming against Superpowers.

**Completed:** Rewrote the README as a public-facing product page, added `docs/promotion-strategy.md`, recorded Superpowers README evidence, and kept the thread ledger compact.

**Changed:** `README.md`, `docs/promotion-strategy.md`, `docs/plans/2026-05-27-readme-promotion.md`, `docs/FOLDER.md`, roadmap, sources, decisions, session state, and this ledger.

**Decisions:** Position CoderSteroids as a Codex-first continuity/evidence layer. Do not claim it replaces Superpowers or guarantees host runtime behavior.

**Verification:** `./scripts/skill-smoke-test.sh`, `./scripts/release-readiness.sh`, `./scripts/validate.sh`, `./scripts/check-benchmark-artifacts.sh`, `./scripts/memory-audit.sh`, and `git diff --check` passed.

**Next:** Prepare demo assets and release notes, then run a fresh install/new-chat test before public promotion.

## 2026-05-27: README And Promotion Strategy

**Intent:** Improve CoderSteroids' public README and define a promotion strategy after user feedback that Superpowers presents itself better.

**Completed:** Compared the live Superpowers README structure, rewrote CoderSteroids README as a public-facing product page, and added `docs/promotion-strategy.md`.

**Changed:** `README.md`, `docs/promotion-strategy.md`, `docs/FOLDER.md`, roadmap, sources, decisions, session state, and this ledger.

**Decisions:** Position CoderSteroids as a Codex-first continuity/evidence layer. Do not claim it replaces Superpowers or guarantees host runtime behavior.

**Verification:** `./scripts/skill-smoke-test.sh`, `./scripts/release-readiness.sh`, `./scripts/validate.sh`, `./scripts/check-benchmark-artifacts.sh`, `./scripts/memory-audit.sh`, and `git diff --check` passed.

**Next:** Prepare demo assets and release notes for promotion.

## Compact Timeline

### 2026-05-26: Rename, Publish, And Continuity

- Renamed the plugin from the temporary methodology name to `CoderSteroids`; plugin id is `codersteroids`.
- Published the repository and aligned manifest, README, marketplace config, local install/cache, and Git remote.
- Ran the first continuity tests: fresh sessions read roadmap/session state/ledger rather than relying on chat history.
- Added explicit `chat-continuity` support after discovering the installed cache needed a refresh.
- Validation focus: plugin validation, benchmark artifact checks, cache diff, and `git diff --check`.

### 2026-05-26: Recommendation, Research, And Source Discipline

- Ran full GitHub availability checks for name suggestions and recorded the `recommendation-verification` behavior.
- Added `web-and-github-research` for current web/GitHub research, similar-project discovery, Google/search-engine use where available, and Playwright/browser use when rendering matters.
- Completed similar-project research against Superpowers, ADD, SpecMem, Jumbo, AGENTS.md, and related memory/context tools.
- Added a skill-ecosystem improvement benchmark based on current docs, GitHub metadata, and public issue signals.
- Decision: CoderSteroids is not category-unique; its viable position is a Codex-first continuity/evidence/memory/diagnostics layer.

### 2026-05-26: Known-Issue And Field Engineering Gates

- Added known-issue checks for stack/runtime/library recommendations after the Tauri AI chat rendering lesson.
- Added `field-engineering-depth` after the first Superpowers field battle showed CoderSteroids needed deeper technical diagnosis.
- Field reports now require local flow map, primary hypotheses, secondary bottlenecks, implementation-library research, falsification checks, affected verification matrix, decision, and durable memory updates.
- Added `observability-logging` so runtime diagnosis requires logs, metrics, traces, profiles, benchmark reports, or an explicit instrumentation plan.
- Decision: runtime conclusions must be measured or clearly marked as hypotheses with a minimal instrumentation plan.

### 2026-05-26: Target Repo Bootstrap And Tauri/Electron Direction

- Added `project-bootstrap` and `scripts/project-bootstrap.sh` to export lightweight CoderSteroids validators/templates into target repos.
- Bootstrapped `/Users/fabio/Projects/local-first-personal-assistant` with target-local field-depth helpers.
- User later clarified that the target app moved from Tauri to Electron.
- Decision: do not run new Tauri-specific claims against the migrated Electron app; use it only for Electron rendering validation or use a separate Tauri fixture.

### 2026-05-26: Prompt Briefing And Self Improvement

- Added `prompt-briefing` so short natural requests can be expanded into execution-ready prompts for Codex, Claude, subagents, reviewers, or benchmarks.
- Verified the prompt-briefing workflow on an Electron chat rendering analysis; result was valid analysis, not proof that performance was solved.
- Added `self-improvement-loop` and used it to close a real benchmark-artifact gap.
- Decision: self-improvement must pick one evidence-backed gap, implement one scoped change, run before/after verification, and record an explicit verdict.

### 2026-05-26: Superpowers Gap Closure

- Re-ran a direct Superpowers repo/plugin/methodology gap analysis using local plugin files, installed Superpowers cache, older local Superpowers checkout, and live GitHub/web checks.
- Added pragmatic gap-closing skills: `test-first-development`, `code-review-discipline`, `branch-workspace-lifecycle`, `small-task-fast-path`, `subagent-execution-controller`, `spec-discovery`, `plan-execution-checkpoints`, `skill-authoring-pressure-test`, and `cross-agent-export`.
- Added or tightened benchmark result shape checks for self-improvement, TDD/review, branch lifecycle, small-task, and subagent workflows.
- Decision: local methodology gaps are covered at the artifact/skill/script level; remaining Superpowers advantages are adoption, host runtime behavior, and mature multi-harness ecosystem.

### 2026-05-27: Release, Distribution, And Host Enforcement

- Added release-ready artifacts: `LICENSE`, `CHANGELOG.md`, `CONTRIBUTING.md`, install/distribution/host-enforcement/release docs.
- Generated portable instruction files: `AGENTS.md`, `CLAUDE.md`, `GEMINI.md`, and `.cursor/rules/codersteroids.mdc`.
- Added `host-enforcement-check.sh` and `release-readiness.sh`.
- Decision: adoption and marketplace placement are external outcomes; repo readiness and host limitations must be explicit.

### 2026-05-27: Auto Start, Language, And Runtime Order

- Added stronger auto-start language: before coding responses, apply CoderSteroids routing unless disabled or superseded by higher-priority instructions.
- Added same-language response rules after user observed CoderSteroids tended to answer in English while Superpowers preserved the request language.
- Added manual fresh-chat auto-start test coverage.
- User observed Superpowers still invoked first; root cause is Superpowers' always-on bootstrap combined with host-controlled ordering.
- Decision: CoderSteroids is primary for CoderSteroids, prompt rewriting, continuity, memory, source-ledger, and current-doc tasks even if a host-selected bootstrap runs first.
- Correction: plugin order should not be manually rewritten in `~/.codex/config.toml`; strict first bootstrap requires disabling competing always-on methodology plugins.

## Recent Detailed Entries

## 2026-05-27: Release Distribution And Host Enforcement

**Intent:** Close the remaining external-readiness gap: distribution, install clarity, release checks, and host enforcement limits.

**Completed:** Added release docs, generated cross-agent instruction files, and added scripts to verify release readiness and host-enforcement surfaces.

**Changed:** `LICENSE`, `CHANGELOG.md`, `CONTRIBUTING.md`, docs under `docs/`, root agent instruction files, `scripts/host-enforcement-check.sh`, and `scripts/release-readiness.sh`.

**Decisions:** Make CoderSteroids release-ready without overclaiming runtime enforcement. Host behavior must be tested separately.

**Verification:** Release readiness, host enforcement, cross-agent export, doctor, memory audit, validation, benchmark checks, diff checks, and cache checks passed.

**Next:** Run manual fresh-chat activation tests.

## 2026-05-27: Auto Start And Language Follow-Up

**Intent:** Make CoderSteroids activate without explicit "Use CoderSteroids" prompts and answer in the user's language by default.

**Completed:** Added strong before-coding auto-start text, doctor/smoke/export checks, same-language checks, and a manual fresh-chat test prompt.

**Changed:** `skills/using-methodology/SKILL.md`, `skills/prompt-briefing/SKILL.md`, `.codex-plugin/plugin.json`, cross-agent exports, doctor/smoke checks, docs, roadmap, and wiki memory.

**Decisions:** Do not claim fresh-chat runtime success from repo scripts alone; repository checks can prove instructions exist, but only a fresh host chat can prove runtime behavior.

**Verification:** Doctor checks strong auto-start and same-language manifest prompts; smoke/export/release/host/memory/validate/check suites passed after cache/export refresh.

**Next:** Run the manual new-chat prompt-briefing test in Codex.

## 2026-05-27: Runtime Order Correction

**Intent:** Correct the mistaken assumption that CoderSteroids can be prioritized by manually reordering plugin blocks in Codex config.

**Completed:** Restored `/Users/fabio/.codex/config.toml` from `/Users/fabio/.codex/config.toml.bak.20260527083546`, removed the config-order rewrite helper, and updated docs/checks to describe runtime order as host-controlled.

**Changed:** `docs/host-enforcement.md`, `docs/roadmap.md`, `docs/wiki/decisions.md`, `docs/wiki/session-state.md`, `docs/wiki/thread-ledger.md`, and `scripts/doctor.sh`.

**Decisions:** Do not rewrite plugin block order as an enforcement mechanism. Use strict host-enforcement checks and disable Superpowers only for strict first-bootstrap testing.

**Verification:** Config diff against the backup showed no remaining config changes. `./scripts/skill-smoke-test.sh`, `./scripts/host-enforcement-check.sh`, and `./scripts/doctor.sh` passed with the expected Superpowers runtime-order warning.

**Next:** Rerun the fresh-chat prompt-briefing test.

## 2026-05-27: Thread Ledger Compaction

**Intent:** Reduce `thread-ledger.md` below the memory-audit review threshold while preserving useful cross-chat continuity.

**Completed:** Replaced verbose historical handoff entries with a compact timeline and kept only recent high-signal detailed entries.

**Changed:** `docs/wiki/thread-ledger.md`.

**Decisions:** The ledger should be a handoff index, not a full transcript. Durable decisions belong in `docs/wiki/decisions.md`; detailed benchmark evidence belongs in `benchmarks/results/`.

**Verification:** `./scripts/memory-audit.sh`, `./scripts/validate.sh`, `./scripts/check-benchmark-artifacts.sh`, and `git diff --check` passed after this edit. The memory-audit size warning is gone.

**Next:** Continue with the fresh-chat prompt-briefing runtime test.
