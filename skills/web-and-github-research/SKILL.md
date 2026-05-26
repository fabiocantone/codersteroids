---
name: web-and-github-research
description: Use when researching current web information, comparing similar projects, validating market/project uniqueness, or inspecting pages that may require browser rendering
---

# Web And GitHub Research

## Overview

Research should produce filtered, dated evidence, not a pile of links. Use the cheapest reliable source first, and escalate to browser automation when static results are not enough.

## Source Order

1. Context7 for versioned library/API documentation.
2. Official docs or primary source pages.
3. GitHub API/search for similar projects, repo health, examples, and implementation patterns.
4. Search engine results, preferably Google/Programmable Search when configured.
5. Playwright/browser automation when a page requires rendering, interaction, screenshots, or JS-loaded content.

## Similar Project Search

When evaluating a project idea, search GitHub before recommending direction:

- Search exact name and close variants.
- Search problem keywords.
- Search implementation keywords.
- Inspect top repos for stars, recency, license, language, and scope.
- Identify whether they are competitors, inspiration, or unrelated false positives.

## Date And Version Gate

Every research summary must include:

- Date checked.
- Source and URL/API.
- Version or recency indicator when available.
- What was confirmed.
- What remains unverified.

## Playwright Gate

Use Playwright/browser automation when:

- Search result pages or docs are JS-rendered.
- The answer depends on visible UI state.
- Screenshots or interaction are needed.
- Static fetch/search disagrees with what users see.

Do not use Playwright just to read simple static docs.

## Output Shape

```markdown
## Research Summary

**Date:** YYYY-MM-DD
**Question:** ...
**Sources checked:** ...
**Confirmed:** ...
**Similar projects:** ...
**Limitations:** ...
**Recommendation:** ...
```

## Common Mistakes

- Recommending an idea before checking GitHub for similar projects.
- Citing undated blog posts as current truth.
- Treating GitHub popularity as product-market proof.
- Using search snippets without opening primary sources.

