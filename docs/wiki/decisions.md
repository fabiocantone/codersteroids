# Decisions

## 2026-05-25: Build A Standalone Plugin

**Decision:** Build a standalone plugin instead of forking Superpowers.

**Context:** The goal is different enough: evidence-first documentation, roadmap continuity, and LLM Wiki memory.

**Alternatives:** Fork Superpowers, create only templates.

**Consequence:** We can move faster and keep a distinct methodology, but must prove value independently.

## 2026-05-25: Keep MVP Small

**Decision:** Start with nine MVP skills and document later phases in the roadmap.

**Context:** A large skill library would be impressive but harder to test and easier for agents to ignore.

**Consequence:** The first release focuses on behavior that can be benchmarked.

## 2026-05-25: Add Extended Skills As Artifacts Before Live Claims

**Decision:** Implement global memory, subagent support, and benchmark skills now, but do not claim the plugin beats Superpowers until benchmark runs exist.

**Context:** The user asked to continue autonomously to completion. The full roadmap includes phases 8-10, but behavioral claims require live testing.

**Alternatives:** Stop at MVP, or claim superiority based only on static files.

**Consequence:** The plugin is structurally complete while keeping claims honest.

## 2026-05-26: Verify Before Recommending Availability-Dependent Options

**Decision:** Add `recommendation-verification` and route name/tool/service suggestions through it.

**Context:** The assistant suggested assistant-style names before filtering all of them through GitHub availability checks. That is the same laziness pattern the plugin is meant to prevent.

**Alternatives:** Treat it as a one-off conversational correction.

**Consequence:** Future recommendations must define availability criteria, check sources, filter unavailable options, and label partial checks.

## 2026-05-26: Add Thread Ledger For Cross-Chat Continuity

**Decision:** Add `chat-continuity` and `docs/wiki/thread-ledger.md`.

**Context:** The user keeps long-running work in a single Codex chat because new chats often lose what happened elsewhere.

**Alternatives:** Rely only on `session-state.md`, or ask the user to summarize manually.

**Consequence:** Each meaningful chat must leave a concise durable handoff so future chats can resume from project memory, not conversation history.

## 2026-05-26: Add Web And Similar Project Research

**Decision:** Add `web-and-github-research`.

**Context:** The user wants CoderSteroids to research with browser/search tools, verify dates and versions, and check GitHub for similar existing projects before developing a new idea.

**Alternatives:** Fold this into `context7-research` or leave it as ad hoc behavior.

**Consequence:** External research now has a dedicated workflow that covers official docs, GitHub similar-project search, search engines, and Playwright/browser inspection with dated limitations.

## 2026-05-26: Position CoderSteroids As A Focused Composition, Not A New Category

**Decision:** Do not claim CoderSteroids is category-unique after similar-project research.

**Context:** Current GitHub/web checks found active overlaps: Superpowers and ADD cover agent methodology, SpecMem/Jumbo/agentmemory cover project memory and context, AGENTS.md covers portable agent instructions, and skill libraries/adaptations cover reusable agent workflows.

**Consequence:** Position CoderSteroids around its narrower thesis: a Codex plugin that combines lightweight skills, living roadmap, Markdown LLM Wiki memory, current-doc verification, and benchmark gates for long-running projects.

## 2026-05-26: Prioritize Skill Lifecycle And Memory Hygiene

**Decision:** The next CoderSteroids expansion should prioritize skill lifecycle diagnostics, memory hygiene auditing, benchmark execution, and cross-agent exports before adding more workflow breadth.

**Context:** Current ecosystem research found mature systems already cover many primitives: AGENTS.md for simple cross-agent instructions, Agent Skills/Codex/Claude for progressive-disclosure skills, Claude/Cursor/Continue for rules and memory, Cline Memory Bank for structured Markdown memory, Aider for repo maps, and Mem0/Graphiti for runtime memory. Public issues still show unresolved friction around compaction, stale/conflicting memory, instruction non-adherence, duplicate/ambiguous skill loading, versioning/locking, and cross-agent rule duplication.

