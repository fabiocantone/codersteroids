# CoderSteroids

CoderSteroids is a Codex-first methodology plugin for agents that need to keep the thread on long-running software projects.

It makes the agent slow down at the moments that usually cause expensive mistakes: using stale API knowledge, starting without a plan, forgetting prior decisions, guessing at performance problems, accepting subagent output blindly, or claiming work is done without fresh verification.

## What It Does

CoderSteroids gives your coding agent a set of automatic working habits:

- read the project roadmap and wiki before resuming work;
- research current docs before using external APIs, SDKs, frameworks, or versioned libraries;
- check known issues before recommending a stack, runtime, or library;
- turn short rough requests into execution-ready prompts when the task is broad or risky;
- keep a Markdown LLM Wiki with decisions, sources, architecture, open questions, and handoff state;
- require logs, metrics, traces, profiles, benchmarks, or an instrumentation plan for runtime diagnosis;
- verify work with fresh commands before calling it complete;
- leave the next session with an explicit handoff.

The core thesis is simple: agents are better on serious projects when they do not rely on chat history alone.

## Quickstart

Clone the plugin:

```bash
git clone https://github.com/fabiocantone/codersteroids.git
cd codersteroids
```

Install it through your Codex personal plugin flow, then check the install:

```bash
./scripts/doctor.sh
./scripts/skill-smoke-test.sh
./scripts/host-enforcement-check.sh
```

For strict fresh-chat tests where CoderSteroids must appear before competing methodology bootstraps:

```bash
./scripts/host-enforcement-check.sh --strict-autostart
```

If Superpowers or another always-on methodology plugin is enabled, Codex may invoke that bootstrap first. That is host-controlled behavior. CoderSteroids documents the conflict and routes back to itself for CoderSteroids, prompt rewriting, continuity, memory, source-ledger, and current-doc tasks.

## Basic Workflow

1. **Rehydrate context** with `docs/roadmap.md`, `docs/wiki/session-state.md`, and `docs/wiki/thread-ledger.md`.
2. **Route the task** to the smallest useful skill path: fast path, spec discovery, research, debugging, review, branch lifecycle, subagent control, or prompt briefing.
3. **Research before code** when external APIs, frameworks, current docs, known issues, or similar projects matter.
4. **Plan non-trivial work** with a written plan, active goal, milestones, blockers, and verification commands.
5. **Implement with discipline** using test-first development where practical, local code standards, folder docs, and branch/workspace checks.
6. **Diagnose from evidence** by preferring logs, metrics, traces, profiles, and benchmarks over plausible guesses.
7. **Verify before completion** with fresh commands and explicit residual risks.
8. **Flush memory** by updating roadmap, decisions, sources, architecture, session state, and thread ledger.

## When It Helps Most

CoderSteroids is built for work where continuity and evidence matter more than raw speed:

- multi-session feature development;
- debugging and performance investigations;
- projects with fast-moving external APIs;
- stack or library selection;
- agent handoffs and subagent work;
- codebases where prior decisions get forgotten;
- public plugin or tool development where release readiness matters.

For tiny local edits, CoderSteroids includes a small-task fast path so the agent does not perform unnecessary ceremony.

## Skills Inside

**Start and routing**

- `using-methodology`
- `small-task-fast-path`
- `spec-discovery`
- `prompt-briefing`
- `roadmap-first-planning`
- `plan-execution-checkpoints`

**Research and recommendations**

- `context7-research`
- `web-and-github-research`
- `recommendation-verification`

**Memory and project structure**

- `llm-wiki-memory`
- `chat-continuity`
- `memory-hygiene-audit`
- `coding-standards`
- `folder-docs`
- `global-memory`

**Implementation discipline**

- `test-first-development`
- `systematic-debugging`
- `field-engineering-depth`
- `observability-logging`
- `code-review-discipline`
- `verification-before-completion`
- `post-task-memory-flush`

**Collaboration, benchmarks, and release**

- `branch-workspace-lifecycle`
- `subagent-execution-controller`
- `subagent-context-packing`
- `subagent-result-verification`
- `benchmark-runner`
- `benchmark-against-superpowers`
- `self-improvement-loop`
- `skill-authoring-pressure-test`
- `skill-lifecycle-doctor`
- `project-bootstrap`
- `cross-agent-export`

## Project Memory Layout

CoderSteroids expects or creates durable Markdown artifacts inside target projects:

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

Those artifacts are project memory. They are intentionally not committed in this public plugin repository unless they are sanitized examples. The wiki is not a transcript dump; it is compiled project memory for future agents.

## Context7 And Current Docs

CoderSteroids prefers Context7 for versioned technical docs when available. If Context7 MCP tools or the `ctx7` CLI are unavailable, the agent must fall back to official online documentation and record the fallback in `docs/wiki/sources.md`.

The rule is practical: do not write code against volatile APIs from memory.

## Validation Commands

Core validation:

```bash
./scripts/validate.sh
./scripts/check-benchmark-artifacts.sh
./scripts/doctor.sh
```

Host, release, and routing checks:

```bash
./scripts/host-enforcement-check.sh
./scripts/release-readiness.sh
./scripts/skill-smoke-test.sh
./scripts/memory-audit.sh
```

Benchmark result scaffolds:

```bash
./scripts/benchmark-runner.sh --list
./scripts/benchmark-runner.sh --check
./scripts/benchmark-runner.sh <prompt-slug>
```

Field engineering reports:

```bash
./scripts/check-field-depth-report.sh docs/examples/field-depth-report-template.md
```

Export CoderSteroids helper checks into a target repository:

```bash
./scripts/project-bootstrap.sh /path/to/target-repo
./scripts/project-bootstrap.sh --check /path/to/target-repo
```

Export portable agent instructions:

```bash
./scripts/cross-agent-export.sh /path/to/target-repo
./scripts/cross-agent-export.sh --check /path/to/target-repo
```

## Limitations

- CoderSteroids cannot force a host model to follow instructions if the host ignores skills or instruction files.
- Context7 availability depends on the user's Codex/MCP or CLI setup.
- Real subagent execution depends on host tooling; CoderSteroids provides controller discipline and verification rules.
- Public adoption and marketplace placement are not solved by local repo artifacts.
- Benchmark artifact checks validate required evidence shape, not the factual truth of manually recorded evidence.

## Documentation

- [Install](docs/install.md)
- [Distribution](docs/distribution.md)
- [Host Enforcement](docs/host-enforcement.md)
- [Claude Marketplace Submission](docs/claude-marketplace-submission.md)
- [Release Checklist](docs/release-checklist.md)

## License

MIT. See [LICENSE](LICENSE).
