# Find direcotry and cd to it
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# Find file and open it with xdg-open
ff() {
    local target
    target=$(fzf +m)
    xdg-open "$target"
}
