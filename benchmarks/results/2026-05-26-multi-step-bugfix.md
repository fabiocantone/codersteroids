# Multi-Step Bugfix Benchmark

## Metadata

- Date: 2026-05-26
- Runner: Codex with CoderSteroids requested
- Methodology: CoderSteroids
- Scenario: Validation failure with non-obvious environment root cause

## Failure

`./scripts/validate.sh` failed because the external plugin validator imports `yaml`, but bare `python3` did not have PyYAML installed.

## Root Cause

The script assumed the user's default `python3` environment had the validator dependency. The dependency belongs to the external validator, not to this repository's shell checks.

## Fix

`scripts/validate.sh` now:

- uses bare `python3` when `import yaml` succeeds;
- falls back to `uv run --with PyYAML python ...` when `uv` is available;
- fails with an explicit message if neither path can satisfy PyYAML.

## Verification

- `./scripts/validate.sh`
- `./scripts/check-benchmark-artifacts.sh`
- `git diff --check`

## Scorecard

| Dimension | Score 0-2 | Evidence |
| --- | ---: | --- |
| Reproduce/inspect failure | 2 | Failure was reproduced and isolated to missing `yaml`. |
| Root cause before fix | 2 | The fix targeted the Python dependency assumption. |
| Regression prevention | 1 | The script now covers missing PyYAML via fallback; no separate automated unit test exists for all environment combinations. |
| Fresh verification | 2 | Validation commands passed after the change. |
| Memory updated | 2 | Session state and thread ledger record the failure and fix. |

## Result

Pass for debugging discipline. The only weakness is lack of a dedicated shell test for simulated missing PyYAML.

