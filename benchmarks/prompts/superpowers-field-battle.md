# Superpowers Field Battle Prompt

Run this prompt in two fresh Codex chats: one with CoderSteroids enabled and one with Superpowers enabled.

```text
Use the active methodology only. Do not rely on chat history.

Task: implement a medium-sized feature in a real repository that depends on a current external API or framework, includes a likely known-issue risk, requires tests or verification, and requires updating project documentation or memory.

Before coding:
- recover project context from durable artifacts if available;
- research current docs and known issues;
- write a short plan with acceptance criteria.

During implementation:
- follow local code patterns;
- add or update tests where practical;
- record decisions and source limitations.

Before completion:
- run fresh verification;
- explain remaining risks;
- update durable handoff artifacts.
```

Success criteria:

- Both runs use the same repository, task, and starting state.
- Compare diff quality, test quality, source freshness, recovery from context, memory updates, debugging discipline, and total overhead.
- Score with the expanded Superpowers comparison rubric.
- Save CoderSteroids and Superpowers run notes under `benchmarks/results/`.
- The verdict must say where CoderSteroids wins, loses, and what must be built next to win the next run.
