# Use this to track startuptime on each session start. Remember to also the
# counterpart at the last line.
# zmodload zsh/zprof

# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-history-substring-search"

# Source shell-independent stuff
plug "$HOME/.shell/profile.sh"
plug "$HOME/.shell/git.sh"
plug "$HOME/.shell/fzf.sh"
plug "$HOME/.shell/nnn.sh"
plug "$HOME/.shell/yazi.sh"

# Settings: based on supercharge and manjaro config

# Completions
# Load and initialise completion system
autoload -U compinit
compinit -d
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path 
zstyle ':completion:*' menu select                              # Highlight menu selection
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
# zle_highlight=('paste:none')

unsetopt BEEP
setopt AUTO_CD
setopt GLOB_DOTS
setopt NOMATCH
setopt MENU_COMPLETE
setopt EXTENDED_GLOB
setopt INTERACTIVE_COMMENTS
setopt APPEND_HISTORY
setopt AUTO_LIST

HISTFILE="${HOME}/.shell/zhistory.txt"
HISTSIZE=50000
SAVEHIST=50000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
# setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.

# Colors
autoload -U colors && colors

# bindings
bindkey -e
bindkey '^[[7~' beginning-of-line                               # Home key
bindkey '^[[H' beginning-of-line                                # Home key
if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line                # [Home] - Go to beginning of line
fi

bindkey '^[[8~' end-of-line                                     # End key
bindkey '^[[F' end-of-line                                      # End key
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}" end-of-line                       # [End] - Go to end of line
fi

bindkey '^[[2~' overwrite-mode                                  # Insert key
bindkey '^[[3~' delete-char                                     # Delete key
bindkey '^[[C'  forward-char                                    # Right key
bindkey '^[[D'  backward-char                                   # Left key
# Requires substring search plugin
bindkey '^[[A' history-substring-search-up										  # Page up key
bindkey '^[[B' history-substring-search-down										# Page down key

# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word                                     #
bindkey '^[Od' backward-word                                    #
bindkey '^[[1;5D' backward-word                                 #
bindkey '^[[1;5C' forward-word                                  #
bindkey '^H' backward-kill-word                                 # delete previous word with ctrl+backspace
bindkey '^[[Z' undo                                             # Shift+tab undo last action

# Navigate folder stack
# if [[ -z "$ZSH_CDR_DIR" ]]; then
#     ZSH_CDR_DIR=${XDG_CACHE_HOME:-$HOME/.cache}/zsh-cdr
# fi
# mkdir -p $ZSH_CDR_DIR
# autoload -Uz chpwd_recent_dirs cdr
# autoload -U add-zsh-hook
# add-zsh-hook chpwd chpwd_recent_dirs
# zstyle ':chpwd:*' recent-dirs-file $ZSH_CDR_DIR/recent-dirs
# zstyle ':chpwd:*' recent-dirs-max 1000
# # fall through to cd
# zstyle ':chpwd:*' recent-dirs-default yes
# setopt AUTOPUSHD
# setopt PUSHD_SILENT
# setopt PUSHD_TO_HOME
# setopt PUSHD_IGNORE_DUPS
# setopt PUSHD_MINUS
# DIRSTACKSIZE=10
# Define custom widgets
# local index=1
# cd_back() {
	# local dir=$PWD
	# cdr; cdr -P $dir; cdr -P $PWD
	# zle accept-line
	# zle redisplay
# 	BUFFER="cd -1 > /dev/null"
# 	((index++))
# 	echo $index
# 	zle accept-line
# 	zle reset-prompt
# }
# zle -N cd_back
# cd_forward() {
	# BUFFER="cd +1 > /dev/null"
 #  zle accept-line
	# zle redisplay
# 	BUFFER="cd -q ~/Downloads"
# 	zle accept-line
# 	zle reset-prompt
# }
# zle -N cd_forward
# Bind widgets to up and down arrows
# bindkey '^[[1;5A' cd_back
# bindkey '^[[1;5B' cd_forward

# Colors
alias ls='ls --color=auto'

# Prompt
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable ALL

precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

# Add info to git messages, namely, calculate git changes in the directory.
# Manual: https://zsh.sourceforge.io/Doc/Release/User-Contributions.html#vcs_005finfo-Configuration
# zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
# +vi-git-untracked(){
    # I do this by calculating the changed/staged/untracked files, and then adding
    # those files to the branch variable. It makes formatting so much easier.
    # I guess it would fail if we are in a situation that there is no branch, but
    # I guess that is basically impossible. If you want to use the actual
    # staged/unstaged git variables, they are %u and %c

	# calculate untracked items and add it to git info
	# untracked=$(git ls-files --others --exclude-standard | wc -l)
	# staged=$(git diff --name-only --cached | wc -l)

	# if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
	# 	[ $untracked -ge 1 ] ; then
	# 	hook_com[branch]+=" %F{44}N${untracked}"
	# fi

	# # calculate staged files and add it
	# staged=$(git diff --name-only --cached | wc -l)
	# if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
	# 	[ $staged -ge 1 ] ; then
	# 	hook_com[branch]+=" %F{44}S${staged}"
	# fi

	# # calculate modified files and add
	# modified=$(git ls-files --modified --exclude-standard | wc -l)
	# if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
	# 	[ $modified -ge 1 ] ; then
	# 	hook_com[branch]+=" %F{44}M${modified}" # signify new files with a bang
	# fi
# }

# Apply git formatting
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats " %F{219} %b"
zstyle ':vcs_info:git:*' actionformats " %F{219} %b %F{44}➜ %F{197}%a"

# actual prompt formatting
# More info from here: https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html
# directorys: %c = current directory, %~ = pwd, %/ = from root
# %u = user, %m = machine
# Colors: https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg
PROMPT=" %F{172}%2c\$vcs_info_msg_0_ %F{93}❯%{$reset_color%} "
# add empty line before new line, wrap two times to prevent new line on startup
precmd() { precmd() { print "" } }

# Startup time track stop.
# zprof
