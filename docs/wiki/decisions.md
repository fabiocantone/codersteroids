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
