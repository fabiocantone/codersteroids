# Promotion Strategy

## Positioning

CoderSteroids should be promoted as a focused Codex-first continuity and evidence layer for coding agents, not as a generic Superpowers clone.

One-line positioning:

> CoderSteroids helps Codex keep the thread: current docs, written plans, Markdown project memory, evidence-based debugging, and verification before done.

## Audience

- Codex users working on projects across multiple chats.
- Developers frustrated by agents forgetting prior decisions after compaction or new sessions.
- Teams evaluating agent workflows who want auditable Markdown memory instead of hidden state.
- Plugin and tool authors who need release readiness, validation scripts, and cross-agent instruction exports.
- Users who already like Superpowers but want stronger project memory, source ledgers, current-doc checks, and field diagnosis.

## Message Pillars

1. **Continuity:** resume from roadmap, session state, thread ledger, and decisions instead of chat memory.
2. **Evidence:** current docs, known issues, logs, profiles, benchmarks, and verification before claims.
3. **Auditability:** Markdown wiki, source ledger, benchmark artifacts, and release checks live in the repo.
4. **Pragmatism:** small-task fast path avoids ceremony when work is trivial.
5. **Interop:** export AGENTS.md, Claude, Gemini, Cursor rules, and target-repo helper checks.

## Differentiation

Avoid claiming that CoderSteroids invented agent methodology. Similar systems exist.

Use this comparison:

- Superpowers is broader and more mature for full software-development methodology.
- CoderSteroids is narrower and stronger on Codex continuity, Markdown memory, source ledger discipline, current-doc research, known-issue checks, field diagnosis, and repo-local validation.

Do not use:

- "The best coding-agent methodology."
- "Replaces Superpowers."
- "Guaranteed auto-start."

Use:

- "A Codex-first evidence and continuity layer."
- "Designed for projects that span more than one chat."
- "Markdown memory you can inspect, commit, and improve."

## Launch Assets

Before promoting publicly, prepare:

- README with quickstart and workflow.
- One short demo GIF or video: fresh chat resumes from roadmap/wiki without chat history.
- One before/after example: rough user prompt becomes execution-ready prompt.
- One field report example: performance bug analysis with observability plan and verification matrix.
- One benchmark result showing a concrete improvement.
- GitHub release notes with install, limitations, and known host behavior.
- A pinned issue or discussion: "What should CoderSteroids improve next?"

## Channel Plan

### GitHub

- Create a clean `v0.1.x` release after README and docs are stable.
- Pin the repository on the profile.
- Add topics: `codex`, `agent-skills`, `coding-agent`, `llm-memory`, `developer-tools`, `context7`, `agents-md`.
- Keep the README honest about host limitations.

### Codex And Agent Communities

- Share a short post focused on the cross-chat continuity problem.
- Include the demo prompt and a screenshot or transcript excerpt showing roadmap/wiki recovery.
- Ask for feedback from users who lose context across chats.

### Developer Social

- Write a concise launch post:
  - Problem: coding agents lose the thread.
  - Solution: roadmap + Markdown wiki + source ledger + verification gates.
  - Proof: demo and benchmark artifacts.
  - Ask: try it on one long-running project and open issues.

### Comparison Content

- Publish a neutral comparison: "Superpowers vs CoderSteroids: breadth vs continuity."
- Be explicit that Superpowers is stronger on maturity/adoption.
- Show where CoderSteroids is intentionally different.

## First Public Release Checklist

- [ ] README rewritten and reviewed.
- [ ] `./scripts/release-readiness.sh` passes.
- [ ] Fresh install tested in Codex.
- [ ] Fresh-chat continuity test recorded.
- [ ] One demo asset prepared.
- [ ] GitHub topics added.
- [ ] Release notes written.
- [ ] First discussion/issue created for feedback.

## Suggested Launch Post

```text
I built CoderSteroids, a Codex-first plugin for coding agents that need to keep the thread across long-running projects.

It forces the agent to resume from a roadmap and Markdown wiki, check current docs before using APIs, record sources and decisions, use evidence for runtime diagnosis, and verify before saying work is done.

It is not a Superpowers clone. Superpowers is broader; CoderSteroids is focused on continuity, current-doc research, auditable project memory, and repo-local validation.

Repo: https://github.com/fabiocantone/codersteroids
Feedback wanted: where do your coding agents lose context or make stale-doc mistakes?
```

## Success Metrics

- First 10 external users or testers.
- At least 3 issues opened by people other than the author.
- One real third-party project using the memory/roadmap workflow.
- One reproduced bug or missing feature found through public feedback.
- README install path understood without private explanation.

## Next Step

After README improvements, run a fresh install/new-chat test and record whether the first response applies CoderSteroids without explicit activation.
