---
name: recommendation-verification
description: Use when suggesting names, tools, libraries, services, vendors, domains, repositories, APIs, or options whose availability or current status matters
---

# Recommendation Verification

## Overview

Recommendations that depend on external availability must be verified before they are presented. Do not make the user sort through options that should have been filtered already.

## Gate

Before suggesting options:

1. Define what "available" means for the task.
2. Check the relevant external source.
3. Filter out unavailable, taken, deprecated, incompatible, or unverified options.
4. Label partial checks honestly.
5. Present only options that meet the criteria, or clearly separate "verified" from "not verified."

## Examples

- Product or plugin name: check GitHub account/org, exact repo conflicts when relevant, package registry, and domain if requested.
- Project idea: use `web-and-github-research` to find similar repos and current alternatives before recommending a direction.
- Library choice: check maintenance, version compatibility, official docs, and project fit.
- API recommendation: check current official docs or Context7.
- Service choice: check current pricing/status if it affects the recommendation.

## Required Output

For each recommended option, include:

- Source checked.
- Result.
- Date.
- Limitation, if any.

## Stop Conditions

Do not present unverified options as recommendations when verification was requested or obviously necessary. If rate limited or blocked, say so and recommend only the verified subset.
