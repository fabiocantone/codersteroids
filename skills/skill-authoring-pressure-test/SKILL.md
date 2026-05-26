---
name: skill-authoring-pressure-test
description: Use when creating, editing, reviewing, installing, or validating skills, methodology instructions, routing rules, or plugin behavior
---

# Skill Authoring Pressure Test

## Overview

Skills are executable instructions for agents. A skill is not ready just because the prose sounds good; it needs trigger clarity, conflict handling, misuse cases, and at least one structural or behavior check.

## Authoring Checklist

For every new or changed skill:

1. Confirm the trigger starts with `Use when`.
2. Define when to use and when not to use the skill.
3. Include required outputs or gates.
4. Name interactions with related skills.
5. Add misuse/failure modes.
6. Add validation coverage or a documented reason it cannot be validated structurally.
7. Update routing in `using-methodology` when applicable.
8. Update README, `skills/FOLDER.md`, architecture, roadmap/wiki when durable.

## Pressure Test Questions

- Would the agent know to use this skill from a short user request?
- Could this skill cause unnecessary overhead on small tasks?
- Could it conflict with a higher-priority user or repo instruction?
- What bad output should be rejected?
- What file/script/check proves the skill is installed and discoverable?

## Completion Criteria

- `./scripts/validate.sh` passes.
- `./scripts/skill-smoke-test.sh` passes when present.
- Installed cache is synced or the stale-cache risk is recorded.
- The skill has one clear owner responsibility and does not duplicate an existing skill without reason.
