#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

required=(
  "$ROOT/benchmarks/README.md"
  "$ROOT/benchmarks/prompts/external-library-feature.md"
  "$ROOT/benchmarks/prompts/multi-step-bugfix.md"
  "$ROOT/benchmarks/prompts/interrupted-session-recovery.md"
  "$ROOT/benchmarks/prompts/chat-continuity.md"
  "$ROOT/benchmarks/prompts/web-similar-project-research.md"
  "$ROOT/benchmarks/prompts/skill-ecosystem-improvement-research.md"
  "$ROOT/benchmarks/prompts/known-issues-stack-recommendation.md"
  "$ROOT/benchmarks/prompts/superpowers-field-battle.md"
  "$ROOT/benchmarks/prompts/prompt-briefing.md"
  "$ROOT/benchmarks/prompts/self-improvement-loop.md"
  "$ROOT/benchmarks/prompts/tdd-code-review-gap-closing.md"
  "$ROOT/benchmarks/prompts/worktree-branch-lifecycle.md"
  "$ROOT/benchmarks/results/template.md"
)

for file in "${required[@]}"; do
  test -f "$file" || { echo "Missing benchmark artifact: $file"; exit 1; }
done

require_heading() {
  local file="$1"
  local heading="$2"

  grep -qx "$heading" "$file" || {
    echo "Missing required heading '$heading' in benchmark result: $file"
    exit 1
  }
}

require_section_content() {
  local file="$1"
  local heading="$2"

  awk -v heading="$heading" '
    $0 == heading { in_section = 1; next }
    in_section && /^## / { exit }
    in_section && /[^[:space:]]/ { found = 1 }
    END { exit found ? 0 : 1 }
  ' "$file" || {
    echo "Missing content under '$heading' in benchmark result: $file"
    exit 1
  }
}

while IFS= read -r -d '' file; do
  if ! grep -q 'benchmarks/prompts/self-improvement-loop.md' "$file" &&
    [[ "$(basename "$file")" != *self-improvement-loop* ]]; then
    continue
  fi

  require_heading "$file" "## Gap"
  require_heading "$file" "## Change"
  require_heading "$file" "## Expected Behavior Improvement"
  require_heading "$file" "## Before Evidence"
  require_heading "$file" "## After Evidence"
  require_heading "$file" "## Verdict"

  require_section_content "$file" "## Gap"
  require_section_content "$file" "## Before Evidence"
  require_section_content "$file" "## After Evidence"

  grep -Eq '^(Improved|Inconclusive|Worse)([[:space:]].*)?$' "$file" || {
    echo "Self-improvement result must record a verdict of Improved, Inconclusive, or Worse: $file"
    exit 1
  }
done < <(find "$ROOT/benchmarks/results" -maxdepth 1 -type f -name '*.md' ! -name template.md -print0)

while IFS= read -r -d '' file; do
  if ! grep -q 'benchmarks/prompts/tdd-code-review-gap-closing.md' "$file" &&
    [[ "$(basename "$file")" != *tdd-code-review-gap-closing* ]]; then
    continue
  fi

  require_heading "$file" "## Failing Test Evidence"
  require_heading "$file" "## Passing Test Evidence"
  require_heading "$file" "## Broader Verification"
  require_heading "$file" "## Review Result"
  require_heading "$file" "## Verdict"

  require_section_content "$file" "## Failing Test Evidence"
  require_section_content "$file" "## Passing Test Evidence"
  require_section_content "$file" "## Broader Verification"

  grep -q '| Severity | Finding | Evidence | Decision | Verification |' "$file" || {
    echo "TDD/code-review result must include review result table: $file"
    exit 1
  }

  grep -Eq '^(Improved|Inconclusive|Worse)([[:space:]].*)?$' "$file" || {
    echo "TDD/code-review result must record a verdict of Improved, Inconclusive, or Worse: $file"
    exit 1
  }
done < <(find "$ROOT/benchmarks/results" -maxdepth 1 -type f -name '*.md' ! -name template.md -print0)

echo "Benchmark artifacts present."
