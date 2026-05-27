#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
strict_autostart=0

if test "${1:-}" = "--strict-autostart"; then
  strict_autostart=1
elif test "${1:-}" = "--help" || test "${1:-}" = "-h"; then
  cat <<'USAGE'
Usage:
  ./scripts/host-enforcement-check.sh
  ./scripts/host-enforcement-check.sh --strict-autostart

--strict-autostart fails when a competing always-on methodology plugin such as
Superpowers is enabled, because a fresh chat may invoke that bootstrap first.
USAGE
  exit 0
fi

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

CODEX_CONFIG="${CODEX_CONFIG:-$HOME/.codex/config.toml}"
if test -f "$CODEX_CONFIG" &&
  awk '/\[plugins\."superpowers@openai-curated"\]/{flag=1;next}/^\[/{flag=0}flag && /^enabled[[:space:]]*=/{print}' "$CODEX_CONFIG" | grep -q 'true'; then
  if test "$strict_autostart" -eq 1; then
    echo "Strict auto-start failed: superpowers@openai-curated is enabled."
    echo "Disable Superpowers or run the manual test expecting host bootstrap to mention it first."
    exit 1
  fi
  echo "WARN Superpowers is enabled; strict CoderSteroids-first auto-start cannot be guaranteed."
fi

echo "Host enforcement check passed."
echo "Note: model compliance remains host-dependent; scripts verify artifacts, cache, and exported instructions."
