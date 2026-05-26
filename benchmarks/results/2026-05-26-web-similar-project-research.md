# Web And Similar Project Research Benchmark

## Metadata

- Date: 2026-05-26
- Runner: Codex with CoderSteroids requested
- Methodology: CoderSteroids
- Scenario: Research whether a project like CoderSteroids already exists

## Prompt Basis

```text
Use CoderSteroids. Research whether a project like CoderSteroids already exists. Do not rely on memory. Use current web research, GitHub search for similar projects, and browser/search tools if needed. Verify dates, versions, repo activity, and limitations. Then tell me whether CoderSteroids is meaningfully different from existing projects.
```

## Result Summary

A project like CoderSteroids exists in pieces. CoderSteroids is meaningfully different only when positioned narrowly: a small Codex-first methodology plugin that combines roadmap-first planning, Markdown LLM Wiki memory, current-doc/source verification, and benchmark gates. It is not meaningfully different as a broad "agent methodology + durable memory" category.

## Verified GitHub Evidence

Checked with GitHub API on 2026-05-26.

| Project | Stars | Forks | Created | Last pushed | Latest release | License | Relevance |
| --- | ---: | ---: | --- | --- | --- | --- | --- |
| `obra/superpowers` | 207090 | 18439 | 2025-10-09 | 2026-05-24 | `v5.1.0`, 2026-05-04 | MIT | Strong overlap: skills, planning, TDD, debugging, verification, Codex support. |
| `MountainUnicorn/add` | 11 | 5 | 2026-02-07 | 2026-04-30 | `v0.9.5`, 2026-04-30 | MIT | Strong overlap: agent-driven development, spec-driven TDD, verification. |
| `SuperagenticAI/specmem` | 24 | 4 | 2025-12-01 | 2026-05-26 | none found | AGPL-3.0 | Strong memory/spec overlap. |
| `jumbocontext/jumbo.cli` | 83 | 6 | 2025-12-05 | 2026-05-26 | `3.2.1`, 2026-05-25 | AGPL-3.0 | Strong persistent memory/context overlap. |
| `agentsmd/agents.md` | 21695 | 1586 | 2025-08-19 | 2026-03-12 | none found | MIT | Medium overlap: portable agent instruction format. |
| `fabiocantone/codersteroids` | 0 | 0 | 2026-05-26 | 2026-05-26 | none found | none reported by API | Exact repo exists; no adoption signal yet. |

## Classification

- **Competitor / mature reference:** `obra/superpowers`.
- **Adjacent methodology:** `MountainUnicorn/add`.
- **Adjacent memory/context tooling:** `SuperagenticAI/specmem`, `jumbocontext/jumbo.cli`, agentmemory-style projects.
- **Instruction convention:** `agentsmd/agents.md`.
- **CoderSteroids distinct angle:** composition and packaging for Codex: living roadmap, thread ledger, Markdown wiki memory, current-doc/source ledger, recommendation verification, and benchmark discipline.

## Scorecard

| Dimension | Score 0-2 | Evidence |
| --- | ---: | --- |
| Current web/GitHub research used | 2 | GitHub API checks captured stars, forks, dates, releases, licenses, and descriptions. |
| Similar projects identified | 2 | Direct, adjacent, memory, and instruction-format projects were separated. |
| Dates/versions checked | 2 | Created dates, pushed dates, and latest releases were recorded where available. |
| Limitations stated | 2 | Result says CoderSteroids is not category-unique and has no adoption signal yet. |
| Recommendation grounded | 2 | Positioning is narrowed to Codex-first composition rather than broad novelty. |

## Result

Pass for `web-and-github-research`: the run found similar projects, verified current GitHub metadata, avoided uniqueness overclaiming, and produced a differentiated positioning statement.

