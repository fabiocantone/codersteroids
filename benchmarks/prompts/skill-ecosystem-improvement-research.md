# Skill Ecosystem Improvement Research Prompt

Run this prompt in a fresh Codex chat with CoderSteroids enabled:

```text
Use CoderSteroids. Analyze the most used and most influential coding-agent skill systems, instruction formats, and workflow plugins. Include Superpowers, AGENTS.md, Codex/Claude/Cursor-style skills or rules, memory/context tools, and public user requests from GitHub issues/discussions where available.

Do not rely on memory. Use current web and GitHub research. Verify dates, versions, repo activity, releases, stars/forks where relevant, and cite limitations. Look for repeated user pain points: lost context between chats, stale docs/API usage, weak planning, poor verification, poor code navigation, lack of memory hygiene, missing benchmarks, excessive workflow overhead, and weak install/update behavior.

Then answer:
1. What should CoderSteroids improve to reach a higher level?
2. Which improvements are already solved well by other projects?
3. Which improvements are unique opportunities for CoderSteroids?
4. What should be built next, in priority order?

Save a benchmark result under benchmarks/results/ and update docs/wiki/sources.md, docs/wiki/decisions.md, docs/wiki/session-state.md, and docs/wiki/thread-ledger.md.
```

Success criteria:

- Uses current web/GitHub research, not memory-only claims.
- Checks dates, repo activity, releases, stars/forks, and source limitations.
- Includes public user requests or issue/discussion signals where available.
- Separates competitors, inspiration, and false positives.
- Produces a prioritized improvement roadmap.
- Identifies which ideas belong in CoderSteroids and which should stay out of scope.
- Updates benchmark result and wiki memory.

