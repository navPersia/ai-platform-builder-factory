#!/usr/bin/env bash
set -euo pipefail

usage() {
  echo "Usage: $0 <feature-brief.md> [output-file]" >&2
}

if [[ $# -lt 1 || $# -gt 2 ]]; then
  usage
  exit 64
fi

BRIEF_FILE="$1"
OUTPUT_FILE="${2:-codex-feature-result.md}"

if [[ ! -f "$BRIEF_FILE" ]]; then
  echo "Brief file not found: $BRIEF_FILE" >&2
  exit 66
fi

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "This script must run inside a git repository." >&2
  exit 69
fi

CURRENT_BRANCH="$(git branch --show-current)"
if [[ "$CURRENT_BRANCH" == "main" && "${ALLOW_CODEX_ON_MAIN:-}" != "1" ]]; then
  echo "Refusing to run Codex on main. Create a feature branch or set ALLOW_CODEX_ON_MAIN=1 for a deliberate local-only run." >&2
  exit 70
fi

WORKTREE_ROOT="$(git rev-parse --show-toplevel)"
cd "$WORKTREE_ROOT"

{
  cat codex/prompts/implement-feature.md
  printf '\n\n## Engineering Standards\n'
  cat codex/AGENTS.md
  printf '\n\n## OpenClaw Brief\n'
  cat "$BRIEF_FILE"
} | codex exec --cd "$WORKTREE_ROOT" --sandbox workspace-write --output-last-message "$OUTPUT_FILE" -
