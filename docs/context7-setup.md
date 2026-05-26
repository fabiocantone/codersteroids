# Context7 Setup Notes

Context7 is the preferred documentation channel for this plugin when external libraries, SDKs, APIs, framework behavior, setup, or configuration are involved.

As of 2026-05-25, the official Context7 documentation describes two operating modes:

- **CLI + Skills:** `npx ctx7 setup` installs a skill that guides agents to use `ctx7` CLI commands.
- **MCP:** a Context7 MCP server exposes documentation tools natively to compatible agents.

Manual MCP configuration can use the remote endpoint `https://mcp.context7.com/mcp` with a `CONTEXT7_API_KEY` header, or a local server such as `npx -y @upstash/context7-mcp`.

## Plugin Policy

This plugin does not ship a hardcoded `.mcp.json` because:

- users may already have Context7 configured;
- API keys must not be committed;
- Codex and other hosts may differ in MCP configuration shape.

Agents must still prefer Context7 when it is available. If it is unavailable or incomplete, they must use official docs and record the fallback in `docs/wiki/sources.md`.

## Useful Official Source

- https://github.com/upstash/context7#installation

