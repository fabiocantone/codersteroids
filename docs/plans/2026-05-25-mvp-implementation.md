# CoderSteroids MVP Implementation Plan

> **For agentic workers:** Use the plugin skills in this repository when continuing work. Keep roadmap, wiki, and verification artifacts current.

**Goal:** Build a small, testable Codex plugin that proves evidence-first research, roadmap continuity, LLM Wiki memory, folder docs, code standards, and verification discipline.

**Architecture:** The MVP is a Markdown-first Codex plugin. The plugin manifest exposes a `skills/` directory. Skills define agent behavior; `docs/` contains roadmap, validation scenarios, and wiki templates; `scripts/validate.sh` checks structure.

**Tech Stack:** Codex plugin manifest JSON, Markdown skills, shell validation.

---

## Task 1: Plugin Scaffold

**Files:**
- Create: `.codex-plugin/plugin.json`
- Create: `README.md`

- [x] Create a valid Codex plugin manifest.
- [x] Describe the plugin purpose and MVP skills in `README.md`.
- [x] Validate manifest with plugin validator.

## Task 2: MVP Skill Library

**Files:**
- Create: `skills/*/SKILL.md`

- [x] Create `using-methodology`.
- [x] Create `context7-research`.
- [x] Create `roadmap-first-planning`.
- [x] Create `llm-wiki-memory`.
- [x] Create `coding-standards`.
- [x] Create `folder-docs`.
- [x] Create `systematic-debugging`.
- [x] Create `verification-before-completion`.
- [x] Create `post-task-memory-flush`.
- [x] Ensure each skill has trigger-only frontmatter description.

## Task 3: Living Project Artifacts

**Files:**
- Create: `docs/roadmap.md`
- Create: `docs/specs/plugin-methodology-validation.md`
- Create: `docs/wiki/*.md`

- [x] Add roadmap with active goal, milestones, blockers, deferred phases, and next action.
- [x] Add validation spec with benchmark scenarios and metrics.
- [x] Add wiki pages for index, session state, architecture, decisions, sources, code standards, and open questions.

## Task 4: Structural Validation

**Files:**
- Create: `scripts/validate.sh`

- [x] Validate plugin manifest.
- [x] Validate required docs exist.
- [x] Validate required skills exist.
- [x] Validate skill frontmatter names and trigger descriptions.

## Task 5: Live Behavior Benchmark

**Files:**
- Modify: `docs/roadmap.md`
- Modify: `docs/wiki/session-state.md`
- Modify: `docs/wiki/sources.md`

- [ ] Install or load the plugin in Codex.
- [ ] Run external-library feature prompt.
- [ ] Run multi-step bugfix prompt.
- [ ] Run interrupted-session recovery prompt.
- [ ] Compare against Superpowers and decide whether to expand beyond MVP.

## Task 6: Roadmap Completion Artifacts

**Files:**
- Create: `skills/global-memory/SKILL.md`
- Create: `skills/subagent-context-packing/SKILL.md`
- Create: `skills/subagent-result-verification/SKILL.md`
- Create: `skills/benchmark-against-superpowers/SKILL.md`
- Create: `docs/context7-setup.md`
- Create: `benchmarks/prompts/*.md`
- Create: `benchmarks/results/template.md`
- Create: `scripts/check-benchmark-artifacts.sh`

- [x] Add global memory skill.
- [x] Add subagent context packing skill.
- [x] Add subagent result verification skill.
- [x] Add benchmark skill.
- [x] Add Context7 setup policy using current official docs.
- [x] Add benchmark prompt set.
- [x] Add scorecard template.
- [x] Extend structural validation.
