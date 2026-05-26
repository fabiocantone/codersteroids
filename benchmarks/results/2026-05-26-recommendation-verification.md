# Recommendation Verification Partial Dry Run

## Metadata

- Date: 2026-05-26
- Runner: Codex with CoderSteroids skills active
- Methodology: CoderSteroids
- Scenario: Availability-dependent naming prompt, partial check

## Prompt Tested

"Suggest names for an assistant methodology plugin. Verify availability before recommending names."

## Availability Criteria

- NPM package name check returns 404 for the exact candidate.
- GitHub repository search returns no exact repository-name match for the candidate.
- Domain availability, trademark status, and GitHub account/org availability were out of scope for this dry run. This means this file is evidence that the agent filtered some unavailable options, not evidence that the full naming recommendation policy passed.

## Sources Checked

- NPM registry API: `https://registry.npmjs.org/<candidate>`
- GitHub repository search API: `https://api.github.com/search/repositories?q=<candidate>%20in:name`

## Candidate Filtering

| Candidate | NPM result | GitHub exact-name result | Outcome |
| --- | --- | --- | --- |
| `superpowers` | 200, package exists | Exact matches found: `obra/superpowers`, `superhq-ai/superpowers` | Filtered |
| `codersteroids` | 404, package not found | Exact match found: `fabiocantone/codersteroids` | Filtered |
| `codex-steroids` | 404, package not found | No exact repository-name match found | Recommended with limitations |
| `evidencepilot` | 404, package not found | Exact matches found: `Cybereye-bjtu/EvidencePilot`, `MasayukiTanaka0412/EvidencePilot` | Filtered |
| `proofmode` | 404, package not found | Exact matches found: `akabonge/proofmode`, `kweenkeen/ProofMode` | Filtered |
| `methodsmith` | 404, package not found | No exact repository-name match found | Recommended with limitations |
| `tracebench` | 200, package exists | Exact matches found in GitHub search results | Filtered |

## Verified Recommendations

| Option | Source checked | Result | Date | Limitation |
| --- | --- | --- | --- | --- |
| `methodsmith` | NPM registry and GitHub repository search | NPM returned 404; GitHub returned zero exact repository-name matches | 2026-05-26 | No domain, trademark, package namespace beyond NPM, or GitHub org/account availability check |
| `codex-steroids` | NPM registry and GitHub repository search | NPM returned 404; GitHub returned zero exact repository-name matches | 2026-05-26 | No domain, trademark, package namespace beyond NPM, or GitHub org/account availability check |

## Result

The recommendation gate behaved correctly for the scoped checks: unavailable or conflicting candidates were filtered before recommendations were presented, and recommended options include sources, results, date, and limitations.

## Remaining Full Test

Run a follow-up naming prompt that requires:

- GitHub account/org availability.
- No exact GitHub repository-name conflicts.
- Optional package registry checks only when package publication matters.
- Clear exclusion of rate-limited or unverified names.
