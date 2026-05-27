# Claude Marketplace Submission

## Source Summary

Checked 2026-05-27 against the official Claude Code plugin docs:

- [Create plugins](https://code.claude.com/docs/en/plugins)
- [Plugins reference](https://code.claude.com/docs/en/plugins-reference)
- [Plugin marketplaces](https://code.claude.com/docs/en/plugin-marketplaces)

## What Claude Requires

Claude Code expects a Claude plugin manifest at:

```text
.claude-plugin/plugin.json
```

The plugin root can then contain:

- `skills/` with `<skill-name>/SKILL.md`;
- optional `agents/`;
- optional `hooks/`;
- optional `.mcp.json`;
- optional `.lsp.json`;
- optional `monitors/`;
- optional `settings.json`.

CoderSteroids currently ships skills only, so the first Claude-compatible package is lightweight.

## Submission Path

Anthropic documents two public marketplaces:

- `claude-plugins-official`: curated by Anthropic; no direct application process.
- `claude-community`: third-party submissions reviewed through the in-app forms.

The practical submission target is `claude-community`.

Submission forms:

- Claude.ai: `https://claude.ai/settings/plugins/submit`
- Console: `https://platform.claude.com/plugins/submit`

## Required Before Submission

- [x] Add `.claude-plugin/plugin.json`.
- [x] Run `claude plugin validate .` on the repo.
- [ ] Run `claude --plugin-dir .` and confirm skills load.
- [ ] Try representative namespaced skills such as `/codersteroids:using-methodology`.
- [ ] Confirm README install/usage instructions are clear for Claude users.
- [ ] Decide versioning policy:
  - explicit `version` in `.claude-plugin/plugin.json` means every public update must bump the version;
  - omitting version makes Claude use git commit SHA for updates.
- [ ] Keep the repository public and pushed before submitting.
- [ ] Submit through the Claude community marketplace form.
- [ ] After approval, check the community catalog for `codersteroids`.

## Current Decision

Keep explicit version `0.1.0` in `.claude-plugin/plugin.json` for the first submission. This is clearer for users, but requires disciplined version bumps on release.

## Known Caveats

- Local Claude Code version checked: `2.1.63`.
- Some docs mention newer behavior, such as zip plugin loading from `2.1.128+` and `displayName` from `2.1.143+`. Avoid newer optional fields until validated against the current CLI.
- The official marketplace is curated separately by Anthropic; submitting the form targets community review, not official inclusion.
- `claude plugin validate .` reports a warning that root `CLAUDE.md` is not loaded as plugin context. That is expected because plugin context should live in skills; `CLAUDE.md` is only a generated cross-agent export for repositories that want it.

## Local Test Commands

From the plugin repository:

```bash
cd /Users/fabio/Projects/superdev/evidence-first-methodology
claude --plugin-dir .
```

Or from any directory:

```bash
claude --plugin-dir /Users/fabio/Projects/superdev/evidence-first-methodology
```

Inside Claude Code:

```text
/help
/codersteroids:using-methodology
```

`/help` should list CoderSteroids skills under the `codersteroids` namespace. If Claude says `Unknown skill: codersteroids:using-methodology`, check the working directory shown in the Claude welcome screen. If it says `/Users/fabio`, then `--plugin-dir .` pointed to the home directory, not the plugin repository.

After editing plugin files in an already open Claude session:

```text
/reload-plugins
```
