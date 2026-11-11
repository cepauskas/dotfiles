#!/usr/bin/env bash
# Link dotfiles into place. Existing real files are moved aside to <name>.bak-<timestamp>.
set -euo pipefail

DOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CFG="${XDG_CONFIG_HOME:-$HOME/.config}"
STAMP="$(date +%Y%m%d%H%M%S)"

link() {
	local src="$1" dst="$2"
	mkdir -p "$(dirname "$dst")"
	if [ -L "$dst" ]; then
		rm "$dst"
	elif [ -e "$dst" ]; then
		mv "$dst" "$dst.bak-$STAMP"
		echo "backed up $dst -> $dst.bak-$STAMP"
	fi
	ln -s "$src" "$dst"
	echo "linked $dst -> $src"
}

# tmux
link "$DOT/tmux/tmux.conf" "$CFG/tmux/tmux.conf"
link "$DOT/tmux/tmux-powerline" "$CFG/tmux-powerline"

if [ ! -d "$CFG/tmux/plugins/tpm" ]; then
	git clone --depth 1 https://github.com/tmux-plugins/tpm "$CFG/tmux/plugins/tpm"
fi
# TPM's installer needs the config loaded in a running server.
if tmux has-session 2>/dev/null; then
	tmux source-file "$CFG/tmux/tmux.conf"
	"$CFG/tmux/plugins/tpm/bin/install_plugins"
else
	echo "start tmux and press prefix + I to install plugins"
fi

if [ ! -d "$HOME/.local/share/agenmux" ]; then
	echo "note: agenmux not installed; see https://github.com/snirt/agenmux (expected at ~/.local/share/agenmux)"
fi
