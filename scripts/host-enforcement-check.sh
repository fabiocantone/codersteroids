#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

"$ROOT/scripts/skill-smoke-test.sh" >/dev/null
"$ROOT/scripts/check-benchmark-artifacts.sh" >/dev/null

if test -d "$HOME/.codex/plugins/cache/personal/codersteroids/0.1.0"; then
  diff -qr "$ROOT/skills" "$HOME/.codex/plugins/cache/personal/codersteroids/0.1.0/skills" >/dev/null
fi

tmpdir="$(mktemp -d)"
"$ROOT/scripts/cross-agent-export.sh" "$tmpdir/export" >/dev/null
"$ROOT/scripts/cross-agent-export.sh" --check "$tmpdir/export" >/dev/null

required_docs=(
  "$ROOT/docs/host-enforcement.md"
  "$ROOT/docs/install.md"
  "$ROOT/docs/distribution.md"
)

for file in "${required_docs[@]}"; do
  test -f "$file" || { echo "Missing host/distribution doc: ${file#$ROOT/}"; exit 1; }
done

echo "Host enforcement check passed."
echo "Note: model compliance remains host-dependent; scripts verify artifacts, cache, and exported instructions."
