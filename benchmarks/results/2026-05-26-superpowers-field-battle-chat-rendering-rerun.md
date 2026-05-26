# Benchmark Run

## Metadata

- Date: 2026-05-26
- Runner: User ran updated CoderSteroids analysis after `field-engineering-depth`; Codex recorded comparative scorecard against prior Superpowers output
- Methodology: CoderSteroids with `field-engineering-depth` vs prior Superpowers run
- Scenario: Tauri AI chat rendering/performance analysis rerun
- Target repository: `/Users/fabio/Projects/local-first-personal-assistant`

## Evidence Reviewed

Updated CoderSteroids output:

- Updated `docs/plans/2026-05-26-chat-rendering-performance.md`.
- Updated `docs/benchmarks/chat-rendering-performance.md`.
- Updated `docs/architecture/final-roadmap.md`.
- Updated `docs/work-memory.md`.
- Corrected the stale first-run assumption: `ChatView.tsx` now uses `@tanstack/react-virtual`, so "no virtualization" is no longer the root cause.
- Produced Local Flow Map, Primary Hypotheses, Secondary Bottlenecks, Implementation Library Research, Falsification Checks, Affected Verification Matrix, recommendation, implementation plan, benchmark plan, verification, and remaining risks.
- Verification reported: `cd apps/desktop && npm run typecheck`, `cd apps/desktop && npm run test:ui-contract`, `python -m unittest tests/test_chat_latency_probe.py`, local WebKit version, and `git diff --check` on updated docs.

Prior Superpowers output:

- Identified unvirtualized transcript, markdown/Mermaid, streaming text updates, broad startup load, snapshot refresh, storage persistence, and WebView constraints.
- Ran frontend/Python/Rust gateway checks.
- Included Tauri/Electron/TanStack research.

Important limitation: this is not a paired fresh rerun of Superpowers after CoderSteroids was improved. It compares updated CoderSteroids against the prior Superpowers result to test whether the gap-closing gate improved the specific losing dimension.

## Scorecard

| Dimension | Updated CoderSteroids | Prior Superpowers | Winner | Evidence |
| --- | ---: | ---: | --- | --- |
| Root-cause quality | 2 | 2 | CoderSteroids edge | Updated CoderSteroids corrected stale virtualization evidence and moved Markdown/Mermaid final commit to top suspect. |
| Local flow map | 2 | 1 | CoderSteroids | Updated CoderSteroids explicitly mapped UI, state, virtualizer, streaming refs, gateway/WebSocket, Rust state, and diagnostics. |
| Secondary bottlenecks | 2 | 2 | Tie | Both included non-obvious causes. Updated CoderSteroids added remount hydration, `findPreviousUserMessage`, action bar state, smooth scroll, WebSocket token exposure. |
| Implementation library research | 2 | 2 | CoderSteroids edge | Updated CoderSteroids included TanStack warning about `measureElement` plus manual sizing, Virtuoso commercial message-list note, Electron/Wails/Flutter alternatives. |
| Falsification checks | 2 | 1 | CoderSteroids | Updated CoderSteroids tied hypotheses to measurements that would disprove them. |
| Verification strength | 1 | 2 | Superpowers | Superpowers ran Rust gateway tests. Updated CoderSteroids did not report `cargo test --manifest-path apps/desktop/src-tauri/Cargo.toml gateway`. |
| Durable memory and handoff | 2 | 0 | CoderSteroids | Updated CoderSteroids again updated plan, benchmark notes, final roadmap, and work memory. |
| Benchmark/prototype plan | 2 | 2 | Tie | Both strong; updated CoderSteroids is more aligned to current virtualized implementation. |
| Field usefulness | 2 | 2 | Tie | Both actionable. Updated CoderSteroids is better aligned with current code state. |
| Tooling portability | 1 | 1 | Tie | Updated CoderSteroids noted `scripts/check-field-depth-report.sh` does not exist in the target repo. This reveals a CoderSteroids portability gap. |

Total:

- Updated CoderSteroids: 18/20
- Prior Superpowers: 15/20

## Verdict

The field engineering depth gate worked. Updated CoderSteroids now beats the prior Superpowers output on technical-analysis depth for this scenario.

The win is not complete because:

- Superpowers still had stronger verification breadth due to the Rust gateway test.
- The CoderSteroids field-depth validator was only available in the plugin repo, not in the target project, so the target run could not execute `scripts/check-field-depth-report.sh`.

## Gap To Close Next

Add a project bootstrap/export path so CoderSteroids can install or copy its lightweight validation helpers into a target repo when needed:

- `scripts/check-field-depth-report.sh`
- optional `docs/examples/field-depth-report-template.md`
- target-repo docs explaining when to run them

This should be handled by a future `project-bootstrap` or `cross-agent-export` capability, not by assuming every target repo already has CoderSteroids scripts.

## Go/No-Go Implication

Continue. CoderSteroids can beat Superpowers when its field-depth gate is active, but it must improve target-repo portability and affected-slice verification discipline before claiming consistent field superiority.
