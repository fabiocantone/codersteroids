#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

required=(
  "$ROOT/benchmarks/README.md"
  "$ROOT/benchmarks/prompts/external-library-feature.md"
  "$ROOT/benchmarks/prompts/multi-step-bugfix.md"
  "$ROOT/benchmarks/prompts/interrupted-session-recovery.md"
  "$ROOT/benchmarks/results/template.md"
)

for file in "${required[@]}"; do
  test -f "$file" || { echo "Missing benchmark artifact: $file"; exit 1; }
done

echo "Benchmark artifacts present."

