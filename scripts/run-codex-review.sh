#!/usr/bin/env bash
set -euo pipefail

usage() {
  echo "Usage: $0 [additional-review-context.md] [output-file]" >&2
}

if [[ $# -gt 2 ]]; then
  usage
  exit 64
fi

CONTEXT_FILE="${1:-}"
OUTPUT_FILE="${2:-codex-review-result.md}"

if [[ -n "$CONTEXT_FILE" && ! -f "$CONTEXT_FILE" ]]; then
  echo "Context file not found: $CONTEXT_FILE" >&2
  exit 66
fi

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "This script must run inside a git repository." >&2
  exit 69
fi

WORKTREE_ROOT="$(git rev-parse --show-toplevel)"
cd "$WORKTREE_ROOT"

{
  cat codex/prompts/review-repo.md
  printf '\n\n## Engineering Standards\n'
  cat codex/AGENTS.md
  if [[ -n "$CONTEXT_FILE" ]]; then
    printf '\n\n## Additional Review Context\n'
    cat "$CONTEXT_FILE"
  fi
} | codex exec --cd "$WORKTREE_ROOT" --sandbox read-only --output-last-message "$OUTPUT_FILE" -
