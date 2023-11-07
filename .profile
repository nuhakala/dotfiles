export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/nvim export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
# fix "xdg-open fork-bomb" export your preferred browser from here
export BROWSER=/usr/bin/firefox

# export PATH="$HOME/bin:/opt/cuda/extras/compute-sanitize:$PATH"
export PATH="$HOME/.config/emacs/bin:$PATH"
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
#Shorthands
alias sanasto="nvim ~/filen-drive/dokumentit/saSanasto.txt"
alias musat="libreoffice ~/filen-drive/dokumentit/musat.ods"
alias ostokset="libreoffice ~/filen-drive/dokumentit/ostokset.ods"
alias gifit="nvim ~/filen-drive/muistiinpanot/gifit.md"
alias muistettavaa="nvim ~/filen-drive/muistiinpanot/muistettavaa.md"
alias sanat="nvim ~/filen-drive/muistiinpanot/sanat.md"

alias ll="ls -l"
alias la="ls -la"

# NNN configuration
export NNN_PLUG="m:nmount;p:preview-tui;f:fzopen"
export NNN_BMS="u:~/filen-drive/;l:~/filen-drive/lipasto/;t:~/filen-drive/lipasto/tietotekniikka_maisteri/;d:~/Downloads/"
export NNN_FIFO="/tmp/nnn.fifo nnn"
NNN_OPENER="/usr/bin/nvim"
# cd on quit always:
n ()
{
    [ "${NNNLVL:-0}" -eq 0 ] || {
        echo "nnn is already running"
        return
    }
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    command nnn "$@"

    [ ! -f "$NNN_TMPFILE" ] || {
        . "$NNN_TMPFILE"
        rm -f "$NNN_TMPFILE" > /dev/null
    }
}


# Git aliases
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

alias gs="git status"
alias gc="git commit"
alias gca="git commit --amend"
alias glo="git log --oneline"
alias grc="git rebase --continue"
alias gaa="git add ."
alias gb="git branch"
alias gn="git switch -"
function gcp() {
  git add -N .
  git commit -p
}
function gcpa() {
  git add -N .
  git commit -p --amend
}
# Show name of current bit branch
function current_branch() {
  BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)
  echo $BRANCH_NAME
}
# Rebase branch to arg (default master)
function grim() {
  if [ -z "$1" ]; then
    TARGET="master"
  else
    TARGET=$1
  fi
  WORK_BRANCH=$(current_branch)
  git switch $TARGET
  git pull
  git switch $WORK_BRANCH
  git rebase -i $TARGET
}
# Git rebase stepback
function gr_stepback() {
  git reset --hard HEAD
  git cherry-pick REBASE_HEAD
}
