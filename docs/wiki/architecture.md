# Architecture

## Plugin Shape

The plugin is a Codex plugin with:

- `.codex-plugin/plugin.json`: plugin manifest.
- `skills/*/SKILL.md`: agent-facing workflow skills.
- `docs/`: roadmap, validation spec, and LLM Wiki memory templates.
- `benchmarks/`: repeatable validation prompts and score templates.
- `scripts/validate.sh`: structural validation.
- `scripts/check-benchmark-artifacts.sh`: benchmark artifact validation.

## Skill Responsibilities

- `using-methodology`: session bootstrap and skill routing.
- `context7-research`: documentation lookup discipline.
- `roadmap-first-planning`: roadmap and plan gates.
- `llm-wiki-memory`: project memory read/write rules.
- `chat-continuity`: cross-chat handoff and resume behavior.
- `coding-standards`: local programming standards.
- `folder-docs`: folder-level documentation.
- `systematic-debugging`: root-cause debugging.
- `verification-before-completion`: evidence before claims.
- `post-task-memory-flush`: final artifact synchronization.
- `global-memory`: confirmed cross-project memory.
- `subagent-context-packing`: minimal complete context packets.
- `subagent-result-verification`: independent validation of delegated work.
- `benchmark-against-superpowers`: comparison scorecard workflow.

## Boundaries

The plugin is Markdown-first and instruction-driven. It does not provide a runtime enforcement daemon in the MVP.
