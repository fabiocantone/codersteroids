#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

required_files=(
  "$ROOT/README.md"
  "$ROOT/LICENSE"
  "$ROOT/CHANGELOG.md"
  "$ROOT/CONTRIBUTING.md"
  "$ROOT/.codex-plugin/plugin.json"
  "$ROOT/.claude-plugin/plugin.json"
  "$ROOT/docs/claude-marketplace-submission.md"
  "$ROOT/docs/install.md"
  "$ROOT/docs/distribution.md"
  "$ROOT/docs/host-enforcement.md"
  "$ROOT/docs/release-checklist.md"
)

for file in "${required_files[@]}"; do
  test -f "$file" || { echo "Missing release-readiness file: ${file#$ROOT/}"; exit 1; }
done

grep -q '"license"[[:space:]]*:[[:space:]]*"MIT"' "$ROOT/.codex-plugin/plugin.json" || {
  echo "Manifest license must match LICENSE file"
  exit 1
}

grep -q '"license"[[:space:]]*:[[:space:]]*"MIT"' "$ROOT/.claude-plugin/plugin.json" || {
  echo "Claude manifest license must match LICENSE file"
  exit 1
}

if command -v claude >/dev/null 2>&1; then
  claude plugin validate "$ROOT" >/dev/null
else
  echo "Claude CLI missing; cannot validate Claude marketplace package"
  exit 1
fi

grep -q '^## 0.1.0 - 2026-05-27$' "$ROOT/CHANGELOG.md" || {
  echo "CHANGELOG missing 0.1.0 release entry"
  exit 1
}

"$ROOT/scripts/skill-smoke-test.sh" >/dev/null
"$ROOT/scripts/host-enforcement-check.sh" >/dev/null
"$ROOT/scripts/benchmark-runner.sh" --check >/dev/null

echo "Release readiness check passed."
