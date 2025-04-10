# ZSH configuration by nuhakala
#
# Inspired by Manjaro ZSH configuration and supercharge plugin.

# Use this to track startuptime on each session start. Remember to also the
# counterpart at the last line.
# zmodload zsh/zprof

# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-history-substring-search"

# Source shell-independent stuff
plug "$HOME/.config/shell/profile.sh"
plug "$HOME/.config/shell/git.sh"
plug "$HOME/.config/shell/fzf.sh"
plug "$HOME/.config/shell/nnn.sh"
plug "$HOME/.config/shell/yazi.sh"

# Completions
# Load and initialise completion system
autoload -U compinit
compinit -d
# Colors
autoload -U colors && colors

zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' # Case insensitive tab completion
# zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}           # Colored completion (different colors for dirs/files/etc)
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==34=34}:${(s.:.)LS_COLORS}")';
zstyle ':completion:*' list-dirs-first true
zstyle ':completion:*' rehash true                              # automatically find new executables in path 
zstyle ':completion:*' menu select                              # Highlight menu selection
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "~/.config/shell/zsh-cache"

unsetopt beep
setopt nomatch # If a pattern for filename generation has no matches, print an error
setopt auto_list # Automatically list choices on an ambiguous completion. 
setopt auto_menu menu_complete # autocmp first menu match
setopt autocd # type a dir to cd
setopt auto_param_slash # when a dir is completed, add a / instead of a trailing space
setopt no_case_glob no_case_match # make cmp case insensitive
setopt globdots # include dotfiles
setopt extended_glob # match ~ # ^
setopt interactive_comments # allow comments in shell

HISTFILE="${HOME}/.config/shell/zhistory.txt"
HISTSIZE=50000
SAVEHIST=50000
setopt append_history inc_append_history share_history # better history
# on exit, history appends rather than overwrites; history is appended as soon as cmds executed; history shared across sessions
setopt bang_hist                 # Treat the '!' character specially during expansion.
setopt hist_expire_dups_first    # Expire duplicate entries first when trimming history.
setopt hist_ignore_dups          # Don't record an entry that was just recorded again.
setopt hist_ignore_all_dups      # Delete old recorded entry if new entry is a duplicate.
setopt hist_find_no_dups         # Do not display a line previously found.
setopt hist_ignore_space         # Don't record an entry starting with a space.
setopt hist_save_no_dups         # Don't write duplicate entries in the history file.
setopt hist_reduce_blanks        # Remove superfluous blanks before recording entry.

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
bindkey '^[[A' history-substring-search-up                      # Page up key
bindkey '^[[B' history-substring-search-down                    # Page down key

# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word                                     #
bindkey '^[Od' backward-word                                    #
bindkey '^[[1;5D' backward-word                                 #
bindkey '^[[1;5C' forward-word                                  #
bindkey '^H' backward-kill-word                                 # delete previous word with ctrl+backspace
bindkey '^[[Z' undo                                             # Shift+tab undo last action

# Prompt
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable ALL
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

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

# Add some system stats in the beginning
# echo -e "\033[0m\033[48;2;59;66;82;38;2;216;222;233m $(uptime -p | cut -c 4-) \033[0m\033[48;2;76;86;106;38;2;216;222;233m $(uname -r) \033[0m\n"

# add empty line before new line, wrap two times to prevent new line on startup
precmd() { precmd() { echo } }

# Startup time track stop.
# zprof
