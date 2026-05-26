#!/usr/bin/env bash
set -u

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PLUGIN_NAME="codersteroids"
PLUGIN_VERSION="0.1.0"
CACHE_DIR="${CODEX_PLUGIN_CACHE:-$HOME/.codex/plugins/cache/personal/$PLUGIN_NAME/$PLUGIN_VERSION}"
MARKETPLACE_FILE="${CODERSTEROIDS_MARKETPLACE:-$HOME/.agents/plugins/marketplace.json}"
CODEX_CONFIG="${CODEX_CONFIG:-$HOME/.codex/config.toml}"

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

has_file() {
  test -f "$1"
}

check_manifest() {
  local manifest="$ROOT/.codex-plugin/plugin.json"

  if ! has_file "$manifest"; then
    fail "missing plugin manifest: $manifest"
    return
  fi

  if grep -q "\"name\"[[:space:]]*:[[:space:]]*\"$PLUGIN_NAME\"" "$manifest"; then
    pass "manifest name is $PLUGIN_NAME"
  else
    fail "manifest name is not $PLUGIN_NAME"
  fi

  if grep -q "\"version\"[[:space:]]*:[[:space:]]*\"$PLUGIN_VERSION\"" "$manifest"; then
    pass "manifest version is $PLUGIN_VERSION"
  else
    warn "manifest version differs from expected $PLUGIN_VERSION"
  fi

  if grep -q '"skills"[[:space:]]*:[[:space:]]*"\./skills/"' "$manifest"; then
    pass "manifest skills path points to ./skills/"
  else
    fail "manifest skills path should point to ./skills/"
  fi
}

check_skills() {
  local names_file
  local duplicates
  names_file="$(mktemp)"

  if ! test -d "$ROOT/skills"; then
    fail "missing skills directory: $ROOT/skills"
    rm -f "$names_file"
    return
  fi

  for dir in "$ROOT"/skills/*; do
    test -d "$dir" || continue
    local skill
    local file
    skill="$(basename "$dir")"
    file="$dir/SKILL.md"

    if ! has_file "$file"; then
      fail "missing SKILL.md for skill: $skill"
      continue
    fi

    if grep -q '^---$' "$file"; then
      pass "$skill has frontmatter fence"
    else
      fail "$skill missing frontmatter fence"
    fi

    if grep -q "^name: $skill$" "$file"; then
      pass "$skill name matches folder"
    else
      fail "$skill name does not match folder"
    fi

    if grep -q '^description: Use when ' "$file"; then
      pass "$skill has trigger-style description"
    else
      fail "$skill description must start with 'Use when'"
    fi

    sed -n 's/^name: //p' "$file" | head -n 1 >> "$names_file"
  done

  duplicates="$(sort "$names_file" | uniq -d | tr '\n' ' ')"
  if test -n "$duplicates"; then
    fail "duplicate skill names: $duplicates"
  else
    pass "skill names are unique"
  fi

  rm -f "$names_file"
}

check_cache() {
  if ! test -d "$CACHE_DIR"; then
    fail "installed cache missing: $CACHE_DIR"
    printf 'FIX  reinstall plugin or sync cache after installation\n'
    return
  fi

  pass "installed cache exists: $CACHE_DIR"

  if diff -qr "$ROOT/skills" "$CACHE_DIR/skills" >/dev/null 2>&1; then
    pass "cached skills match repository skills"
  else
    fail "cached skills differ from repository skills"
    printf 'FIX  rsync -a --delete %s/ %s/\n' "$ROOT/skills" "$CACHE_DIR/skills"
  fi

  if diff -q "$ROOT/.codex-plugin/plugin.json" "$CACHE_DIR/.codex-plugin/plugin.json" >/dev/null 2>&1; then
    pass "cached manifest matches repository manifest"
  else
    fail "cached manifest differs from repository manifest"
  fi
}

check_marketplace() {
  if ! has_file "$MARKETPLACE_FILE"; then
    warn "personal marketplace file not found: $MARKETPLACE_FILE"
    return
  fi

  if grep -q "\"name\"[[:space:]]*:[[:space:]]*\"$PLUGIN_NAME\"" "$MARKETPLACE_FILE"; then
    pass "personal marketplace references $PLUGIN_NAME"
  else
    fail "personal marketplace does not reference $PLUGIN_NAME"
  fi

  if grep -q 'evidence-first-methodology' "$MARKETPLACE_FILE"; then
    fail "personal marketplace still references evidence-first-methodology"
  else
    pass "personal marketplace has no old plugin name"
  fi
}

check_codex_config() {
  if ! has_file "$CODEX_CONFIG"; then
    warn "Codex config not found: $CODEX_CONFIG"
    return
  fi

  if grep -q "\\[plugins\\.\"$PLUGIN_NAME@personal\"\\]" "$CODEX_CONFIG" &&
    awk "/\\[plugins\\.\"$PLUGIN_NAME@personal\"\\]/{flag=1;next}/^\\[/{flag=0}flag && /^enabled[[:space:]]*=/{print}" "$CODEX_CONFIG" | grep -q 'true'; then
    pass "Codex config enables $PLUGIN_NAME@personal"
  else
    fail "Codex config does not enable $PLUGIN_NAME@personal"
  fi

  if awk '/\[plugins\."evidence-first-methodology@personal"\]/{flag=1;next}/^\[/{flag=0}flag && /^enabled[[:space:]]*=/{print}' "$CODEX_CONFIG" | grep -q 'true'; then
    fail "old evidence-first-methodology@personal plugin is still enabled"
  else
    pass "old evidence-first-methodology plugin is not enabled"
  fi
}

check_benchmarks() {
  local required=(
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
    "$ROOT/benchmarks/prompts/small-task-fast-path.md"
    "$ROOT/benchmarks/prompts/subagent-execution-controller.md"
    "$ROOT/benchmarks/results/template.md"
  )

  local file
  for file in "${required[@]}"; do
    if has_file "$file"; then
      pass "benchmark artifact exists: ${file#$ROOT/}"
    else
      fail "missing benchmark artifact: ${file#$ROOT/}"
    fi
  done
}

check_scripts() {
  local required=(
    "$ROOT/scripts/benchmark-runner.sh"
    "$ROOT/scripts/check-benchmark-artifacts.sh"
    "$ROOT/scripts/cross-agent-export.sh"
    "$ROOT/scripts/doctor.sh"
    "$ROOT/scripts/memory-audit.sh"
    "$ROOT/scripts/project-bootstrap.sh"
    "$ROOT/scripts/skill-smoke-test.sh"
    "$ROOT/scripts/validate.sh"
  )

  local file
  for file in "${required[@]}"; do
    if test -x "$file"; then
      pass "script executable: ${file#$ROOT/}"
    else
      fail "script missing or not executable: ${file#$ROOT/}"
    fi
  done
}

check_manifest
check_skills
check_cache
check_marketplace
check_codex_config
check_benchmarks
check_scripts

printf '\nSummary: %s failure(s), %s warning(s)\n' "$failures" "$warnings"

if test "$failures" -gt 0; then
  exit 1
fi