**Alternatives:** Expand CoderSteroids with many new specialized skills, fork Superpowers, or replace host-native memory/rules systems.

**Consequence:** CoderSteroids should stay small and evidence-first, acting as a Codex-focused source of truth plus diagnostics/export layer rather than competing with broader host platforms or runtime memory databases.

## 2026-05-26: Add Known-Issues Gate To Stack Recommendations

**Decision:** CoderSteroids recommendations for languages, frameworks, runtimes, UI stacks, storage layers, deployment targets, and libraries must include known-issue and mitigation research when the choice affects performance, rendering, deployment, security, or data durability.

**Context:** The user reported a real Tauri AI chat problem where rendering can block or become slow. Current Tauri evidence shows the risk is not only app code: Tauri depends on platform webviews, with platform-specific WebView/WKWebView/WebKitGTK behavior and public performance/rendering issue signals. A recommendation that lists Tauri benefits without checking known webview constraints would recreate the same laziness pattern CoderSteroids is meant to prevent.

**Alternatives:** Treat known issues as optional research, add a separate large risk-analysis skill, or only check official docs.

**Consequence:** `recommendation-verification`, `web-and-github-research`, and `context7-research` now require known-issue checks for meaningful stack choices, and a Tauri AI chat benchmark prompt was added to test the behavior.

## 2026-05-26: Continue Narrowly After Superpowers Comparison

**Decision:** Continue CoderSteroids development, but keep the product narrow: continuity, evidence, memory, known-issue checks, and diagnostics before adding broad coding workflows.

**Context:** The direct comparison found Superpowers stronger for broad software-development methodology: TDD, review workflows, worktrees, branch finishing, and subagent breadth. CoderSteroids is stronger only in its explicit niche: roadmap/wiki/source-ledger continuity, current-doc and known-issue checks, recommendation verification, cross-chat handoff, and lifecycle diagnostics.

**Alternatives:** Stop development, try to out-breadth Superpowers, or fork Superpowers.

**Consequence:** The next work should be `memory-hygiene-audit` and `benchmark-runner`, not a large set of unrelated workflow skills.

## 2026-05-26: CoderSteroids Must Beat Superpowers In Field Tests

**Decision:** CoderSteroids must be evaluated against Superpowers through paired real coding tasks and should aim to win on aggregate field outcomes, not only on its initial continuity/documentation niche.

**Context:** The user explicitly rejected a purely defensive positioning. Superpowers is currently stronger in TDD, review, worktrees, and broad workflow coverage. CoderSteroids is stronger in current docs, known issues, roadmap/wiki continuity, recommendation verification, and diagnostics. The product goal is to turn those strengths into better end-to-end programming outcomes and close the losing dimensions.

**Alternatives:** Stay narrow and avoid direct competition, or try to copy all Superpowers skills immediately.

**Consequence:** Add a field-battle benchmark and treat losses as roadmap input. Future claims must distinguish artifact inspection from live/replayable field wins.

## 2026-05-26: Add Field Engineering Depth Gate After First Battle

**Decision:** Add a field engineering depth gate before the next Superpowers field battle.

**Context:** The first field battle on Tauri chat rendering showed CoderSteroids preserved memory and handoff better, but Superpowers produced deeper technical analysis: more local bottlenecks, broader verification, and more implementation-library research. Numeric score tied, but CoderSteroids did not clearly win.

**Alternatives:** Declare tie good enough, focus only on cross-agent export, or copy Superpowers broadly.

**Consequence:** The next CoderSteroids capability should require broader local flow inspection, secondary bottleneck discovery, affected-slice verification, implementation-library research, and falsification checks while preserving durable memory updates.

## 2026-05-26: Implement Field Engineering Depth Gate

**Decision:** Add `field-engineering-depth` plus `scripts/check-field-depth-report.sh` as the required depth gate for real-code behavior analysis, performance issues, architecture tradeoffs, and production bugs.

