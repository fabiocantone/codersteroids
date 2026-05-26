# Branch Workspace Lifecycle Gap Closing Plan

## Scope

Close the Superpowers gap around isolated workspace setup and branch finishing with one pragmatic CoderSteroids skill.

## Non-Scope

- Full automated worktree creation.
- PR creation tooling.
- Remote branch cleanup automation.
- Multi-harness export.

## Files

- `skills/branch-workspace-lifecycle/SKILL.md`
- `skills/using-methodology/SKILL.md`
- `skills/FOLDER.md`
- `benchmarks/prompts/worktree-branch-lifecycle.md`
- `scripts/validate.sh`
- `scripts/check-benchmark-artifacts.sh`
- `README.md`
- `docs/roadmap.md`
- `docs/wiki/architecture.md`
- `docs/wiki/session-state.md`
- `docs/wiki/thread-ledger.md`

## Test Strategy

- Structural validation must require the new skill and benchmark prompt.
- Benchmark artifact checker must require the benchmark prompt.
- Plugin doctor and memory audit must still pass.
- Cache must match repository skills after sync.

## Verification Commands

```bash
./scripts/benchmark-runner.sh --list
./scripts/doctor.sh
./scripts/memory-audit.sh
./scripts/validate.sh
./scripts/check-benchmark-artifacts.sh
git diff --check
diff -qr skills /Users/fabio/.codex/plugins/cache/personal/codersteroids/0.1.0/skills
```

## Acceptance Criteria

- `branch-workspace-lifecycle` is routable from `using-methodology`.
- The workflow prevents silent work on dirty branches, unsafe cleanup, and push/merge without approval.
- Benchmark prompts include a lifecycle validation scenario.
- Roadmap and wiki record the remaining next gap.
