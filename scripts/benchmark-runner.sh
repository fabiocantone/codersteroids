#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROMPTS_DIR="$ROOT/benchmarks/prompts"
RESULTS_DIR="$ROOT/benchmarks/results"

usage() {
  cat <<'USAGE'
Usage:
  ./scripts/benchmark-runner.sh --list
  ./scripts/benchmark-runner.sh <prompt-slug> [result-slug]

Examples:
  ./scripts/benchmark-runner.sh known-issues-stack-recommendation
  ./scripts/benchmark-runner.sh known-issues-stack-recommendation tauri-chat-stack-run
USAGE
}

if test "${1:-}" = "--help" || test "${1:-}" = "-h"; then
  usage
  exit 0
fi

if test "${1:-}" = "--list"; then
  find "$PROMPTS_DIR" -maxdepth 1 -type f -name '*.md' -print |
    sed "s#^$PROMPTS_DIR/##; s#\\.md\$##" |
    sort
  exit 0
fi

prompt_slug="${1:-}"
result_slug="${2:-$prompt_slug}"

if test -z "$prompt_slug"; then
  usage
  exit 1
fi

prompt_file="$PROMPTS_DIR/$prompt_slug.md"
if ! test -f "$prompt_file"; then
  echo "Missing benchmark prompt: $prompt_file"
  echo "Available prompts:"
  "$0" --list
  exit 1
fi

mkdir -p "$RESULTS_DIR"
date_prefix="$(date +%F)"
result_file="$RESULTS_DIR/$date_prefix-$result_slug.md"

if test -e "$result_file"; then
  echo "Refusing to overwrite existing result: $result_file"
  exit 1
fi

prompt_title="$(sed -n '1s/^# //p' "$prompt_file")"
if test -z "$prompt_title"; then
  prompt_title="$prompt_slug"
fi

{
  echo "# Benchmark Run"
  echo
  echo "## Metadata"
  echo
  echo "- Date: $date_prefix"
  echo "- Runner:"
  echo "- Methodology: CoderSteroids"
  echo "- Scenario: $prompt_title"
  echo "- Prompt: \`benchmarks/prompts/$prompt_slug.md\`"
  echo
  echo "## Required Preflight"
  echo
  echo "- [ ] \`./scripts/doctor.sh\`"
  echo "- [ ] \`./scripts/memory-audit.sh\`"
  echo "- [ ] Current docs/source checks recorded when relevant"
  echo
  echo "## Research Summary"
  echo
  echo "**Date checked:** $date_prefix"
  echo
  echo "**Question:**"
  echo
  echo "**Sources checked:**"
  echo
  echo "**Confirmed:**"
  echo
  echo "**Known issues:**"
  echo
  echo "**Limitations:**"
  echo
  echo "## Scorecard"
  echo
  echo "| Dimension | Score 0-2 | Evidence |"
  echo "| --- | ---: | --- |"
  echo "| Current docs used before code |  |  |"
  echo "| Written plan before implementation |  |  |"
  echo "| Roadmap updated |  |  |"
  echo "| Wiki memory updated |  |  |"
  echo "| Decisions reused after interruption |  |  |"
  echo "| Verification evidence provided |  |  |"
  echo "| Folder/code standards respected |  |  |"
  echo "| Overhead acceptable |  |  |"
  echo
  echo "## Notes"
  echo
  echo "## Go/No-Go Implication"
  echo
  echo "## Prompt"
  echo
  sed 's/^/> /' "$prompt_file"
} > "$result_file"

echo "Created benchmark result scaffold: $result_file"
