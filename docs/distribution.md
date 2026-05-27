# Distribution

CoderSteroids is Codex-first, but the repository includes portable exports for other coding-agent harnesses.

## Supported Local Distribution Surfaces

- Codex plugin manifest: `.codex-plugin/plugin.json`
- Claude plugin manifest: `.claude-plugin/plugin.json`
- Codex skills: `skills/*/SKILL.md`
- Portable agent instructions: `AGENTS.md`, `CLAUDE.md`, `GEMINI.md`
- Cursor rule export: `.cursor/rules/codersteroids.mdc`
- Target project helper export: `scripts/project-bootstrap.sh`

Generated cross-agent instruction files include the CoderSteroids plugin version from `.codex-plugin/plugin.json` so target repositories can see which instruction snapshot they received.

Claude marketplace submission is tracked in `docs/claude-marketplace-submission.md`.

## Release Readiness

Run:

```bash
./scripts/release-readiness.sh
```

The script checks the package basics needed for public adoption: manifest, README, license, changelog, contribution guide, install docs, distribution docs, smoke tests, export checks, and host-enforcement checks.

## Known Distribution Limits

- CoderSteroids cannot force a host model to follow instructions if the host ignores skills or instruction files.
- Marketplace publication still depends on the target platform's submission process.
- Real multi-agent execution depends on host tooling; CoderSteroids provides controller discipline and result verification.
