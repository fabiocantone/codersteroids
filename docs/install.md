# Install CoderSteroids

## Codex Personal Plugin

1. Clone the repository:

```bash
git clone https://github.com/fabiocantone/codersteroids.git
```

2. Install it through the Codex personal plugin flow or copy/sync it into the personal plugin cache used by your Codex environment.

3. Confirm the installed cache matches the repository:

```bash
./scripts/doctor.sh
./scripts/skill-smoke-test.sh
./scripts/host-enforcement-check.sh
```

## Target Repository Bootstrap

Export CoderSteroids helper checks into a project:

```bash
./scripts/project-bootstrap.sh /path/to/project
./scripts/project-bootstrap.sh --check /path/to/project
```

## Cross-Agent Instructions

Export portable instruction files for non-Codex agents:

```bash
./scripts/cross-agent-export.sh /path/to/project
./scripts/cross-agent-export.sh --check /path/to/project
```

This writes CoderSteroids-generated instructions for common agent hosts while preserving existing non-CoderSteroids files unless `--force` is used.
