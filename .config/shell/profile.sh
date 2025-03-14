export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/nvim
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
# fix "xdg-open fork-bomb" export your preferred browser from here
# export BROWSER=/usr/bin/firefox

# export PATH="$HOME/bin:/opt/cuda/extras/compute-sanitize:$PATH"
export PATH="$HOME/bin:$PATH"
# export NODE_OPTIONS=--openssl-legacy-provider
# alias notes="nvim ~/beanbakers/notes.md"

# Sources node version manager script, slows the startup considerably, so
# keep commented if not needed
# source /usr/share/nvm/init-nvm.sh 
# . "$HOME/.cargo/env"

# Random aliases
# LKP vm startup
alias matlab="~/ohjelmat/matlab/bin/matlab"
alias vim="nvim"
# export TRAINING_FILE="$HOME/filen-drive/dokumentit/treenit.csv"
sää() {
    curl "v2.wttr.in/$1"
}
alias du="du -h" # human readable

#Shorthands
alias musat="vim ~/muistiinpanot/sekalaiset/musat.norg"
alias gifit="nvim ~/muistiinpanot/sekalaiset/gifit.norg       "

# Mullvad
alias vpnup="wg-quick up de-dus-wg-003"
alias vpndown="wg-quick down de-dus-wg-003"

# List files
alias l="eza --header --icons=automatic --sort=type"
alias ll="eza -l --header --icons=automatic --sort=type"
alias la="eza -la --header --icons=automatic --sort=type"
alias ls='ls --color=auto'

# Open
open () {
	xdg-open $1 & disown
}
