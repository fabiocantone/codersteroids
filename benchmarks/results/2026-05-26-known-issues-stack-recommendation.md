# Benchmark Run

## Metadata

- Date: 2026-05-26
- Runner: Codex with CoderSteroids
- Methodology: CoderSteroids `using-methodology`, `web-and-github-research`, `recommendation-verification`, `llm-wiki-memory`
- Scenario: Known-issues stack recommendation for an AI chat desktop app considering Tauri

## Research Summary

**Date checked:** 2026-05-26

**Question:** Should a desktop AI chat app use Tauri with a web frontend, or should Electron/another stack be preferred after checking known rendering and performance issues?

**Sources checked:** Tauri official webview version docs, Electron official security/sandbox docs, Wails v3 docs, GitHub API metadata for Tauri/Electron/Wails/Flutter, and GitHub issue searches for Tauri webview/rendering/performance issues.

**Confirmed:**

- Tauri v2 is active: `tauri-apps/tauri` had 107104 stars, 3635 forks, last push 2026-05-24, and latest release `tauri-cli-v2.11.2` published 2026-05-16.
- Tauri uses platform webviews: WebView2 on Windows, WKWebView/WebKit on macOS, and WebKitGTK on Linux. Its docs say Linux WebKitGTK version data is incomplete and distro-specific.
- Tauri issue search found relevant performance/runtime signals:
  - `tauri-apps/tauri#14963` open: "Bundle chromium renderer", updated 2026-05-18.
  - `tauri-apps/tauri#3988` closed: "Bad performance on linux", updated 2025-10-02.
  - `tauri-apps/tauri#14960` closed: CEF runtime/GPU acceleration work, updated 2026-02-17.
- Electron is active: `electron/electron` had 121420 stars, 17214 forks, last push 2026-05-26, and latest release `v42.2.0` published 2026-05-19.
- Electron official docs emphasize a different risk profile: bundled Chromium/Node gives consistent rendering, but security requires current Electron, context isolation, sandboxing, strict IPC validation, and avoiding Node integration for remote content.
- Wails v3 docs position Wails as a lightweight Go + web frontend framework using OS native WebView. That means Wails does not remove the same class of platform-webview rendering risk; it changes backend language and footprint.

## Recommendation

For an AI chat desktop app where smooth rendering, long scrollback, markdown/code blocks, streaming tokens, virtualization, and cross-platform consistency are core product quality, start with **Electron** unless bundle size and Rust-native footprint are more important than renderer consistency.

Tauri remains a good candidate if the first prototype proves the target platforms are smooth, especially when the app is mostly macOS/Windows, the UI is simple, and small bundle/security posture matter. For Linux-heavy distribution or complex chat rendering, treat Tauri as a risk until a prototype validates WebKitGTK behavior on the actual target distros and GPUs.

Wails is not a direct mitigation for this problem because it also uses native OS WebView. Flutter or a native toolkit may be worth testing if the product needs native-rendered UI and does not need a web UI stack.

## Known Issues Checked

| Stack | Issue class | Status | Risk | Mitigation |
| --- | --- | --- | --- | --- |
| Tauri | Platform webview differences | Official docs confirmed | Manageable on controlled platforms, higher for Linux | Test Windows/macOS/Linux early; check WebKit/WebView2 versions; avoid CSS/features not supported by target webviews. |
| Tauri | Linux WebKitGTK performance/rendering | GitHub issue/search evidence | Potential blocker for Linux-heavy chat UI | Prototype long chat rendering on target distros/GPU; benchmark scroll, streaming updates, markdown/code blocks; consider Electron or CEF-backed path if unacceptable. |
| Tauri | Requests for bundled Chromium/CEF | Open/closed GitHub issues | Signal that renderer consistency remains a pain point | Do not assume Tauri will behave like Chrome; evaluate CEF/Chromium alternatives before commitment. |
| Electron | Larger bundle and memory | Official docs and known architecture | Manageable product tradeoff | Budget app size/memory; keep renderer lean; use virtualization; profile production build. |
| Electron | Security with Node/remote content | Official docs confirmed | Manageable but mandatory | Use current Electron, context isolation, sandbox, strict IPC validation, CSP, and no Node integration for remote content. |
| Wails | Uses OS WebView | Official docs confirmed | Same webview class as Tauri | Do not choose Wails solely to escape webview rendering issues. |

## First Prototype Tests

- Render 10k+ mixed messages with markdown, code blocks, tables, and streaming token updates.
- Measure scroll FPS, input latency, time to append streamed chunks, memory growth, and CPU during streaming.
- Run the same UI on target macOS, Windows, and at least one Linux distro/GPU combination if Linux support matters.
- Compare Tauri production build vs browser vs Electron production build.
- Test real app IPC paths, not only static browser rendering.
- Add visual regression checks for layout, scrollbars, `position: sticky`, backdrop/blur effects, and code-block overflow.

## Scorecard

| Dimension | Score 0-2 | Evidence |
| --- | ---: | --- |
| Current docs used before code | 2 | Checked official Tauri, Electron, and Wails docs plus GitHub API metadata on 2026-05-26. |
| Written plan before implementation | 2 | Added `docs/plans/2026-05-26-known-issues-gate.md` before skill changes and result recording. |
| Roadmap updated | 2 | Roadmap updated with known-issues gate and next benchmark action. |
| Wiki memory updated | 2 | Sources, decisions, session state, and thread ledger updated. |
| Decisions reused after interruption | 2 | Reused the existing decision to require known-issue checks for stack recommendations. |
| Verification evidence provided | 2 | `gh api`, `gh search`, docs inspection, and final repo validation were used. |
| Folder/code standards respected | 2 | Used existing benchmark and wiki structure; no unrelated refactor. |
| Overhead acceptable | 1 | Appropriate for stack selection; too heavy for routine dependency choices unless risk is high. |

## Go/No-Go Implication

The known-issues gate is justified. CoderSteroids should keep it as a core differentiator: stack recommendations must include current limitations and mitigations, not only benefits.
