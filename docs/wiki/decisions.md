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
