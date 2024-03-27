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
