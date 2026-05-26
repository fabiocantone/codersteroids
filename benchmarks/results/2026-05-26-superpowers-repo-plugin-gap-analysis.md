# CoderSteroids vs Superpowers Repository And Plugin Gap Analysis

## Metadata

- Date checked: 2026-05-26
- Runner: Codex with CoderSteroids
- Scope: Installed CoderSteroids plugin, installed local Superpowers plugin, full local Superpowers checkout when available, live `obra/superpowers` GitHub repository, CoderSteroids roadmap/wiki/benchmark artifacts
- Required local preflight loaded: `docs/roadmap.md`, `docs/wiki/session-state.md`, `docs/wiki/thread-ledger.md`, `docs/wiki/decisions.md`, `docs/wiki/sources.md`, `benchmarks/results/*.md`, installed plugin files, `./scripts/doctor.sh`, `./scripts/memory-audit.sh`

## Sources Checked

Local CoderSteroids:

- Repository root: `/Users/fabio/Projects/superdev/evidence-first-methodology`
- Installed cache: `/Users/fabio/.codex/plugins/cache/personal/codersteroids/0.1.0`
- Manifest: `/Users/fabio/.codex/plugins/cache/personal/codersteroids/0.1.0/.codex-plugin/plugin.json`
- Skill files: `/Users/fabio/.codex/plugins/cache/personal/codersteroids/0.1.0/skills/*/SKILL.md`
- Health: `./scripts/doctor.sh` and `./scripts/memory-audit.sh` both passed with 0 failures and 0 warnings before this result was written.

Local Superpowers:

- Active curated Codex cache: `/Users/fabio/.codex/plugins/cache/openai-curated/superpowers/6188456f`
- Active curated manifest version: `5.1.0`
- Active curated skill files: `/Users/fabio/.codex/plugins/cache/openai-curated/superpowers/6188456f/skills/*/SKILL.md`
- Full local checkout: `/Users/fabio/.codex/superpowers`
- Full local checkout manifest version: `5.0.7`
- Full local checkout HEAD: `6efe32c9e2dd002d0c394e861e0529675d1ab32e`, dated 2026-04-23, older than live main and active curated cache.

Live GitHub/web:

- Repository metadata: https://api.github.com/repos/obra/superpowers
- Latest release: https://api.github.com/repos/obra/superpowers/releases/latest
- Main branch/tag refs: `git ls-remote https://github.com/obra/superpowers refs/heads/main refs/tags/v5.1.0`
- Skills/root structure: https://api.github.com/repos/obra/superpowers/contents/skills?ref=main and https://api.github.com/repos/obra/superpowers/contents?ref=main
- Open issue and PR counts: GitHub Search API for `repo:obra/superpowers is:issue is:open` and `repo:obra/superpowers is:pr is:open`
- Recent issue activity: GitHub Search API sorted by updated date
- README/release web pages: https://github.com/obra/superpowers and https://github.com/obra/superpowers/releases/tag/v5.1.0

GitHub API status:

- No rate limit blocker observed. Core API remaining after checks: 56/60. Search API returned `incomplete_results: false` for open issue and PR count checks.

## Live Superpowers Repository Facts

Checked on 2026-05-26:

- Repository: `obra/superpowers`
- Description: "An agentic skills framework & software development methodology that works."
- Created: 2025-10-09
- Last push: 2026-05-24
- Default branch: `main`
- Live main ref: `f2cbfbefebbfef77321e4c9abc9e949826bea9d7`
- Latest release: `v5.1.0`, published 2026-05-04
- Release target commitish: `main`
- Release tag ref: `ecbd610fce16d5faabcea997f17031129589b572`
- Stars: 207,643
- Forks: 18,496
- Watchers: 207,643
- Subscribers: 794
- License: MIT
- Open issues: 140
- Open PRs: 142
- Repo-level open issue counter: 282, matching issues plus PRs.