**Context:** The first Superpowers field battle showed that durable memory was not enough. To beat Superpowers, CoderSteroids must force broader local-flow inspection, secondary bottleneck discovery, implementation-library research, falsification checks, and affected-slice verification before recommending a fix.

**Alternatives:** Only update `systematic-debugging`, rely on reviewer discipline, or wait for another field loss.

**Consequence:** Future field reports must include specific required sections and can be structurally checked before being trusted. The Superpowers field battle prompt now measures this dimension directly.

## 2026-05-26: Field Depth Gate Beats Prior Superpowers Output But Needs Portability

**Decision:** Treat the updated CoderSteroids rerun as a technical-depth win against the prior Superpowers output, with two remaining gaps: verification breadth and target-repo portability for validation helpers.

**Context:** The rerun corrected stale assumptions, recognized current TanStack virtualization, identified Markdown/Mermaid final commit as primary suspect, added secondary bottlenecks and falsification checks, and compared implementation libraries. However, the target repo could not run `scripts/check-field-depth-report.sh` because that helper only exists inside the CoderSteroids plugin repo.

**Alternatives:** Accept manual validation, require users to know plugin-internal paths, or copy scripts ad hoc.

**Consequence:** Next capability should bootstrap/export CoderSteroids helper scripts and templates into target repos when a methodology check needs local execution.

## 2026-05-26: Add Project Bootstrap For Target-Repo Helpers

**Decision:** Add `project-bootstrap` plus `scripts/project-bootstrap.sh` to export lightweight CoderSteroids helper scripts and templates into target repositories.

**Context:** The Tauri chat rendering rerun needed `check-field-depth-report.sh`, but the script existed only in the CoderSteroids plugin repository. Field checks must run where the work happens without asking the user or agent to know plugin-internal paths.

**Alternatives:** Keep using plugin-internal paths, copy scripts manually, or require every repo to vendor the full plugin.

**Consequence:** Target repos can now receive CoderSteroids-owned helper files under `scripts/codersteroids/` and `docs/codersteroids/`, with a non-writing `--check` mode for drift detection.

## 2026-05-26: Make Observability A Field Diagnosis Pillar

**Decision:** Add `observability-logging` and make `## Observability And Logging Plan` mandatory in field-depth reports.

**Context:** The user pointed out that without logging and data analysis, agents can still produce plausible hypotheses and effectively guess. The first field battles also showed that benchmark/profile/log evidence is the difference between strong diagnosis and a good static analysis.

**Alternatives:** Leave logging as a debugging suggestion, rely on ad hoc benchmark plans, or require full observability platforms before analysis.

**Consequence:** Field analysis must identify existing logs, metrics, traces, profiles, benchmark reports, missing signals, minimal instrumentation, and privacy/noise limits before choosing a fix when runtime behavior matters.

## 2026-05-26: Retire Local Assistant As Fresh Tauri Test Target

**Decision:** Stop using `/Users/fabio/Projects/local-first-personal-assistant` as the fresh Tauri rendering benchmark target.

**Context:** The user clarified that the app previously used to test the Tauri chat rendering problem has removed Tauri and moved to Electron. Running new Tauri checks there would test the wrong runtime and make the Superpowers/CoderSteroids comparison invalid.

**Alternatives:** Keep replaying the old Tauri prompt against the migrated repo, treat Electron behavior as a proxy for Tauri, or skip field benchmarks entirely.

**Consequence:** Prior Tauri analysis remains historical evidence. Future work in that repo should benchmark Electron rendering, Chromium process behavior, IPC/security, and chat-render performance. Fresh Tauri-specific comparisons require a separate Tauri fixture or another repository that still uses Tauri.

## 2026-05-26: Add Prompt Briefing Before Broad Execution

**Decision:** Add `prompt-briefing` so short user requests can be compiled into execution-ready prompts with assumptions, missing context, and approval gates.

**Context:** The user does not want to write long methodology prompts manually. They often know the intent in two lines, while the agent needs a structured prompt for Codex, Claude, subagents, benchmarks, documentation lookup, observability, verification, and memory updates.

