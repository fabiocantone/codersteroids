# Release Checklist

## Before Tagging

- [ ] `./scripts/release-readiness.sh`
- [ ] `./scripts/doctor.sh`
- [ ] `./scripts/memory-audit.sh`
- [ ] `./scripts/validate.sh`
- [ ] `./scripts/check-benchmark-artifacts.sh`
- [ ] `git diff --check`
- [ ] Confirm `CHANGELOG.md` has the release version and date.
- [ ] Confirm `.codex-plugin/plugin.json` version matches the release tag.
- [ ] Confirm installed cache, if used, matches repository skills.

## Tag

```bash
git tag v0.1.0
git push origin v0.1.0
```

## GitHub Release Notes

Use the `CHANGELOG.md` entry as the release body and include:

- What changed.
- How to install.
- Required verification commands.
- Known limits around host enforcement and marketplace support.
