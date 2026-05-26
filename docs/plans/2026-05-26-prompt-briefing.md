# Prompt Briefing Skill Plan

## Scope

Add a CoderSteroids skill that converts short user requests into execution-ready prompts for Codex, Claude, subagents, reviewers, and benchmark sessions.

## Non-Scope

- Do not build a prompt UI.
- Do not add an external prompt database.
- Do not require approval for tiny direct tasks.

## Files

- `skills/prompt-briefing/SKILL.md`
- `skills/using-methodology/SKILL.md`
- `skills/subagent-context-packing/SKILL.md`
- `benchmarks/prompts/prompt-briefing.md`
- validation scripts and wiki docs

## Acceptance Criteria

- Short ambiguous task briefs route to `prompt-briefing`.
- Prompt output includes draft prompt, assumptions, missing context, and approval request.
- Subagent prompts can include a prompt brief when the original request is underspecified.
- Validation and benchmark artifact checks include the new skill and prompt.

## Verification

```bash
./scripts/benchmark-runner.sh --list
./scripts/doctor.sh
./scripts/memory-audit.sh
./scripts/validate.sh
./scripts/check-benchmark-artifacts.sh
git diff --check
diff -qr skills /Users/fabio/.codex/plugins/cache/personal/codersteroids/0.1.0/skills
```
