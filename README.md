# dotfiles

```bash
git clone <this repo> ~/Pro/dotfiles
~/Pro/dotfiles/install.sh
```

`install.sh` symlinks configs into `~/.config` (moving existing files aside as `.bak-<timestamp>`), installs TPM and the plugins declared in `tmux/tmux.conf`.

## tmux

- `tmux/tmux.conf` → `~/.config/tmux/tmux.conf`
- `tmux/tmux-powerline/` → `~/.config/tmux-powerline/` (config + `light` theme)
- Plugins are declared with `set -g @plugin` and fetched by TPM into `~/.config/tmux/plugins/` (not committed). Update with `prefix + U`.
- agenmux is a compiled tool installed separately at `~/.local/share/agenmux` (https://github.com/snirt/agenmux).
