# Host Enforcement

CoderSteroids is partly enforceable through scripts and partly advisory through agent instructions.

## Script-Enforced

- Plugin structure and required skills: `./scripts/validate.sh`
- Installed cache drift: `./scripts/doctor.sh`
- Skill routing coverage: `./scripts/skill-smoke-test.sh`
- Benchmark artifact shape: `./scripts/check-benchmark-artifacts.sh`
- Memory hygiene: `./scripts/memory-audit.sh`
- Cross-agent export presence: `./scripts/cross-agent-export.sh --check`
- Release readiness: `./scripts/release-readiness.sh`

## Host-Dependent

- Whether the model chooses the right skill.
- Whether the model auto-activates CoderSteroids without the user naming it.
- Whether the model preserves the user's language in every answer.
- Whether the model follows all anti-laziness rules.
- Whether subagents can be launched and isolated.
- Whether external docs, Context7, browser, or GitHub tools are available.
- Whether marketplace hosts support the same skill semantics as Codex.

## Practical Rule

Treat CoderSteroids as strong when scripts verify the artifact state and the run records fresh evidence. Treat purely prose-only compliance as advisory unless a result artifact, command output, or review confirms it.
