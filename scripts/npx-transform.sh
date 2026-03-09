#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(dirname "$SCRIPT_DIR")"
SKILLS_DIR="$REPO_DIR/skills/playwright-cli"

find "$SKILLS_DIR" -name '*.md' | while read -r file; do
  perl -pi -e '
    unless (/^name:\s/) {
      s/npx playwright-cli/playwright-cli/g;
      s/playwright-cli/npx playwright-cli/g;
    }
  ' "$file"
done
