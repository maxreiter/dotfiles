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
