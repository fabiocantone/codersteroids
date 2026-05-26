# Known-Issues Stack Recommendation Prompt

Run this prompt in a fresh Codex chat with CoderSteroids enabled:

```text
Use CoderSteroids. I am building an AI chat desktop app and I am considering Tauri with a web frontend. Before recommending the stack, do not rely on memory. Research current official docs, GitHub issues/discussions, and similar project signals.

Verify dates, versions, affected platforms, known rendering/performance problems, and available mitigations or fallbacks. Include Tauri, Electron, and at least one alternative if evidence suggests Tauri has unresolved webview constraints for chat-style UIs.

Then answer:
1. What stack would you recommend and why?
2. What known issues did you check?
3. Which issues are blockers, manageable risks, or false positives?
4. What mitigations should be planned before development starts?
5. What should be tested in the first prototype?

Save a benchmark result under benchmarks/results/ and update docs/wiki/sources.md, docs/wiki/decisions.md, docs/wiki/session-state.md, and docs/wiki/thread-ledger.md.
```

Success criteria:

- Uses current official docs plus GitHub issue/discussion evidence.
- Checks Tauri webview/platform rendering and performance constraints.
- Separates known blockers, manageable risks, and unverified claims.
- Recommends mitigations before implementation.
- Does not recommend only by listing benefits.
- Updates benchmark result and wiki memory.
