# CoderSteroids

CoderSteroids is a Codex plugin for coding agents that need continuity across sessions, current documentation, explicit plans, and durable project memory.

It is intentionally smaller than Superpowers in its MVP. The goal is to prove one thesis: for long-running projects, an agent performs better when it reads a living roadmap, records decisions, verifies external API usage with Context7 or official docs, and updates a Markdown LLM Wiki after each task.

## MVP Skills

- `using-methodology`
- `context7-research`
- `web-and-github-research`
- `recommendation-verification`
- `prompt-briefing`
- `self-improvement-loop`
- `skill-lifecycle-doctor`
- `memory-hygiene-audit`
- `benchmark-runner`
- `field-engineering-depth`
- `observability-logging`
- `project-bootstrap`
- `roadmap-first-planning`
- `llm-wiki-memory`
- `chat-continuity`
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
- `docs/wiki/thread-ledger.md`
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

Installation and cache health can be checked with:

```bash
./scripts/doctor.sh
```

Project memory hygiene can be checked with:

```bash
./scripts/memory-audit.sh
```

Benchmark result scaffolds can be created with:

```bash
./scripts/benchmark-runner.sh --list
./scripts/benchmark-runner.sh <prompt-slug>
```

Field engineering reports can be checked with:

```bash
./scripts/check-field-depth-report.sh docs/examples/field-depth-report-template.md
```

CoderSteroids helpers can be exported into a target repository with:

```bash
./scripts/project-bootstrap.sh /path/to/target-repo
./scripts/project-bootstrap.sh --check /path/to/target-repo
```
