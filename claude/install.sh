#!/usr/bin/env bash
# Symlink Claude Code config from this dotfiles repo into ~/.claude/.
# Safe to re-run: existing symlinks pointing here are left as-is; real files
# or directories in the way are backed up to ~/.claude/<name>.bak-<timestamp>.

set -euo pipefail

if [ -n "${ZSH_VERSION:-}" ]; then
  SCRIPT_DIR="${0:A:h}"
else
  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
fi

CLAUDE_DIR="${HOME}/.claude"
mkdir -p "${CLAUDE_DIR}"

link() {
  local src="$1" dst="$2"
  if [ -L "${dst}" ] && [ "$(readlink "${dst}")" = "${src}" ]; then
    echo "ok    ${dst} -> ${src}"
    return
  fi
  if [ -e "${dst}" ] || [ -L "${dst}" ]; then
    local backup="${dst}.bak-$(date +%Y%m%d-%H%M%S)"
    echo "backup ${dst} -> ${backup}"
    mv "${dst}" "${backup}"
  fi
  ln -s "${src}" "${dst}"
  echo "link  ${dst} -> ${src}"
}

link "${SCRIPT_DIR}/skills" "${CLAUDE_DIR}/skills"
link "${SCRIPT_DIR}/settings.json" "${CLAUDE_DIR}/settings.json"
