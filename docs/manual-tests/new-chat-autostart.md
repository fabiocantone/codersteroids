# New Chat Auto-Start Manual Test

## Purpose

Verify whether the host loads CoderSteroids without the user explicitly saying "Use CoderSteroids".

## Setup

- CoderSteroids plugin enabled.
- Fresh Codex chat.
- Do not mention CoderSteroids in the prompt.
- For strict CoderSteroids-first testing, disable competing always-on methodology plugins such as Superpowers.
- If Superpowers remains enabled, the host may invoke `superpowers:using-superpowers` first; the pass condition is then immediate routing to CoderSteroids as the primary workflow.

## Preflight

Run:

```bash
./scripts/host-enforcement-check.sh --strict-autostart
```

If this fails because Superpowers is enabled, strict CoderSteroids-first auto-start is not a valid test configuration.

## Prompt

```text
Devo migliorare questo plugin: riscrivi questo prompt in modo che l'agente non perda il contesto tra chat, cerchi documentazione aggiornata e aggiorni la memoria del progetto. Prima dimmi che workflow useresti.
```

## Expected Behavior

- The agent uses prompt briefing automatically.
- The answer is in Italian.
- The agent treats CoderSteroids as the primary workflow for prompt rewriting.
- The agent mentions loading or preserving project memory/roadmap/wiki when applicable.
- The agent does not require the user to say "Use CoderSteroids".
- If Superpowers is installed and appears as a host bootstrap, the agent should immediately route to CoderSteroids and should not present Superpowers as the primary workflow for the task.
- If it produces a draft prompt, the draft includes verification and memory-update requirements.

## Pass Criteria

Pass if the response clearly applies CoderSteroids-style routing and answers in Italian without explicit activation.

## Fail Criteria

Fail if the response:

- answers in English;
- presents Superpowers as the primary workflow unless the user explicitly asked for Superpowers;
- rewrites the prompt without methodology gates;
- asks the user to explicitly enable CoderSteroids;
- ignores memory, verification, or current-doc requirements.
