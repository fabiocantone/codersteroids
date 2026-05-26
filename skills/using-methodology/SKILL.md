---
name: using-methodology
description: Use when starting work in a coding session, continuing existing work, or deciding which project workflow skill applies
---

# Using Methodology

## Overview

CoderSteroids keeps agents from drifting. Before acting, identify the current goal, load relevant project memory, choose applicable skills, and preserve the roadmap.

## Instruction Priority

1. User's explicit instruction.
2. Repository instructions and project docs.
3. CoderSteroids skills.
4. Default model behavior.

If a higher-priority instruction conflicts with this methodology, follow the higher-priority instruction and note the conflict.

## Required Start Gate

Before any non-trivial coding task:

1. Read `docs/roadmap.md` if it exists.
2. Read `docs/wiki/session-state.md` and `docs/wiki/index.md` if they exist.
3. Identify applicable skills.
4. State the active goal and next action.

## Skill Routing

- External library/API/configuration: use `context7-research`.
- Current web research, Google/search-engine use, browser inspection, known-issue research, or similar-project discovery: use `web-and-github-research`.
- Names, tools, services, libraries, domains, or availability-dependent options: use `recommendation-verification`.
- Feature/refactor/multi-step task: use `roadmap-first-planning`.
- Real-code behavior analysis, performance issue, architecture tradeoff, or production bug: use `field-engineering-depth`.
- Existing project context or durable decision: use `llm-wiki-memory`.
- New chat, resumed work, or handoff across chats: use `chat-continuity`.
- Structural code changes: use `coding-standards` and `folder-docs`.
- Bug/test failure: use `systematic-debugging`.
- Before completion claim: use `verification-before-completion`.
- After meaningful work: use `post-task-memory-flush`.

## Anti-Laziness Rules

- Do not rely on memory for volatile APIs.
- Do not suggest availability-dependent options without checking and filtering them.
- Do not recommend a stack or runtime without checking known issues when the choice affects performance, rendering, deployment, security, or data durability.
- Do not stop field analysis at the first plausible cause; map the local flow, check secondary bottlenecks, and define falsification checks.
- Do not implement non-trivial work without a plan.
- Do not claim success without fresh verification.
- Do not leave roadmap or wiki stale after structural or decision-level changes.
- Do not rely on chat history when a project memory artifact exists.
