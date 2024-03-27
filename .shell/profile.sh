export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/nvim export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
# fix "xdg-open fork-bomb" export your preferred browser from here
export BROWSER=/usr/bin/firefox

# export PATH="$HOME/bin:/opt/cuda/extras/compute-sanitize:$PATH"
export PATH="$HOME/.config/emacs/bin:$HOME/bin:$PATH"
# export NODE_OPTIONS=--openssl-legacy-provider
# alias notes="nvim ~/beanbakers/notes.md"
source /usr/share/nvm/init-nvm.sh 
. "$HOME/.cargo/env"

# Random aliases
# LKP vm startup
alias vm="~/filen-drive/lipasto/tietotekniikka_maisteri/linux_kernel_programming/virtual_machine/qemu-run-externKernel.sh"
alias matlab="~/ohjelmat/matlab/bin/matlab"
alias vim="nvim"
alias rwth="ssh -X tu167332@login18-1.hpc.itc.rwth-aachen.de"
export TRAINING_FILE="$HOME/filen-drive/dokumentit/treenit.csv"
alias treenit="~/OmatProjektit/training-diary/treenit.sh"

#Shorthands
alias sanasto="nvim ~/filen-drive/dokumentit/saSanasto.txt"
alias salasanat="libreoffice ~/filen-drive/dokumentit/salasanat.odt"
alias musat="libreoffice ~/filen-drive/dokumentit/musat.ods"
alias ostokset="libreoffice ~/filen-drive/dokumentit/ostokset.ods"
alias gifit="nvim ~/muistiinpanot/sekalaiset/gifit.norg       "
alias muistettavaa="nvim ~/muistiinpanot/sekalaiset/muistettavaa.norg"
alias sanat="nvim ~/muistiinpanot/sekalaiset/sanat.norg       "
alias ms="cd ~/muistiinpanot/                              "

# Mullvad
alias vpnup="wg-quick up de-dus-wg-003"
alias vpndown="wg-quick down de-dus-wg-003"

# List files
alias l="eza --header --icons=automatic --sort=type"
alias ll="eza -l --header --icons=automatic --sort=type"
alias la="eza -la --header --icons=automatic --sort=type"
