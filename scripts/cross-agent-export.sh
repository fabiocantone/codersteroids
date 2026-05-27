#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
mode="write"
target=""

usage() {
  cat <<'USAGE'
Usage:
  ./scripts/cross-agent-export.sh [--check] [--force] /path/to/repo

Writes portable CoderSteroids instructions to:
  AGENTS.md
  CLAUDE.md
  GEMINI.md
  .cursor/rules/codersteroids.mdc
USAGE
}

case "${1:-}" in
  --check)
    mode="check"
    shift
    ;;
  --force)
    mode="force"
    shift
    ;;
  --help|-h)
    usage
    exit 0
    ;;
esac

target="${1:-}"
if test -z "$target"; then
  usage
  exit 1
fi

mkdir -p "$target"

generated_marker="Generated from CoderSteroids"

render_content() {
  cat <<'CONTENT'
# CoderSteroids Agent Instructions

Generated from CoderSteroids. Preserve stronger user and repository instructions when they conflict with this file.

## Instruction Priority

1. User request.
2. Repository instructions.
3. CoderSteroids methodology.
4. Default agent behavior.

## Operating Rules

- Apply CoderSteroids automatically for coding, debugging, planning, review, research, prompt rewriting, handoff, benchmark, and project-memory tasks unless the user explicitly disables it.
- Respond in the same language as the user's latest request unless the user asks otherwise.
- For tiny local tasks, use the small-task fast path and verify directly.
- For ambiguous product or architecture work, write a working spec before implementation.
- For prompt rewriting, prompt generation, or handoff prompts, use CoderSteroids prompt briefing automatically.
- For non-trivial work, keep a written plan and execute it through checkpoints.
- Check current documentation and known issues before using external APIs, SDKs, frameworks, runtimes, or stack recommendations.
- Preserve roadmap/wiki/session memory when the project provides it.
- Use test-first development for testable behavior changes unless a skip reason and substitute evidence are explicit.
- Use severity-based code review before declaring risky or meaningful work ready.
- Check branch/workspace state before risky work; do not overwrite unrelated user changes.
- Use observability, logs, metrics, traces, profiles, or an instrumentation plan for runtime diagnosis.
- Verify before completion with fresh commands.
- Update durable memory, decisions, sources, roadmap, and folder docs after meaningful work.

## Expected Memory Files

- `docs/roadmap.md`
- `docs/wiki/session-state.md`
- `docs/wiki/thread-ledger.md`
- `docs/wiki/decisions.md`
- `docs/wiki/sources.md`
- `docs/wiki/architecture.md`

## Completion Report

Report scope, files changed, verification run, memory/docs updates, and residual risk.
CONTENT
}

write_file() {
  local file="$1"

  if test -f "$file" && ! grep -q "$generated_marker" "$file" && test "$mode" != "force"; then
    echo "Refusing to overwrite non-CoderSteroids file: $file"
    echo "Use --force only after reviewing the existing instructions."
    exit 1
  fi

  render_content > "$file"
}

check_file() {
  local file="$1"

  test -f "$file" || {
    echo "Missing export file: $file"
    exit 1
  }

  grep -q "$generated_marker" "$file" || {
    echo "Export file missing CoderSteroids marker: $file"
    exit 1
  }

  grep -q "Verify before completion" "$file" || {
    echo "Export file missing verification rule: $file"
    exit 1
  }

  grep -q "same language as the user's latest request" "$file" || {
    echo "Export file missing language rule: $file"
    exit 1
  }

  grep -q "prompt rewriting" "$file" || {
    echo "Export file missing prompt rewriting auto-activation rule: $file"
    exit 1
  }
}

if test "$mode" = "check"; then
  check_file "$target/AGENTS.md"
  check_file "$target/CLAUDE.md"
  check_file "$target/GEMINI.md"
  check_file "$target/.cursor/rules/codersteroids.mdc"
  echo "Cross-agent export check passed: $target"
  exit 0
fi

mkdir -p "$target/.cursor/rules"

write_file "$target/AGENTS.md"
write_file "$target/CLAUDE.md"
write_file "$target/GEMINI.md"
write_file "$target/.cursor/rules/codersteroids.mdc"

"$ROOT/scripts/cross-agent-export.sh" --check "$target"