Live root structure includes platform/plugin and test maturity not present in CoderSteroids: `.claude-plugin`, `.codex-plugin`, `.cursor-plugin`, `.opencode`, `assets`, `docs`, `hooks`, `scripts`, `skills`, and `tests`.

Live skill list from GitHub API and active curated cache:

- `brainstorming`
- `dispatching-parallel-agents`
- `executing-plans`
- `finishing-a-development-branch`
- `receiving-code-review`
- `requesting-code-review`
- `subagent-driven-development`
- `systematic-debugging`
- `test-driven-development`
- `using-git-worktrees`
- `using-superpowers`
- `verification-before-completion`
- `writing-plans`
- `writing-skills`

Recent open issue signals checked:

- #1636 asks for Antigravity 2.0 support.
- #1629 asks for external-service testability gates in brainstorming.
- #1631 reports SDD model-selection guidance not enforced at worker dispatch.
- #1630 says Codex usage is confusing because Superpowers is skills-only, not slash commands.
- #1518 reports legacy task-write references broken by Claude Code task tool changes.
- #743 reports slower responses after installing Superpowers, likely context overhead.
- #1511 questions whether the brainstorming spec reviewer prompt is active or dead.
- #1237 reports the visual companion server expiring mid-session.

These are not proof of failure, but they are current user pain points: harness churn, install/usage confusion, context overhead, long-running workflow fragility, and stale or ambiguous support files.

## Comparison Table

