# Release Distribution And Host Enforcement Plan

## Scope

Turn the remaining external CoderSteroids gaps into concrete release/distribution artifacts and host-enforcement checks.

## Non-Scope

- Guarantee public adoption.
- Submit to external marketplaces.
- Force host models to obey instructions at runtime.
- Run the Electron `bench:chat-render` benchmark.

## Files

- `LICENSE`
- `CHANGELOG.md`
- `CONTRIBUTING.md`
- `AGENTS.md`
- `CLAUDE.md`
- `GEMINI.md`
- `.cursor/rules/codersteroids.mdc`
- `docs/install.md`
- `docs/distribution.md`
- `docs/host-enforcement.md`
- `docs/release-checklist.md`
- `scripts/host-enforcement-check.sh`
- `scripts/release-readiness.sh`
- validation, doctor, smoke test, roadmap, wiki memory

## Verification

```bash
./scripts/skill-smoke-test.sh
./scripts/host-enforcement-check.sh
./scripts/release-readiness.sh
./scripts/cross-agent-export.sh --check .
./scripts/doctor.sh
./scripts/memory-audit.sh
./scripts/validate.sh
./scripts/check-benchmark-artifacts.sh
git diff --check
diff -qr skills /Users/fabio/.codex/plugins/cache/personal/codersteroids/0.1.0/skills
```

## Acceptance Criteria

- Repo has license, changelog, contribution guide, install docs, distribution docs, and release checklist.
- Cross-agent export writes and verifies common instruction files.
- Host enforcement check distinguishes script-enforced guarantees from host-dependent behavior.
- Release readiness check gates the public package basics.
