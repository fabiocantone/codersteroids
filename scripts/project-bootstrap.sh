#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
MODE="write"

usage() {
  cat <<'USAGE'
Usage:
  ./scripts/project-bootstrap.sh [--check] /path/to/target-repo

Exports lightweight CoderSteroids helpers into a target repository:
  scripts/codersteroids/check-field-depth-report.sh
  docs/codersteroids/field-depth-report-template.md
  docs/codersteroids/README.md
USAGE
}

if test "${1:-}" = "--help" || test "${1:-}" = "-h"; then
  usage
  exit 0
fi

if test "${1:-}" = "--check"; then
  MODE="check"
  shift
fi

TARGET="${1:-}"

if test -z "$TARGET"; then
  usage
  exit 1
fi

if ! test -d "$TARGET"; then
  echo "Target repo does not exist: $TARGET"
  exit 1
fi

target_root="$(cd "$TARGET" && pwd)"

declare -a mappings=(
  "$ROOT/scripts/check-field-depth-report.sh|$target_root/scripts/codersteroids/check-field-depth-report.sh"
  "$ROOT/docs/examples/field-depth-report-template.md|$target_root/docs/codersteroids/field-depth-report-template.md"
)

readme_target="$target_root/docs/codersteroids/README.md"

write_readme() {
  cat > "$readme_target" <<'README'
# CoderSteroids Helpers

This folder contains lightweight helper artifacts exported from CoderSteroids.

## Field Depth Report

Use the template:

```bash
docs/codersteroids/field-depth-report-template.md
```

Validate a completed field-depth report with:

```bash
scripts/codersteroids/check-field-depth-report.sh path/to/report.md
```

The checker validates report structure only. It does not prove the analysis is correct.
README
}

check_file() {
  local src="$1"
  local dest="$2"

  if ! test -f "$dest"; then
    echo "MISSING ${dest#$target_root/}"
    return 1
  fi

  if cmp -s "$src" "$dest"; then
    echo "OK ${dest#$target_root/}"
    return 0
  fi

  echo "DRIFT ${dest#$target_root/}"
  return 1
}

if test "$MODE" = "check"; then
  failures=0
  for mapping in "${mappings[@]}"; do
    src="${mapping%%|*}"
    dest="${mapping#*|}"
    check_file "$src" "$dest" || failures=$((failures + 1))
  done

  if test -f "$readme_target"; then
    echo "OK ${readme_target#$target_root/}"
  else
    echo "MISSING ${readme_target#$target_root/}"
    failures=$((failures + 1))
  fi

  if test "$failures" -gt 0; then
    echo "Bootstrap check failed: $failures issue(s)"
    exit 1
  fi

  echo "Bootstrap check passed."
  exit 0
fi

for mapping in "${mappings[@]}"; do
  src="${mapping%%|*}"
  dest="${mapping#*|}"
  mkdir -p "$(dirname "$dest")"

  if test -f "$dest" && ! cmp -s "$src" "$dest"; then
    echo "Refusing to overwrite changed file: $dest"
    echo "Remove it or reconcile it manually, then rerun bootstrap."
    exit 1
  fi

  cp "$src" "$dest"

  case "$dest" in
    *.sh) chmod +x "$dest" ;;
  esac

  echo "WROTE ${dest#$target_root/}"
done

mkdir -p "$(dirname "$readme_target")"
if test -f "$readme_target"; then
  tmp="$(mktemp)"
  write_readme > "$tmp"
  if ! cmp -s "$tmp" "$readme_target"; then
    rm -f "$tmp"
    echo "Refusing to overwrite changed file: $readme_target"
    echo "Remove it or reconcile it manually, then rerun bootstrap."
    exit 1
  fi
  rm -f "$tmp"
else
  write_readme
fi

echo "WROTE ${readme_target#$target_root/}"
echo "Bootstrap complete: $target_root"
