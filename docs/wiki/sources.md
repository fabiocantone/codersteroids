# Sources

Record all documentation used to justify implementation choices.

| Date | Channel | Library/Topic | Version | URL or Context7 ID | Conclusion |
| --- | --- | --- | --- | --- | --- |
| 2026-05-25 | Official docs | Context7 | current | https://github.com/upstash/context7#installation | Context7 supports CLI + Skills and MCP modes; docs recommend `npx ctx7 setup`; manual MCP can use `https://mcp.context7.com/mcp` with `CONTEXT7_API_KEY`. |
| 2026-05-26 | API fallback | NPM package availability | current | https://registry.npmjs.org/ | Exact package-name checks can use registry status: 200 means present, 404 means no package found for this dry run. |
| 2026-05-26 | API fallback | GitHub repository-name conflicts | current | https://api.github.com/search/repositories | Exact repository-name conflicts can be screened with repository search, but this does not prove trademark, domain, or account/org availability. |
| 2026-05-26 | Official docs | Playwright browser automation | current | https://playwright.dev/docs/browsers | Playwright is appropriate when research requires real browser rendering, interaction, screenshots, or JS-loaded content. |
| 2026-05-26 | Official docs | Google Programmable Search JSON API | current | https://developers.google.com/custom-search/v1/introduction | Google search via official API requires a Programmable Search Engine and API key; do not assume it is available unless configured. |
| 2026-05-26 | Web/GitHub API | CoderSteroids similar-project research | current as checked | https://github.com/obra/superpowers, https://github.com/SuperagenticAI/specmem, https://github.com/jumbocontext/jumbo.cli, https://github.com/MountainUnicorn/add, https://github.com/agentsmd/agents.md | CoderSteroids is not category-unique: Superpowers/ADD overlap on agent methodology, SpecMem/Jumbo/agentmemory overlap on memory/context, and AGENTS.md overlaps on portable agent instructions. Its distinct angle is the Codex-specific combination of lightweight skills, living roadmap, Markdown LLM Wiki, current-doc verification, and benchmark discipline. |
| 2026-05-26 | GitHub API | Similar project metadata | current as checked | `GET /repos/{owner}/{repo}` for `obra/superpowers`, `MountainUnicorn/add`, `SuperagenticAI/specmem`, `jumbocontext/jumbo.cli`, `agentsmd/agents.md`, `fabiocantone/codersteroids` | Verified stars, forks, created/pushed dates, latest release status, license, and descriptions for the similar-project benchmark. |

## Required Fields

- Date accessed.
- Channel: Context7 MCP, Context7 CLI, official docs, repo source, or fallback.
- Library/topic.
- Version when known.
- URL or Context7-compatible library ID.
- Specific conclusion used in a plan or implementation.
