# TDD Code Review Gap Closing Plan

## Scope

Add pragmatic CoderSteroids skills for test-first development and code review discipline.

## Non-Scope

- Do not copy Superpowers' full TDD/review workflows.
- Do not make TDD mandatory for docs/config/generated-only edits.
- Do not build a full reviewer subagent runner yet.

## Files

- `skills/test-first-development/SKILL.md`
- `skills/code-review-discipline/SKILL.md`
- `benchmarks/prompts/tdd-code-review-gap-closing.md`
- validation scripts and benchmark checks
- roadmap/wiki/thread ledger

## Acceptance Criteria

- Behavior changes route to a test-first workflow.
- Review request/feedback flows route to a review discipline workflow.
- Validation scripts require both skills and the benchmark prompt.
- The benchmark prompt can test failing-test evidence plus review evidence.

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
