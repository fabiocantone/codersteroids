# CoderSteroids

CoderSteroids is a Codex plugin for coding agents that need continuity across sessions, current documentation, explicit plans, and durable project memory.

It is intentionally smaller than Superpowers in its MVP. The goal is to prove one thesis: for long-running projects, an agent performs better when it reads a living roadmap, records decisions, verifies external API usage with Context7 or official docs, and updates a Markdown LLM Wiki after each task.

## MVP Skills

- `using-methodology`
- `context7-research`
- `recommendation-verification`
- `roadmap-first-planning`
- `llm-wiki-memory`
- `coding-standards`
- `folder-docs`
- `systematic-debugging`
- `verification-before-completion`
- `post-task-memory-flush`

## Extended Skills

- `global-memory`
- `subagent-context-packing`
- `subagent-result-verification`
- `benchmark-against-superpowers`

## Standard Project Artifacts

- `docs/roadmap.md`
- `docs/specs/`
- `docs/plans/`
- `docs/wiki/index.md`
- `docs/wiki/session-state.md`
- `docs/wiki/architecture.md`
- `docs/wiki/decisions.md`
- `docs/wiki/sources.md`
- `docs/wiki/code-standards.md`
- `docs/wiki/open-questions.md`
- `README.md` or `FOLDER.md` in significant folders

## Context7

The plugin does not require Context7 to be installed, but it treats Context7 as the preferred documentation channel when available. If Context7 MCP tools or the `ctx7` CLI are unavailable, agents must fall back to official online documentation and record the fallback in `docs/wiki/sources.md`.

## Validate

Run:

```bash
./scripts/validate.sh
```

Benchmark artifacts can be checked with:

```bash
./scripts/check-benchmark-artifacts.sh
```
