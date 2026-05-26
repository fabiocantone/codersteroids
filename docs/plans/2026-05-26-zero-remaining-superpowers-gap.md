# Zero Remaining Superpowers Gap Plan

## Scope

Close methodology gaps still visible after the practical workflow pass: spec discovery, plan execution checkpoints, skill authoring pressure tests, cross-agent export, and skill routing smoke tests.

## Non-Scope

- Electron `bench:chat-render`.
- Public adoption metrics.
- Real external multi-agent runtime.
- Full packaging for every agent marketplace.

## Files

- `skills/spec-discovery/SKILL.md`
- `skills/plan-execution-checkpoints/SKILL.md`
- `skills/skill-authoring-pressure-test/SKILL.md`
- `skills/cross-agent-export/SKILL.md`
- `scripts/cross-agent-export.sh`
- `scripts/skill-smoke-test.sh`
- routing, validation, README, skill docs, architecture, roadmap, and wiki memory

## Verification

```bash
./scripts/skill-smoke-test.sh
./scripts/cross-agent-export.sh --check /tmp/codersteroids-export-check
./scripts/benchmark-runner.sh --check
./scripts/doctor.sh
./scripts/memory-audit.sh
./scripts/validate.sh
./scripts/check-benchmark-artifacts.sh
git diff --check
diff -qr skills /Users/fabio/.codex/plugins/cache/personal/codersteroids/0.1.0/skills
```

## Acceptance Criteria

- Remaining Superpowers methodology capabilities have CoderSteroids equivalents.
- Cross-agent portability has a script-backed export path.
- Skill routing has a smoke test.
- Residual gaps are honestly limited to adoption and host-runtime capabilities.
