# Benchmark Run

## Metadata

- Date: 2026-05-26
- Runner: Codex with CoderSteroids `self-improvement-loop`
- Methodology: CoderSteroids
- Scenario: Self Improvement Loop Benchmark
- Prompt: `benchmarks/prompts/self-improvement-loop.md`

## Required Preflight

- [x] Loaded roadmap: `docs/roadmap.md`
- [x] Loaded session state: `docs/wiki/session-state.md`
- [x] Loaded thread ledger: `docs/wiki/thread-ledger.md`
- [x] Loaded decisions: `docs/wiki/decisions.md`
- [x] Loaded benchmark results: searched `benchmarks/results/*.md`
- [x] Checked plugin health: `./scripts/doctor.sh`
- [x] Checked memory health: `./scripts/memory-audit.sh`

## Gap

The self-improvement benchmark requires before/after evidence and a verdict, but the benchmark artifact checker only verified that required prompt/template files existed. That meant a self-improvement result could claim "Improved" without recording the required gap, change, expected behavior, before evidence, or after evidence.

Evidence artifact: `benchmarks/prompts/self-improvement-loop.md` requires "Record before/after evidence and verdict"; `scripts/check-benchmark-artifacts.sh` previously only checked the prompt/template file list and printed `Benchmark artifacts present.`

## Change

Updated `scripts/check-benchmark-artifacts.sh` so any self-improvement benchmark result, identified by filename or `benchmarks/prompts/self-improvement-loop.md`, must include:

- `## Gap`
- `## Change`
- `## Expected Behavior Improvement`
- `## Before Evidence`
- `## After Evidence`
- `## Verdict`

The checker also requires non-empty gap, before-evidence, and after-evidence sections, plus a verdict line of `Improved`, `Inconclusive`, or `Worse`.

## Expected Behavior Improvement

Malformed self-improvement result artifacts should fail `./scripts/check-benchmark-artifacts.sh`. Complete artifacts with before/after behavior evidence should pass. This turns the benchmark from a purely manual discipline rule into a runnable artifact check.

## Before Evidence

Behavior test before the change:

```bash
tmpdir="$(mktemp -d)" &&
cp -R . "$tmpdir/repo" &&
printf '# Benchmark Run\n\n## Metadata\n\n- Prompt: `benchmarks/prompts/self-improvement-loop.md`\n\n## Verdict\n\nImproved\n' > "$tmpdir/repo/benchmarks/results/2026-05-26-self-improvement-loop-malformed.md" &&
"$tmpdir/repo/scripts/check-benchmark-artifacts.sh"
```

Result before the change:

```text
Benchmark artifacts present.
```

This was incorrect because the artifact had no gap, change, expected behavior, before evidence, or after evidence.

## After Evidence

Behavior test after the change used the same malformed result shape in a temporary repo copy.

Result after the change:

```text
Missing required heading '## Gap' in benchmark result: /var/folders/nb/r6fbsdsn3z58bkbb9w55nn780000gn/T/tmp.Ta4OyvNCPB/repo/benchmarks/results/2026-05-26-self-improvement-loop-malformed.md
```

This is the expected failure mode: a self-improvement artifact that only says `Improved` is no longer accepted.

## Scorecard

| Dimension | Score 0-2 | Evidence |
| --- | ---: | --- |
| Current docs used before code | 2 | Roadmap, session state, thread ledger, decisions, benchmark results, prompt, and health scripts were read first. |
| Written plan before implementation | 2 | The selected gap, expected behavior, and smallest checker change were stated before editing. |
| Roadmap updated | 2 | Roadmap now records the self-improvement benchmark run and the next Electron benchmark action. |
| Wiki memory updated | 2 | Session state, decisions, and thread ledger were updated. |
| Decisions reused after interruption | 2 | Reused the existing decision that self-improvement requires evidence, scoped change, verification, and before/after behavior. |
| Verification evidence provided | 2 | The malformed-result behavior test failed after the change; full verification commands are recorded below. |
| Folder/code standards respected | 2 | Change stayed within benchmark checker, benchmark result, and wiki/roadmap artifacts. |
| Overhead acceptable | 2 | Added a small shell check rather than a new skill or broad harness. |

## Verification

- `./scripts/benchmark-runner.sh --list`: passed and listed all benchmark prompts, including `self-improvement-loop`.
- `./scripts/doctor.sh`: passed with 0 failures and 0 warnings.
- `./scripts/memory-audit.sh`: passed with 0 failures and 0 warnings.
- `./scripts/validate.sh`: passed.
- `./scripts/check-benchmark-artifacts.sh`: passed with the completed self-improvement result.
- `git diff --check`: passed.
- `diff -qr skills /Users/fabio/.codex/plugins/cache/personal/codersteroids/0.1.0/skills`: passed.

## Verdict

Improved

The benchmark now has a runnable behavior check that distinguishes a malformed self-improvement artifact from a complete one. This is not a claim that self-improvement is fully automated; it is a narrow improvement to evidence discipline for this benchmark.

## Residual Risk And Next Gap

The checker validates self-improvement artifact shape, not the truth of the recorded evidence. The next gap remains a live benchmark runner that can launch controlled fresh-session comparisons instead of relying on manual transcript/result entry.

## Go/No-Go Implication

Continue. The self-improvement loop passed this narrow benchmark because it selected an evidence-backed gap, made one scoped change, and produced before/after behavior evidence beyond static validation.
