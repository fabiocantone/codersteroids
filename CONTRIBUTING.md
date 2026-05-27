# Contributing

CoderSteroids changes should improve agent behavior with evidence, not only add instructions.

## Development Rules

- Keep skills focused on one responsibility.
- Add or update routing in `skills/using-methodology/SKILL.md` for new user-facing workflows.
- Add validation or smoke-test coverage for new scripts or install behavior.
- Update roadmap/wiki/session state when behavior changes durable methodology.
- Do not claim parity or superiority without a saved result, check, or explicit limitation.

## Required Checks

Run before committing:

```bash
./scripts/skill-smoke-test.sh
./scripts/host-enforcement-check.sh
./scripts/release-readiness.sh
./scripts/benchmark-runner.sh --check
./scripts/doctor.sh
./scripts/memory-audit.sh
./scripts/validate.sh
./scripts/check-benchmark-artifacts.sh
git diff --check
```

If the local Codex cache is used, also run:

```bash
diff -qr skills /Users/fabio/.codex/plugins/cache/personal/codersteroids/0.1.0/skills
```