**Alternatives:** Keep giving long prompts manually, let agents infer missing constraints silently, or require every short request to run immediately.

**Consequence:** For broad, risky, delegated, or ambiguous work, CoderSteroids should draft the prompt first and let the user approve or edit it before execution unless the user explicitly asks to proceed autonomously.

## 2026-05-26: Add Evidence-Backed Self Improvement Loop

**Decision:** Add `self-improvement-loop` and a dedicated benchmark prompt to test whether CoderSteroids can improve itself from real evidence.

**Context:** The user asked whether the methodology can verify that it is able to self-improve. A self-improvement claim is only meaningful if it starts from a concrete gap, makes one scoped change, and records before/after behavior.

**Alternatives:** Treat self-improvement as brainstorming, manually add improvements without tests, or rely on general benchmark comparisons only.

**Consequence:** Future methodology changes should be tied to an artifact proving the gap, an expected behavior improvement, fresh validation, and a saved verdict of improved, inconclusive, or worse.

## 2026-05-26: Validate Self Improvement Result Shape

**Decision:** Make `scripts/check-benchmark-artifacts.sh` reject malformed self-improvement benchmark results.

**Context:** The self-improvement benchmark says not to claim improvement from static validation alone and requires before/after evidence. Before this change, the benchmark artifact checker only verified required prompt/template files, so a result file that merely said `Improved` could pass artifact checks.

**Alternatives:** Leave self-improvement evidence as manual review only, or build a larger benchmark runner before adding any guardrail.

**Consequence:** Self-improvement results now need gap, change, expected behavior, before evidence, after evidence, and an explicit verdict. This still cannot prove the truth of the evidence, but it prevents evidence-free result artifacts from passing the standard benchmark artifact check.

## 2026-05-26: Add Skill Lifecycle Doctor

**Decision:** Add `skill-lifecycle-doctor` plus `scripts/doctor.sh` as a first-class plugin health check.

**Context:** CoderSteroids already hit a practical install/cache problem: the repo had newer skills than the Codex installed cache. This can make behavior tests invalid because Codex may load stale skill instructions even when the repository is correct.

**Alternatives:** Keep manually running `diff -qr`, document cache refresh only, or fold lifecycle checks into generic validation.

**Consequence:** Plugin health checks now cover manifest, skills, duplicate names, cached skills, cached manifest, marketplace entry, Codex config, obsolete plugin name, and benchmark artifacts without printing full config contents or secrets.

## 2026-05-26: Add Memory Hygiene Audit

**Decision:** Add `memory-hygiene-audit` plus `scripts/memory-audit.sh` as a first-class project memory quality check.

**Context:** CoderSteroids relies on Markdown memory more than competing broad workflow systems. That memory can become harmful if next actions are stale, decision headings duplicate, source rows are incomplete, thread-ledger handoffs are partial, or old validation placeholders remain.

**Alternatives:** Rely on agents to manually inspect memory, fold checks into `doctor.sh`, or wait for a full benchmark runner.

**Consequence:** Memory health can now be checked independently from plugin install health, and future benchmark/completion flows should run both doctor and memory audit.

## 2026-05-26: Add Benchmark Runner Scaffold

**Decision:** Add `benchmark-runner` plus `scripts/benchmark-runner.sh` to list benchmark prompts and create consistent result scaffolds.

**Context:** Previous benchmarks were useful but manually created. A full automated dual-agent benchmark runner is larger work, but the immediate failure mode is missing or inconsistent result artifacts.

**Alternatives:** Leave benchmarks fully manual, or overbuild a live Codex launcher before artifact discipline is solid.

**Consequence:** Benchmark runs now have a repeatable artifact entry point. The script does not pretend to execute a fresh Codex chat; it prepares the file, preflight checklist, scorecard, and embedded prompt for evidence-based completion.

## 2026-05-26: Continue CoderSteroids As Evidence And Continuity Layer

**Decision:** Continue CoderSteroids, but position it as a Codex-first evidence, continuity, field-diagnosis, and memory hygiene layer rather than a full Superpowers clone.

