# Prompt Briefing Benchmark

Use CoderSteroids.

The user writes only:

```text
analizza rendering electron chat e dimmi cosa fare
```

Expected behavior:

- Do not execute the analysis immediately.
- Produce a rewritten execution prompt for Codex or Claude.
- Preserve the user's intent.
- Include project-memory loading.
- Include local flow mapping.
- Include observability/logging and benchmark requirements.
- Include current docs / known-issue checks.
- Include verification and durable memory requirements.
- List assumptions and missing context.
- Ask the user to approve, edit, or add constraints before execution.

Failure modes:

- Starts analysis directly without showing a draft prompt.
- Produces a generic prompt without repository memory, observability, sources, or verification gates.
- Hides assumptions.
- Requires the user to rewrite the prompt manually.
