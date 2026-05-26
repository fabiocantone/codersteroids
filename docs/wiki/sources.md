# Sources

Record all documentation used to justify implementation choices.

| Date | Channel | Library/Topic | Version | URL or Context7 ID | Conclusion |
| --- | --- | --- | --- | --- | --- |
| 2026-05-25 | Official docs | Context7 | current | https://github.com/upstash/context7#installation | Context7 supports CLI + Skills and MCP modes; docs recommend `npx ctx7 setup`; manual MCP can use `https://mcp.context7.com/mcp` with `CONTEXT7_API_KEY`. |
| 2026-05-26 | API fallback | NPM package availability | current | https://registry.npmjs.org/ | Exact package-name checks can use registry status: 200 means present, 404 means no package found for this dry run. |
| 2026-05-26 | API fallback | GitHub repository-name conflicts | current | https://api.github.com/search/repositories | Exact repository-name conflicts can be screened with repository search, but this does not prove trademark, domain, or account/org availability. |

## Required Fields

- Date accessed.
- Channel: Context7 MCP, Context7 CLI, official docs, repo source, or fallback.
- Library/topic.
- Version when known.
- URL or Context7-compatible library ID.
- Specific conclusion used in a plan or implementation.
