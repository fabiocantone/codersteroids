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
