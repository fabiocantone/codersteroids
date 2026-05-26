---
name: skill-lifecycle-doctor
description: Use when checking plugin installation health, skill cache drift, duplicate skills, manifest consistency, marketplace setup, or Codex plugin config
---

# Skill Lifecycle Doctor

## Overview

Skill lifecycle failures are practical blockers: the repo may be correct while Codex still loads an old cached plugin, duplicate skill names, stale manifests, or obsolete config entries. Diagnose these before trusting a plugin behavior test.

## When To Run

Run the doctor after:

- Renaming the plugin.
- Adding, removing, or renaming skills.
- Changing `.codex-plugin/plugin.json`.
- Updating benchmark prompts or validation gates.
- Installing or refreshing the plugin in Codex.
- Seeing a mismatch between repository behavior and installed behavior.

## Diagnostic Command

From the plugin root:

```bash
./scripts/doctor.sh
```

## Checks

The doctor should verify:

- Plugin manifest exists and has the expected name/version.
- Each skill has `SKILL.md`, matching `name`, and a trigger-style description.
- Skill names are unique.
- The installed Codex cache exists.
- Cached skills match repository skills.
- Cached manifest matches repository manifest.
- Personal marketplace references `codersteroids`.
- Codex config enables `codersteroids@personal`.
- Obsolete `evidence-first-methodology` plugin config is not enabled.
- Required benchmark prompts and result directory exist.

## Output Rules

- Print pass/fail/warn lines with actionable paths.
- Do not print full config files or secrets.
- Do not auto-fix unless the user explicitly asks for repair.
- Recommend the exact next command when drift is found.

## Common Fixes

- Cache drift: sync or reinstall the plugin, then rerun doctor.
- Missing config: enable `codersteroids@personal` in Codex and restart/reload the session.
- Duplicate skill names: rename or remove the conflicting skill folder.
- Missing benchmark artifact: add the prompt/result or update validation intentionally.