| Area | CoderSteroids installed plugin | Local Superpowers plugin | `obra/superpowers` live repo |
| --- | --- | --- | --- |
| Installed version checked | `0.1.0` in personal cache | Curated Codex cache `5.1.0`; full local checkout `5.0.7` is older | Latest release `v5.1.0`, live main `f2cbfbe` |
| Skill count | 24 installed skills | 14 active curated skills | 14 live skills |
| Primary thesis | Codex-first continuity, current docs, known-issue research, roadmap/wiki memory, benchmark discipline | Broad software development methodology: brainstorming, planning, TDD, debugging, code review, worktrees, branch finishing, subagents | Same as local curated plugin, with mature multi-harness packaging and tests |
| Routing/bootstrap | `using-methodology` loads roadmap/session/wiki, routes to research, memory, debugging, field-depth, observability, prompt-briefing, post-task memory | `using-superpowers` requires skill invocation before any response when a skill may apply; strong mandatory language | README and plugin files support Claude Code, Codex CLI/App, Factory Droid, Gemini, OpenCode, Cursor, Copilot CLI |
| Local memory | Implemented: roadmap, session state, decisions, sources, thread ledger, architecture, code standards, open questions | Not implemented as a first-class installed skill | Issues show users request memory/context improvements (#551 and #1503 from previous research); not a core repo feature |
| Current docs / web research | Implemented: `context7-research`, `web-and-github-research`, source ledger, known-issue checks | Only structurally incidental; no dedicated current-doc lookup or source ledger skill in installed set | No dedicated current-doc skill in live skill list |
| Recommendation verification | Implemented and benchmarked for naming/GitHub availability; structurally present for tools/vendors/options | Not present | Not present |
| Planning | Implemented via `roadmap-first-planning`, but less mature as a spec conversation workflow | Implemented and mature: `brainstorming`, `writing-plans`, `executing-plans` | Documented basic workflow in README; release notes show active planning/worktree refinements |
| TDD | Not first-class; verification and systematic debugging exist, but no strict red/green/refactor skill | Implemented strongly with "no production code without failing test first" discipline | Core documented philosophy and skill |
| Debugging | Implemented: `systematic-debugging`, plus field-depth and observability gates | Implemented: `systematic-debugging`, `verification-before-completion`; includes references/scripts such as `find-polluter.sh` | Mature references and examples in repo |
| Verification before completion | Implemented | Implemented with strong evidence-before-claims language | Implemented |
| Code review | Only structurally present through `subagent-result-verification`; no full code review workflow | Implemented: `requesting-code-review`, `receiving-code-review`, reviewer prompt template | Release `v5.1.0` consolidated code-review prompts and added behavioral tests |
| Worktrees/branch finishing | Not implemented | Implemented: `using-git-worktrees`, `finishing-a-development-branch` | Release `v5.1.0` rewrote worktree skills with environment detection, consent, cleanup provenance |
| Subagents | Structurally present: context packing and result verification; not yet as mature as Superpowers SDD | Implemented: `subagent-driven-development`, `dispatching-parallel-agents`, prompt templates | Tests and release notes show active SDD maintenance |
| Cross-chat continuity | Implemented and benchmarked: `chat-continuity`, `thread-ledger.md` | Not first-class in installed set | Not first-class in live skill list |
| Field engineering depth | Implemented after field-battle loss; validated structurally with checker and target repo bootstrap | Strong in practice in the first field battle, but not a named installed skill | Not a distinct named skill, though debugging/TDD/review ecosystem contributes |
| Observability/logging | Implemented as named gate and field-depth requirement | Not first-class in installed skill list | Not first-class in live skill list |
| Plugin lifecycle diagnostics | Implemented: `skill-lifecycle-doctor`, `doctor.sh` catches stale cache/manifest/marketplace/config issues | Not present as a skill; live repo has broad packaging/tests | Repo has mature multi-harness files/tests but no user-facing doctor skill equivalent found |
| Memory hygiene | Implemented: `memory-hygiene-audit`, `memory-audit.sh` | Not present | Not present |
| Benchmark evidence | Multiple local benchmark result files and artifact checks; self-improvement checker now enforces before/after shape | Superpowers repo has tests/evals for skills and workflows; local plugin has no benchmark result ledger | Stronger repo-level test ecosystem and release notes; no CoderSteroids-style benchmark ledger |
| Overhead for small tasks | Higher when roadmap/wiki/research gates activate unnecessarily; needs lighter quick-task path | Higher when `using-superpowers` and TDD/brainstorming trigger aggressively; issue #743 suggests context overhead pain | Broad adoption despite overhead; open issues show overhead/UX friction remains |

## Methodology Capability Matrix

Status key: Implemented = shipped as local skill/script/workflow. Validated = local benchmark, script, test, or field result exists. Structural = file exists but field behavior is not yet proven.

| Capability | CoderSteroids | Superpowers local/live | Evidence status |
| --- | --- | --- | --- |
| Planning discipline | Implemented, partly validated | Implemented, mature | Superpowers stronger due brainstorming/spec/plan workflow; CoderSteroids has roadmap-first planning and wiki memory. |
| TDD / test-first workflow | Lacks first-class TDD | Implemented, strong | Superpowers clear win. |
| Debugging | Implemented | Implemented | Overlap; CoderSteroids adds field-depth and observability; Superpowers has mature debugging references. |
| Verification before completion | Implemented | Implemented | Overlap. |
| Code review workflows | Structural only | Implemented | Superpowers clear win. |
| Worktree / branch workflow | Lacks | Implemented | Superpowers clear win; release notes show active fixes. |
| Subagent orchestration | Structural | Implemented | Superpowers stronger; CoderSteroids has context packing/result verification but no full execution loop. |
| Cross-chat continuity | Implemented and benchmarked | Lacks first-class workflow | CoderSteroids clear differentiator. |
| Project memory / LLM Wiki | Implemented and audited | Lacks first-class workflow | CoderSteroids clear differentiator. |
| Current documentation lookup | Implemented | Lacks first-class workflow | CoderSteroids clear differentiator. |
| Known-issue research | Implemented and benchmarked | Lacks first-class workflow | CoderSteroids clear differentiator. |
| Recommendation verification | Implemented and benchmarked | Lacks | CoderSteroids clear differentiator. |
| Prompt briefing / prompt rewriting | Implemented and field-used | Lacks named equivalent | CoderSteroids differentiator. |
| Observability and logging | Implemented structurally | Lacks named equivalent | CoderSteroids differentiator; still needs more live proof. |
| Field engineering depth | Implemented and one rerun improved | Achieved through mature workflow, not named | CoderSteroids improved, but consistent win not proven. |
| Self-improvement loop | Implemented and narrowly validated | Skill writing/testing exists; not same loop | Different strengths: CoderSteroids has before/after benchmark discipline; Superpowers has mature skill authoring. |
| Plugin lifecycle diagnostics | Implemented and passing | Repo packaging mature, no doctor skill found | CoderSteroids differentiator, but Superpowers repo tests are broader. |
| Benchmark runner | Scaffold implemented | Repo tests/evals stronger | CoderSteroids benchmark ledger exists; Superpowers has stronger automated tests. |
| Benchmark evidence | Multiple local results, mostly manual | Public repo tests and release notes | CoderSteroids evidence is useful but less automated/replayable. |
| Overhead for small tasks | Risk: memory/research gates can be too much | Risk: mandatory skill/TDD gates can be too much | Both need task-size-aware paths. |

## Superpowers Capabilities CoderSteroids Lacks

1. First-class TDD with strict red/green/refactor ordering.
2. Mature brainstorming/spec refinement workflow with user validation loops.
3. Detailed plan-writing workflow with task granularity and execution handoff.
4. Full executing-plans workflow with checkpoints.
5. Full subagent-driven-development loop with implementer/spec-review/code-quality prompt templates.
6. Parallel-agent dispatch workflow for independent tasks.
7. Requesting and receiving code review workflows.
8. Worktree creation and branch finishing workflows.
9. Multi-harness packaging and install docs across Claude, Codex, Gemini, OpenCode, Cursor, Copilot, and Factory Droid.
10. Larger test suite for plugin/harness behavior and skill triggering.
11. Mature skill-writing guidance with pressure testing.

## CoderSteroids Capabilities Superpowers Lacks

1. Living roadmap as required operating memory.
2. Markdown LLM Wiki with session state, decisions, sources, architecture, thread ledger, and open questions.
3. Cross-chat continuity skill and thread ledger.
4. Current-doc lookup routing through Context7/official docs.
5. Known-issue research gate for stack/runtime/library choices.
6. Recommendation verification for names, tools, vendors, services, domains, repositories, and APIs.
7. Source ledger with dated conclusions and limitations.
8. Prompt briefing for turning short requests into execution-ready prompts.
9. Field engineering depth gate with local flow map, secondary bottlenecks, implementation research, falsification checks, and affected verification matrix.
10. Observability/logging gate for runtime diagnosis.
11. Plugin lifecycle doctor for stale cache/manifest/marketplace/config drift.
12. Memory hygiene audit for stale/oversized/incomplete wiki state.
13. Project bootstrap/export for CoderSteroids helper scripts into target repos.
14. Evidence-backed self-improvement result shape and before/after artifact checks.

## Overlap

- Skill-based methodology packaging.
- Planning before implementation.
- Systematic debugging.
- Verification before completion.
- Subagent awareness.
- Benchmark/evaluation intent.
- Evidence-before-claims philosophy.
- Markdown-first instructions and references.
- Host-agent compliance is advisory unless the host follows the skills.

## Superpowers Ideas CoderSteroids Should Copy Or Adapt

1. Add a small first-class TDD skill. It should be less absolutist for trivial/config-only edits, but strict for behavior changes.
2. Add a code review workflow with severity-ranked findings and a reusable reviewer prompt.
3. Add worktree/branch finishing guidance, especially consent, native worktree preference, cleanup provenance, and merge/PR options.
4. Add a clearer design/spec workflow before implementation for creative feature work. CoderSteroids has prompt briefing and roadmap-first planning, but not Superpowers-level design interrogation.
5. Improve subagent orchestration from context packing/result verification into a real controller workflow with worker prompts and review checkpoints.
6. Add skill-triggering or behavior tests similar to Superpowers' `tests/` tree; CoderSteroids currently leans too much on artifact shape checks.
7. Add multi-harness export support only after Codex behavior is stable. Superpowers' packaging breadth is a real maturity advantage.

## Superpowers Ideas CoderSteroids Should Not Copy

1. Do not copy broad "use a skill before any response" rigidity. It creates overhead and can conflict with Codex's native tool/skill behavior.
2. Do not copy every broad workflow skill just to match skill count. CoderSteroids' value is evidence/memory/current-research discipline.
3. Do not add a visual brainstorming server unless there is a specific CoderSteroids use case. Current Superpowers issues show lifecycle and timeout friction around that surface.
4. Do not make CoderSteroids multi-harness first before validating Codex-first behavior. That would dilute the current niche.
5. Do not rely only on strong prose. Superpowers itself has issues where guidance is not enforced at dispatch sites; CoderSteroids should prefer scripts, templates, and validators where feasible.

## Top 5 Gaps To Close In CoderSteroids

1. TDD and code-review gap: add practical test-first and review workflows.
2. Worktree/branch lifecycle gap: add isolated-workspace and finish-branch guidance.
3. Subagent execution gap: move beyond packing/verifying into a full orchestrated execution workflow.
4. Benchmark automation gap: current benchmark evidence is mostly manual; build replayable runner or stronger behavior tests.
5. Small-task overhead gap: define a lightweight path that preserves verification without forcing full roadmap/wiki/research ceremony for tiny tasks.

## Top 5 Differentiators To Preserve

1. Dated current-doc and known-issue research before recommendations.
2. Roadmap/wiki/thread-ledger continuity across chats.
3. Source ledger and explicit limitations.
4. Field engineering depth plus observability/logging gates.
5. Plugin lifecycle and memory hygiene diagnostics.

## Go / No-Go Verdict

Go, but not as a general Superpowers clone.

CoderSteroids is worth continuing as a Codex-first evidence, continuity, field-diagnosis, and memory hygiene layer for long-running engineering work. It is not currently stronger than Superpowers as a broad software-development methodology. Superpowers remains more mature for planning-to-implementation flow, TDD, code review, worktrees, branch finishing, subagent execution, multi-harness packaging, and public adoption.

The niche worth pursuing is: "make Codex harder to fool by stale memory, stale docs, missing source evidence, shallow field diagnosis, and plugin/cache drift." In that niche, CoderSteroids has implemented and partly validated capabilities Superpowers does not expose locally.

## Explicit Risks And Weaker Areas

- CoderSteroids' field win is limited: the rerun beat a prior Superpowers output, not a fresh current Superpowers rerun.
- CoderSteroids benchmark evidence is still manually recorded and artifact-checked; it is not a fully automated A/B harness.
- CoderSteroids lacks Superpowers' TDD/review/worktree/branch lifecycle rigor.
- CoderSteroids has far less adoption evidence: Superpowers has very large public GitHub adoption signals; CoderSteroids is local/personal and early.
- CoderSteroids' extra memory/research gates can become overhead for small tasks.
- CoderSteroids relies on host-agent compliance, just like Superpowers. Scripts improve validation, but skill behavior is still advisory unless used.
- Context7 availability remains environment-dependent, so current-doc behavior must keep official-doc fallbacks.

## Recommendation

Continue CoderSteroids with a selective gap-closing roadmap:

1. Add pragmatic TDD and code review workflows.
2. Add worktree/branch lifecycle guidance.
3. Build a real benchmark runner or behavior-test harness.
4. Add a small-task fast path.
5. Preserve the evidence/memory/diagnostics niche instead of chasing Superpowers' full breadth.
