export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/nvim
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
# fix "xdg-open fork-bomb" export your preferred browser from here
export BROWSER=/usr/bin/firefox

export PATH="$HOME/bin:/opt/cuda/extras/compute-sanitize:$PATH"
# export NODE_OPTIONS=--openssl-legacy-provider

source /usr/share/nvm/init-nvm.sh 
alias notes="nvim ~/beanbakers/notes.md"
alias matlab="~/ohjelmat/matlab/bin/matlab"
alias vim="nvim"

# NNN configuration
export NNN_PLUG="m:nmount;p:preview-tui;f:fzopen"
export NNN_BMS="u:/media/sdc/"
export NNN_FIFO="/tmp/nnn.fifo nnn"
# export KITTY_LISTEN_ON="unix:${TMPDIR}/kitty"
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
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

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