**Context:** Updated local and live research found Superpowers much more mature for broad software development workflow: TDD, code review, worktrees, branch finishing, subagent execution, multi-harness packaging, tests, releases, issue activity, and adoption signals. CoderSteroids has implemented and partly validated differentiators Superpowers does not expose locally: roadmap/wiki/thread-ledger continuity, current-doc and known-issue research, recommendation verification, source ledger, field-depth and observability gates, plugin lifecycle diagnostics, memory hygiene audit, prompt briefing, and evidence-backed self-improvement checks.

**Alternatives:** Stop CoderSteroids, fork/copy Superpowers wholesale, or keep CoderSteroids narrow without closing broad workflow gaps.

**Consequence:** Selectively adapt Superpowers' TDD, code review, worktree/branch lifecycle, and subagent orchestration ideas. Do not copy its full breadth, visual companion, or always-on skill rigidity. Preserve CoderSteroids' evidence/memory/diagnostics niche and reduce small-task overhead.

## 2026-05-26: Add Pragmatic TDD And Review Skills

**Decision:** Add `test-first-development` and `code-review-discipline` as lightweight CoderSteroids adaptations of Superpowers' TDD and review strengths.

**Context:** The updated Superpowers gap analysis found CoderSteroids weaker in broad software-development workflow, especially TDD and review. Copying Superpowers wholesale would dilute CoderSteroids' niche, but leaving these gaps open would keep CoderSteroids weak on implementation quality.

**Alternatives:** Copy Superpowers' strict TDD/review skills, ignore the gap, or wait for a full subagent review runner.

**Consequence:** CoderSteroids now routes testable behavior changes through a pragmatic failing-test-first workflow and review interactions through a severity/evidence-based review workflow. These skills need a live benchmark before claiming parity.

## 2026-05-26: Add Branch Workspace Lifecycle Skill

**Decision:** Add `branch-workspace-lifecycle` as one pragmatic workflow covering dirty-state inspection, branch/worktree isolation, finish decisions, and cleanup safety.

**Context:** The updated Superpowers gap analysis found CoderSteroids weaker in worktree creation and development-branch finishing. That gap matters because CoderSteroids is intended for long-running work across sessions, where unrelated changes and stale handoffs are common.

**Alternatives:** Copy Superpowers' separate worktree and branch-finishing skills, keep this as generic planning guidance, or build full branch/PR automation first.

**Consequence:** CoderSteroids now requires explicit branch/dirty-state inspection before risky work, an isolation decision, preservation of unrelated user changes, verification before finish, memory/docs flush, and user approval before push, merge, delete, or cleanup operations. The workflow is structural until validated in a live benchmark.

## 2026-05-26: Cover Remaining Practical Superpowers Gaps

**Decision:** Add `small-task-fast-path`, `subagent-execution-controller`, benchmark runner `--check`, stricter result shape checks, and dirty-worktree lifecycle evidence.

**Context:** After TDD/review and branch/workspace lifecycle work, the remaining practical gaps were excessive overhead for tiny tasks, subagent orchestration beyond packing/verifying, benchmark automation, and dirty-worktree proof. Public adoption and broad multi-harness maturity are real Superpowers advantages but cannot be closed by local skill edits alone.

**Alternatives:** Keep adding broad Superpowers-like skills without benchmark hooks, or stop after structural parity.

**Consequence:** CoderSteroids now covers the practical workflow gaps locally while keeping its evidence/memory/current-doc niche. Remaining Superpowers advantages are distribution, adoption, and live multi-agent execution maturity.

## 2026-05-26: Zero Local Superpowers Methodology Gap

**Decision:** Add spec discovery, plan execution checkpoints, skill authoring pressure tests, cross-agent export, and skill routing smoke tests.

**Context:** The user asked to ignore the Electron benchmark and first zero the gap with Superpowers. The remaining local methodology gaps were brainstorming/spec refinement, executing written plans, skill-writing guidance, behavior/routing tests, and multi-harness portability.

