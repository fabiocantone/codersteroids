#!/usr/bin/env bash
set -u

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
WIKI="$ROOT/docs/wiki"

failures=0
warnings=0

pass() {
  printf 'PASS %s\n' "$1"
}

warn() {
  warnings=$((warnings + 1))
  printf 'WARN %s\n' "$1"
}

fail() {
  failures=$((failures + 1))
  printf 'FAIL %s\n' "$1"
}

required_files=(
  "$ROOT/docs/roadmap.md"
  "$WIKI/index.md"
  "$WIKI/session-state.md"
  "$WIKI/thread-ledger.md"
  "$WIKI/architecture.md"
  "$WIKI/decisions.md"
  "$WIKI/sources.md"
  "$WIKI/code-standards.md"
  "$WIKI/open-questions.md"
)

if ! test -d "$WIKI" || ! test -f "$ROOT/docs/roadmap.md"; then
  pass "private project memory is not tracked in this public repository"
  private_patterns=(
    "/"'Users/'
    "local-first-personal-"'assistant'
    "Compet"itoor
    "cmp""_[A-Za-z0-9_]+"
    "API-"Key
    "X-API-"Key
  )
  private_regex="$(IFS='|'; printf '%s' "${private_patterns[*]}")"
  find "$ROOT" \
    \( -path "$ROOT/.git" -o -path "$ROOT/scripts/memory-audit.sh" \) -prune -o \
    -type f \( -name '*.md' -o -name '*.json' -o -name '*.sh' -o -name '*.mdc' \) -print0 |
    xargs -0 grep -Eni "$private_regex" \
      >/tmp/codersteroids-public-audit.$$ 2>/dev/null
  if test -s /tmp/codersteroids-public-audit.$$; then
    fail "public repository contains private path or secret-like marker(s):"
    sed 's/^/FAIL   /' /tmp/codersteroids-public-audit.$$
  else
    pass "public docs/scripts have no known private path or secret-like markers"
  fi
  rm -f /tmp/codersteroids-public-audit.$$
  printf '\nSummary: %s failure(s), %s warning(s)\n' "$failures" "$warnings"
  if test "$failures" -gt 0; then
    exit 1
  fi
  exit 0
fi

for file in "${required_files[@]}"; do
  if test -f "$file"; then
    pass "memory file exists: ${file#$ROOT/}"
  else
    fail "missing memory file: ${file#$ROOT/}"
  fi
done

if test -f "$ROOT/docs/roadmap.md" && grep -q '^## Next Action$' "$ROOT/docs/roadmap.md"; then
  pass "roadmap has Next Action"
else
  fail "roadmap missing Next Action"
fi

if test -f "$WIKI/session-state.md" && grep -q '^## Next Action$' "$WIKI/session-state.md"; then
  pass "session-state has Next Action"
else
  fail "session-state missing Next Action"
fi

if test -f "$WIKI/sources.md"; then
  bad_sources="$(awk -F'|' '/^\| 20[0-9][0-9]-/{ if (NF < 7) print NR }' "$WIKI/sources.md" | tr '\n' ' ')"
  if test -n "$bad_sources"; then
    fail "source ledger rows have too few fields at lines: $bad_sources"
  else
    pass "source ledger rows have required fields"
  fi
fi

if test -f "$WIKI/decisions.md"; then
  duplicates="$(grep '^## 20[0-9][0-9]-' "$WIKI/decisions.md" | sort | uniq -d | tr '\n' ' ')"
  if test -n "$duplicates"; then
    fail "duplicate decision headings: $duplicates"
  else
    pass "decision headings are unique"
  fi
fi

if test -f "$WIKI/thread-ledger.md"; then
  for field in Intent Completed Changed Decisions Verification Next; do
    if grep -q "^\\*\\*$field:\\*\\*" "$WIKI/thread-ledger.md"; then
      pass "thread ledger includes $field fields"
    else
      fail "thread ledger missing $field fields"
    fi
  done
fi

for file in "${required_files[@]}"; do
  test -f "$file" || continue
  lines="$(wc -l < "$file" | tr -d ' ')"
  if test "$lines" -gt 350; then
    warn "memory page over 350 lines, consider summarizing: ${file#$ROOT/} ($lines lines)"
  else
    pass "memory page size acceptable: ${file#$ROOT/} ($lines lines)"
  fi
done

if grep -Rni 'pending final validation\|verification pending\|TODO\|TBD\|not populated yet' "$ROOT/docs" "$ROOT/benchmarks" >/tmp/codersteroids-memory-audit-markers.$$ 2>/dev/null; then
  warn "review stale marker(s):"
  sed 's/^/WARN   /' /tmp/codersteroids-memory-audit-markers.$$
else
  pass "no stale pending/TODO markers found in docs or benchmarks"
fi
rm -f /tmp/codersteroids-memory-audit-markers.$$

printf '\nSummary: %s failure(s), %s warning(s)\n' "$failures" "$warnings"

if test "$failures" -gt 0; then
  exit 1
fi
