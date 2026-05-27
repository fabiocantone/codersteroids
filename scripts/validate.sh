#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PLUGIN_VALIDATOR="${PLUGIN_VALIDATOR:-$HOME/.codex/skills/.system/plugin-creator/scripts/validate_plugin.py}"

if test -f "$PLUGIN_VALIDATOR"; then
  if python3 -c 'import yaml' >/dev/null 2>&1; then
    python3 "$PLUGIN_VALIDATOR" "$ROOT"
  elif command -v uv >/dev/null 2>&1; then
    uv run --with PyYAML python "$PLUGIN_VALIDATOR" "$ROOT"
  else
    echo "PyYAML is required to run the Codex plugin validator. Install PyYAML or uv, then retry."
    exit 1
  fi
else
  echo "WARN Codex plugin validator not found at $PLUGIN_VALIDATOR; skipping Codex validator"
fi

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
  "$ROOT/docs/manual-tests/new-chat-autostart.md"
  "$ROOT/docs/context7-setup.md"
  "$ROOT/docs/examples/field-depth-report-template.md"
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
  "$ROOT/benchmarks/prompts/small-task-fast-path.md"
  "$ROOT/benchmarks/prompts/subagent-execution-controller.md"
  "$ROOT/benchmarks/results/template.md"
)

for file in "${required_files[@]}"; do
  test -f "$file" || { echo "Missing required file: $file"; exit 1; }
done

if command -v claude >/dev/null 2>&1; then
  claude plugin validate "$ROOT" >/dev/null
else
  echo "WARN claude CLI not found; skipping Claude plugin validation"
fi

required_skills=(
  using-methodology
  context7-research
  web-and-github-research
  recommendation-verification
  small-task-fast-path
  spec-discovery
  prompt-briefing
  self-improvement-loop
  skill-authoring-pressure-test
  test-first-development
  code-review-discipline
  branch-workspace-lifecycle
  subagent-execution-controller
  plan-execution-checkpoints
  cross-agent-export
  skill-lifecycle-doctor
  memory-hygiene-audit
  benchmark-runner
  field-engineering-depth
  observability-logging
  project-bootstrap
  roadmap-first-planning
  llm-wiki-memory
  chat-continuity
  coding-standards
  folder-docs
  systematic-debugging
  verification-before-completion
  post-task-memory-flush
  global-memory
  subagent-context-packing
  subagent-result-verification
  benchmark-against-superpowers
)

for skill in "${required_skills[@]}"; do
  file="$ROOT/skills/$skill/SKILL.md"
  test -f "$file" || { echo "Missing skill: $skill"; exit 1; }
  grep -q '^---$' "$file" || { echo "Missing frontmatter fence: $file"; exit 1; }
  grep -q "^name: $skill$" "$file" || { echo "Wrong skill name in $file"; exit 1; }
  grep -q '^description: Use when ' "$file" || { echo "Description must start with 'Use when': $file"; exit 1; }
done

test -x "$ROOT/scripts/check-benchmark-artifacts.sh" || {
  echo "Benchmark checker is not executable: $ROOT/scripts/check-benchmark-artifacts.sh"
  exit 1
}

test -x "$ROOT/scripts/doctor.sh" || {
  echo "Doctor script is not executable: $ROOT/scripts/doctor.sh"
  exit 1
}

test -x "$ROOT/scripts/memory-audit.sh" || {
  echo "Memory audit script is not executable: $ROOT/scripts/memory-audit.sh"
  exit 1
}

test -x "$ROOT/scripts/benchmark-runner.sh" || {
  echo "Benchmark runner script is not executable: $ROOT/scripts/benchmark-runner.sh"
  exit 1
}

test -x "$ROOT/scripts/check-field-depth-report.sh" || {
  echo "Field depth checker is not executable: $ROOT/scripts/check-field-depth-report.sh"
  exit 1
}

test -x "$ROOT/scripts/project-bootstrap.sh" || {
  echo "Project bootstrap script is not executable: $ROOT/scripts/project-bootstrap.sh"
  exit 1
}

test -x "$ROOT/scripts/cross-agent-export.sh" || {
  echo "Cross-agent export script is not executable: $ROOT/scripts/cross-agent-export.sh"
  exit 1
}

test -x "$ROOT/scripts/host-enforcement-check.sh" || {
  echo "Host enforcement check script is not executable: $ROOT/scripts/host-enforcement-check.sh"
  exit 1
}

test -x "$ROOT/scripts/release-readiness.sh" || {
  echo "Release readiness script is not executable: $ROOT/scripts/release-readiness.sh"
  exit 1
}

test -x "$ROOT/scripts/skill-smoke-test.sh" || {
  echo "Skill smoke test script is not executable: $ROOT/scripts/skill-smoke-test.sh"
  exit 1
}

echo "Validation passed."