**Alternatives:** Keep focusing on product-specific Electron performance, or add more benchmark artifacts instead of implementation.

**Consequence:** CoderSteroids now has local skill/script coverage for the Superpowers methodology surface while keeping its differentiators. Remaining gaps are no longer local methodology files; they are external adoption, distribution, and real host-agent enforcement.

## 2026-05-27: Add Release Readiness And Host Enforcement Checks

**Decision:** Add public-ready repository artifacts, portable root instruction files, release readiness checks, and host-enforcement checks.

**Context:** After local methodology parity, the remaining Superpowers advantages were public adoption, distribution maturity, and host runtime enforcement. Adoption cannot be forced by code, but the repository can remove adoption friction and make host-dependent limits explicit.

**Alternatives:** Leave the gap as a note, publish without release docs, or try to claim runtime enforcement the plugin cannot guarantee.

**Consequence:** CoderSteroids now has install/distribution docs, MIT license file matching the manifest, changelog, contribution guide, release checklist, generated AGENTS/CLAUDE/GEMINI/Cursor instruction files, and scripts that verify release readiness and host-enforcement surfaces.

## 2026-05-27: Auto Activate Prompt Briefing And Preserve User Language

**Decision:** Make CoderSteroids auto-activation explicit for prompt rewriting and require responses in the user's language by default.

**Context:** The user observed that Superpowers activates without being named and responds in the language of the request, while CoderSteroids often needed explicit naming and tended to answer in English.

**Alternatives:** Keep requiring "Use CoderSteroids", or only add the language rule to exported instructions.

**Consequence:** `using-methodology`, `prompt-briefing`, the plugin manifest default prompt, cross-agent exports, and smoke tests now require automatic CoderSteroids use for prompt rewriting/generation and same-language responses unless the user asks otherwise.

## 2026-05-27: Add Explicit Fresh Chat Auto-Start Coverage

**Decision:** Add the exact strong "Before any coding response" auto-start rule to manifest, methodology, exports, doctor, smoke tests, and a manual fresh-chat test.

**Context:** The user asked whether the earlier suggestions were actually implemented, including doctor/smoke auto-start checks and a fresh-chat test. Scripts can verify that instructions are installed and exported, but only a fresh host chat can prove runtime behavior.

**Alternatives:** Rely on the existing broader auto-activation wording, or claim the fresh-chat test passed without running one.

**Consequence:** Repository checks now fail if the strong auto-start and language rules are missing. Fresh-chat compliance remains a manual/host-level test documented in `docs/manual-tests/new-chat-autostart.md`.

## 2026-05-27: CoderSteroids Primary When Superpowers Also Boots

**Decision:** Add methodology conflict rules so CoderSteroids is primary for CoderSteroids, prompt rewriting, continuity, memory, source-ledger, and current-doc tasks even if Superpowers is also installed.

**Context:** A fresh-chat test showed the host invoking `superpowers:using-superpowers` first because Superpowers has a global mandatory bootstrap. This can confuse the workflow even when the user is testing CoderSteroids prompt rewriting.

**Alternatives:** Disable Superpowers in the user's Codex config, or accept Superpowers as the first workflow.

**Consequence:** CoderSteroids now documents the host-level conflict and requires immediate routing back to CoderSteroids for its primary domains. `doctor.sh` warns when Superpowers is enabled alongside CoderSteroids.

## 2026-05-27: Strict Auto-Start Requires No Competing Bootstrap

**Decision:** Add `host-enforcement-check.sh --strict-autostart` to fail when Superpowers is enabled.

**Context:** The user repeated the manual test and the host still invoked Superpowers first. Since Superpowers declares itself for every conversation, CoderSteroids cannot guarantee first position while Superpowers remains enabled.

**Alternatives:** Disable Superpowers automatically, or keep treating the conflict as only a warning.

**Consequence:** Normal checks warn about the conflict; strict auto-start checks fail. This makes the required test configuration explicit without silently changing the user's global Codex config.
