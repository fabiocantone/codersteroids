---
name: project-bootstrap
description: Use when installing, exporting, checking, or refreshing CoderSteroids helper scripts and templates inside a target repository
---

# Project Bootstrap

## Overview

Some CoderSteroids checks must run inside the target repository, not only inside the plugin repo. Bootstrap exports lightweight helper scripts and templates so field reports can be validated where the work happens.

## Command

From the CoderSteroids plugin root:

```bash
./scripts/project-bootstrap.sh /path/to/target-repo
```

Check an existing target without writing:

```bash
./scripts/project-bootstrap.sh --check /path/to/target-repo
```

## What It Exports

- `scripts/codersteroids/check-field-depth-report.sh`
- `docs/codersteroids/field-depth-report-template.md`
- `docs/codersteroids/README.md`

## Rules

- Do not overwrite changed target files silently.
- Put exported files under CoderSteroids-owned paths.
- Keep helpers lightweight and dependency-free.
- Do not copy plugin memory, benchmark results, secrets, or local config into a target repo.
- Run the exported checker in the target repo before relying on a field-depth report.

## Completion Criteria

After bootstrap:

1. Run:

   ```bash
   scripts/codersteroids/check-field-depth-report.sh docs/codersteroids/field-depth-report-template.md
   ```

2. Record whether bootstrap changed the target repo.
3. Update the source project memory only when the target repo adopts CoderSteroids artifacts as a durable convention.
