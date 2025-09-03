export EDITOR="/usr/bin/env nvim"

export PATH="$HOME/bin:/usr/local/go/bin:$PATH"

# Random aliases
alias vim="nvim"
# export TRAINING_FILE="$HOME/filen-drive/dokumentit/treenit.csv"
sää() {
    curl "v2.wttr.in/$1"
}
alias du="du -h" # human readable

#Shorthands
alias musat="vim ~/muistiinpanot/sekalaiset/musat.norg"
alias gifit="nvim ~/muistiinpanot/sekalaiset/gifit.norg"

# Mullvad
alias vpnup="wg-quick up de-dus-wg-003"
alias vpndown="wg-quick down de-dus-wg-003"

# List files
alias l="eza --header --icons=automatic --sort=type"
alias ll="eza -l --header --icons=automatic --sort=type"
alias la="eza -la --header --icons=automatic --sort=type"
alias ls="ls --color=auto"
alias ip="ip --color=auto"
alias k=kubectl

# Open
open () {
	xdg-open $1 & disown
}
