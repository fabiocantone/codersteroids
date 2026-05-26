# Benchmark Run

## Metadata

- Date: 2026-05-26
- Runner: User ran two fresh sessions and pasted outputs; Codex recorded comparative scorecard
- Methodology: CoderSteroids vs Superpowers
- Scenario: Field battle on `/Users/fabio/Projects/local-first-personal-assistant`, Tauri AI chat rendering/performance analysis
- Prompt: `benchmarks/prompts/superpowers-field-battle.md` adapted to the Tauri chat rendering problem

## Task

Analyze a Tauri desktop AI chat rendering problem where long messages, streaming tokens, Markdown/code blocks, and large scrollback can freeze or slow the UI. Propose concrete solutions, known-issue research, benchmark plan, and implementation direction.

## Evidence Reviewed

CoderSteroids output:

- Created `docs/plans/2026-05-26-chat-rendering-performance.md`.
- Created `docs/benchmarks/chat-rendering-performance.md`.
- Updated `docs/work-memory.md` and `docs/architecture/final-roadmap.md`.
- Identified unvirtualized scrollback, heavy final Markdown render, scroll/layout costs, Tauri WebView variance, and transport as a lower-probability cause.
- Ran `npm run test:ui-contract`, `npm run typecheck`, `python -m unittest tests/test_chat_latency_probe.py`, and scoped `git diff --check`.

Superpowers output:

- Identified the same main causes plus additional local causes: broad startup message loading, full snapshot refresh after stream, JSON pretty store persistence, and post-stream refresh paths.
- Checked Tauri webview versions, Tauri event/channel guidance, Electron process/security/webview-tag docs, and TanStack Virtual docs.
- Ran `npm run typecheck`, `npm run test:ui-contract`, `python -m unittest tests/test_chat_latency_probe.py`, and `cargo test --manifest-path apps/desktop/src-tauri/Cargo.toml gateway`.
- Produced a more detailed implementation roadmap and benchmark threshold set, but did not appear to leave durable project-memory artifacts in the repo.

Important limitation: the target repo had a large dirty worktree, so this scorecard uses the pasted outputs and the specific chat-rendering docs found in the repo. It does not attribute unrelated existing code diffs to either methodology.

## Scorecard

| Dimension | CoderSteroids | Superpowers | Winner | Evidence |
| --- | ---: | ---: | --- | --- |
| Root-cause quality | 2 | 2 | Superpowers edge | Both found the main rendering bottlenecks. Superpowers identified more local secondary causes: startup load, snapshot refresh, storage persistence. |
| Current docs and known issues | 2 | 2 | Superpowers edge | CoderSteroids checked Tauri/WebView/WebKit/Electron basics. Superpowers also checked Tauri Channels, Electron process/security/webview-tag docs, and TanStack Virtual. |
| Plan and acceptance criteria | 2 | 2 | Tie | Both recommended Tauri + virtualized transcript first, Electron as measured fallback, and benchmark thresholds. |
| Verification strength | 1 | 2 | Superpowers | Superpowers ran the same frontend/Python checks plus Rust gateway tests. CoderSteroids explicitly noted no real Tauri benchmark harness existed. |
| Durable memory and handoff | 2 | 0 | CoderSteroids | CoderSteroids saved plan, benchmark notes, work memory, and roadmap updates. Superpowers output did not show durable artifact updates. |
| Codebase-specific inspection | 1 | 2 | Superpowers | Superpowers referenced more local files and flow points. |
| Known risk mitigation | 2 | 2 | Tie | Both rejected immediate Electron migration and required measured frontend optimization first. |
| Benchmark/prototype plan | 2 | 2 | Superpowers edge | Both strong; Superpowers included more metrics and concrete command variants. |
| Methodology overhead | 1 | 1 | Tie | Both produced analysis rather than a fix; overhead acceptable for an architectural performance issue. |
| Field usefulness | 2 | 2 | Tie | Both outputs are actionable. CoderSteroids is easier to resume later; Superpowers is technically sharper in-session. |

Total:

- CoderSteroids: 17/20
- Superpowers: 17/20

Tie on numeric score, but **Superpowers wins the technical-analysis dimension**. CoderSteroids wins memory/continuity. For a field battle whose goal is programming excellence, this should be treated as **CoderSteroids did not beat Superpowers yet**.

## Verdict

CoderSteroids did not clearly beat Superpowers in this run.

CoderSteroids strengths:

- Better durable artifacts.
- Better project-memory update behavior.
- Clear limitation that no Tauri benchmark harness exists.
- Recommendation aligned with known-issue evidence.

Superpowers strengths:

- More complete local technical analysis.
- Better verification breadth because it included the Rust gateway test.
- More implementation-level next steps.
- More external docs relevant to implementation, especially TanStack Virtual and Electron security/process details.

## Gap To Close

CoderSteroids needs a stronger **field engineering depth gate** before it can beat Superpowers:

1. Inspect broader local data/control flow, not only the most obvious rendering files.
2. Require a "secondary bottlenecks" pass after the first root-cause list.
3. Require implementation-library research when the recommendation implies a library, such as TanStack Virtual or React Virtuoso.
4. Require verification to include affected backend/native slices when the frontend depends on them.
5. Preserve CoderSteroids' durable-memory advantage while matching Superpowers' technical depth.

## Next Build Priority

Add a `field-engineering-review` or upgrade `systematic-debugging`/`web-and-github-research` with a field-depth gate:

- local flow map;
- primary and secondary bottleneck list;
- affected test matrix;
- implementation-option library research;
- "what would falsify this hypothesis" checks;
- required durable memory update.

## Go/No-Go Implication

Continue. This field battle is useful because it shows exactly where CoderSteroids must improve to beat Superpowers: not more memory, but deeper technical investigation and broader verification while keeping memory discipline.
