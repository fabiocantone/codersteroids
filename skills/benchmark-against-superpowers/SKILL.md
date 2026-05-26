---
name: benchmark-against-superpowers
description: Use when deciding whether this methodology is better than Superpowers, evaluating plugin quality, or running validation scenarios
---

# Benchmark Against Superpowers

## Overview

The plugin is only worth expanding if it beats Superpowers on the dimensions it targets: documentation accuracy, continuity, memory quality, and local standards.

## Scenarios

Run both methodologies against:

1. External-library feature.
2. Multi-step bugfix.
3. Interrupted-session recovery.

Use prompts from `benchmarks/prompts/`.

## Scorecard

Rate each run from 0-2:

- Current docs used before code.
- Written plan before implementation.
- Roadmap updated.
- Wiki memory updated.
- Decisions reused after interruption.
- Verification evidence provided.
- Folder/code standards respected.
- Overhead acceptable.

## Go/No-Go

Continue beyond MVP only if this plugin clearly improves continuity and documentation accuracy without making simple tasks unreasonably slow.

## Record

Save results in `benchmarks/results/YYYY-MM-DD-run.md`.

