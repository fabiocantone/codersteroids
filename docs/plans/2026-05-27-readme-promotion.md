# README And Promotion Plan

## Goal

Make CoderSteroids easier to understand and promote publicly by improving the README and adding a concrete promotion strategy.

## Scope

- Rewrite `README.md` from an internal inventory into a public-facing product page.
- Add `docs/promotion-strategy.md`.
- Update docs index/folder notes and wiki memory.
- Record source evidence for the Superpowers README comparison.

## Non-Scope

- Do not rename the GitHub account or repository.
- Do not change plugin behavior or skill routing.
- Do not publish announcements in this run.

## Source Evidence

- Current Superpowers README, checked 2026-05-27.
- Existing CoderSteroids roadmap, decisions, benchmark results, and release docs.

## Acceptance Criteria

- README explains the problem, promise, workflow, install path, validation, and limitations.
- Promotion strategy defines audience, positioning, launch assets, channels, and next steps.
- Validation scripts still pass.

## Verification

```bash
./scripts/validate.sh
./scripts/check-benchmark-artifacts.sh
./scripts/release-readiness.sh
./scripts/memory-audit.sh
git diff --check
```
