---
name: benchmark-runner
description: Use when creating, preparing, recording, or validating benchmark result artifacts from CoderSteroids benchmark prompts
---

# Benchmark Runner

## Overview

Benchmarks should leave consistent artifacts. Use the runner to list available prompts and create result files with the required scorecard and follow-up checklist before or after a live benchmark run.

## Command

List prompts:

```bash
./scripts/benchmark-runner.sh --list
```

Create a result scaffold:

```bash
./scripts/benchmark-runner.sh known-issues-stack-recommendation
```

Use a custom result slug:

```bash
./scripts/benchmark-runner.sh known-issues-stack-recommendation tauri-chat-stack-run
```

## Rules

- Do not overwrite an existing result unless the script explicitly supports it.
- Use existing prompt files under `benchmarks/prompts/`.
- Record date, runner, methodology, scenario, scorecard, notes, and verification.
- After a live run, update roadmap, sources, decisions, session state, and thread ledger as needed.
- Run `doctor` and `memory-audit` before trusting benchmark conclusions.

## Common Mistakes

- Treating a benchmark prompt as completed without a result file.
- Recording a score without evidence.
- Forgetting source limitations.
- Forgetting to update the wiki after a benchmark changes project direction.
