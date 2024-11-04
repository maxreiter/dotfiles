# VARIABLES
set -g EDITOR nvim

fish_add_path -aP $(go env GOPATH)/bin

# SET $XDG_* VARIABLES
source_user_dirs

# ALIASES
alias vim nvim
alias task go-task

thefuck --alias | source
