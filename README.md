# dotfiles

```bash
git clone git@github.com:cepauskas/dotfiles.git <any-dir>
<any-dir>/install.sh
```

The checkout can live anywhere. `install.sh` symlinks configs from wherever it sits into `~/.config` (moving existing files aside as `.bak-<timestamp>`), then installs TPM and the plugins declared in `tmux/tmux.conf`.

The symlinks point into the checkout, so if you move it, re-run `install.sh` from the new location.

## tmux

- `tmux/tmux.conf` → `~/.config/tmux/tmux.conf`
- `tmux/tmux-powerline/` → `~/.config/tmux-powerline/` (config + `light` theme)
- Plugins are declared with `set -g @plugin` and fetched by TPM into `~/.config/tmux/plugins/` (not committed). Update with `prefix + U`.
- agenmux is a compiled tool installed separately at `~/.local/share/agenmux` (https://github.com/snirt/agenmux).
