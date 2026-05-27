#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

required_skills=(
  spec-discovery
  plan-execution-checkpoints
  skill-authoring-pressure-test
  cross-agent-export
  small-task-fast-path
  subagent-execution-controller
  test-first-development
  code-review-discipline
  branch-workspace-lifecycle
)

for skill in "${required_skills[@]}"; do
  file="$ROOT/skills/$skill/SKILL.md"
  test -f "$file" || { echo "Missing smoke-test skill: $skill"; exit 1; }
  grep -q "^name: $skill$" "$file" || { echo "Skill name mismatch: $skill"; exit 1; }
  grep -q '^description: Use when ' "$file" || { echo "Skill trigger missing: $skill"; exit 1; }
  grep -q "$skill" "$ROOT/skills/using-methodology/SKILL.md" || {
    echo "Skill is not routed from using-methodology: $skill"
    exit 1
  }
done

grep -q 'benchmark-runner.sh --check' "$ROOT/README.md" || {
  echo "README missing benchmark runner check command"
  exit 1
}

grep -q 'cross-agent-export.sh' "$ROOT/skills/cross-agent-export/SKILL.md" || {
  echo "Cross-agent export skill missing script reference"
  exit 1
}

grep -q 'release-readiness.sh' "$ROOT/README.md" || {
  echo "README missing release readiness command"
  exit 1
}

grep -q 'same language as the user' "$ROOT/skills/using-methodology/SKILL.md" || {
  echo "using-methodology missing language matching rule"
  exit 1
}

grep -q 'prompt rewriting' "$ROOT/skills/prompt-briefing/SKILL.md" || {
  echo "prompt-briefing missing prompt rewriting auto-activation rule"
  exit 1
}

grep -q 'Apply CoderSteroids automatically' "$ROOT/.codex-plugin/plugin.json" || {
  echo "manifest missing auto-activation default prompt"
  exit 1
}

grep -q 'Before any coding response, apply CoderSteroids routing' "$ROOT/.codex-plugin/plugin.json" || {
  echo "manifest missing strong before-coding auto-start prompt"
  exit 1
}

grep -q 'Before any coding response, apply CoderSteroids routing' "$ROOT/skills/using-methodology/SKILL.md" || {
  echo "using-methodology missing strong before-coding auto-start rule"
  exit 1
}

grep -q 'CoderSteroids is the primary workflow' "$ROOT/.codex-plugin/plugin.json" || {
  echo "manifest missing CoderSteroids primary-workflow conflict rule"
  exit 1
}

grep -q 'prompt rewriting remains a CoderSteroids-primary workflow' "$ROOT/skills/prompt-briefing/SKILL.md" || {
  echo "prompt-briefing missing methodology conflict rule"
  exit 1
}

test -f "$ROOT/docs/manual-tests/new-chat-autostart.md" || {
  echo "missing new-chat auto-start manual test"
  exit 1
}

echo "Skill smoke test passed."
