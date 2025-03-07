# VARIABLES
set -g EDITOR nvim

# ADD GOBIN TO PATH
fish_add_path -aP $(go env GOPATH)/bin

# SET $XDG_* VARIABLES
source_user_dirs

# ALIASES
alias vim nvim
alias task go-task

# ABBREVATIONS
abbr -a -- cz 'chezmoi'

# Start sway if we're in a login shell
if status is-login
	if test -z "$WAYLAND_DISPLAY" -a \( -n "$XDG_VTNR" \) -a \( "$XDG_VTNR" -eq 1 \)
		exec sway > .local/state/sway.log 2>&1
	end
end
