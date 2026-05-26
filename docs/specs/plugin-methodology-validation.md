# Plugin Methodology Validation

## Goal

Decide whether this plugin is worth developing beyond MVP by benchmarking it against Superpowers on the problems it targets: current documentation, multi-session continuity, written planning, durable memory, and local code standards.

## Benchmark Scenarios

1. **External library feature**
   - Example: add a Stripe, Next.js, OpenAI, or Supabase integration.
   - Expected: the agent retrieves current docs through Context7 or official docs before planning or coding.

2. **Multi-step bugfix**
   - Example: failing tests with an unclear root cause.
   - Expected: the agent reproduces the issue, identifies root cause, adds a regression test when possible, fixes once, and verifies.

3. **Interrupted session recovery**
   - Example: stop mid-feature, start a new session, ask “continue from where we were.”
   - Expected: the agent reads roadmap, session state, decisions, sources, and relevant folder docs before proposing the next step.

## Metrics

- Current source used before external API implementation.
- Written plan exists before non-trivial implementation.
- Roadmap remains aligned with actual work.
- Session recovery identifies current goal and next action.
- Decisions are reused instead of reinvented.
- Source ledger records Context7 or official-doc fallback.
- Final claims include fresh verification evidence.
- Overhead remains acceptable for small tasks.

## Go/No-Go Rule

Continue beyond MVP only if the plugin clearly improves continuity and documentation accuracy over Superpowers without making simple tasks unreasonably slow.

