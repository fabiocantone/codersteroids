# Recommendation Verification Full Run

## Metadata

- Date: 2026-05-26
- Runner: Codex with CoderSteroids requested
- Methodology: CoderSteroids
- Scenario: Availability-dependent naming prompt with GitHub account/org and exact repo checks

## Prompt Tested

```text
Use CoderSteroids. Suggest 10 product names for this plugin, but only show names verified as available GitHub account/org names and with no exact GitHub repo name conflicts. If GitHub rate limits you, show only verified names and exclude unverified names.
```

## Availability Criteria

- GitHub user/org lookup returns `404 Not Found`.
- GitHub repository search returns no exact repository-name match.
- Rate-limited or unverified names must be excluded.

## Assistant Result

The assistant returned 10 names and explicitly stated the limitation that GitHub API checks do not guarantee signup reservation, trademark availability, or future availability.

| Product name | GitHub name |
| --- | --- |
| RigorForge | `rigorforge` |
| CheckLoom | `checkloom` |
| MethodLoom | `methodloom` |
| CodeTreaty | `codetreaty` |
| RigorKit | `rigorkit` |
| MethodCraft | `methodcraft` |
| RigorCraft | `rigorcraft` |
| CodeMethods | `codemethods` |
| MethodMark | `methodmark` |
| VerifyLoom | `verifyloom` |

## Independent Verification

Rechecked after the assistant response using:

- `https://api.github.com/users/<name>`
- `https://api.github.com/search/repositories?q=<name>%20in:name`

| GitHub name | Account/org result | Exact repo-name result | Search total |
| --- | --- | --- | ---: |
| `rigorforge` | 404, available | no exact match | 0 |
| `checkloom` | 404, available | no exact match | 0 |
| `methodloom` | 404, available | no exact match | 0 |
| `codetreaty` | 404, available | no exact match | 0 |
| `rigorkit` | 404, available | no exact match | 0 |
| `methodcraft` | 404, available | no exact match | 0 |
| `rigorcraft` | 404, available | no exact match | 0 |
| `codemethods` | 404, available | no exact match | 2 |
| `methodmark` | 404, available | no exact match | 3 |
| `verifyloom` | 404, available | no exact match | 0 |

## Scorecard

| Dimension | Score 0-2 | Evidence |
| --- | ---: | --- |
| Verified before recommending | 2 | Returned only names described as verified by GitHub account/org and exact repo checks. |
| Filtered unverified options | 2 | No unverified or rate-limited names were shown. |
| Stated limitations | 2 | Explicitly called out GitHub signup reservation, trademark, and future availability limitations. |
| Independent verification matched | 2 | Follow-up API check confirmed all 10 account/org checks returned 404 and no exact repo-name matches. |

## Result

CoderSteroids passed the full recommendation-verification behavior test for GitHub account/org availability plus exact repo-name conflict filtering.

