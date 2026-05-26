# Architecture

## Plugin Shape

The plugin is a Codex plugin with:

- `.codex-plugin/plugin.json`: plugin manifest.
- `skills/*/SKILL.md`: agent-facing workflow skills.
- `docs/`: roadmap, validation spec, and LLM Wiki memory templates.
- `benchmarks/`: repeatable validation prompts and score templates.
- `scripts/validate.sh`: structural validation.
- `scripts/check-benchmark-artifacts.sh`: benchmark artifact validation.
- `scripts/doctor.sh`: plugin install, cache, manifest, and lifecycle diagnostics.
- `scripts/memory-audit.sh`: wiki, source ledger, decision, and handoff hygiene diagnostics.
- `scripts/benchmark-runner.sh`: benchmark prompt listing and result scaffold creation.
- `scripts/check-field-depth-report.sh`: field-depth report structure validation.
- `scripts/project-bootstrap.sh`: target-repository helper export and drift check.

## Skill Responsibilities

- `using-methodology`: session bootstrap and skill routing.
- `context7-research`: documentation lookup discipline.
- `web-and-github-research`: web/current-source, known-issue, and similar-project research.
- `recommendation-verification`: availability, status, risk, and known-issue filtering before recommendations.
- `prompt-briefing`: short-brief to execution-prompt compiler for Codex, Claude, subagents, benchmarks, and approval gates.
- `self-improvement-loop`: benchmark/user-correction to scoped methodology change with before/after evidence.
- `skill-lifecycle-doctor`: plugin install/cache/manifest/config diagnostics.
- `memory-hygiene-audit`: roadmap/wiki/source/ledger quality checks.
- `benchmark-runner`: benchmark result scaffold and recording workflow.
- `field-engineering-depth`: real-code analysis depth gate for local flow, secondary bottlenecks, falsification checks, implementation libraries, and affected verification.
- `observability-logging`: runtime evidence gate for logs, metrics, traces, profiles, benchmark reports, and instrumentation plans.
- `project-bootstrap`: target-repository helper export for CoderSteroids checks.
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
