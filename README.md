# My config files
You will find my neovim configuration written in lua under `.config/nvim/`

This repository is a place to backup and restore my config files. It is
done with git bare repository. Instructions here:
https://www.atlassian.com/git/tutorials/dotfiles

1. Add `.cfg` to gitignore in home folder:
```
echo ".cfg" >> .gitignore
```

2. clone thise repo:
```
git clone --bare <repo address> $HOME/.cfg
```

3. create alias (either in shell scope or to .profile/.zshrc)
```
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME
```

4. fetch from git
```
git checkout
```
In this step you might to need rename/delete old files

5. set git to follow only explicitly marked files
```
config config --local status.showUntrackedFiles no
```

# Qtile used software
1. playerctl
2. rofi
3. wezterm
4. nnn
5. i3lock
6. flameshot
8. amixer
9. brightnessctl
10. discord
11. gajim
12. thunderbird
13. lutris
14. Librewolf

# Neovim requirements
1. neovim 9.0+
2. ripgrep
3. git
5. `git_branch.sh` scripts in path

# ZSH requirement
1. zap

# Yazi
- Onedark flavor https://github.com/BennyOe/onedark.yazi
- Hide preview plugin: https://github.com/yazi-rs/plugins/tree/main/hide-preview.yazi
- Hide status bar: https://github.com/yazi-rs/plugins/tree/main/no-status.yazi
- Full border: https://github.com/yazi-rs/plugins/tree/main/full-border.yazi

# others / command line tools
- picom
- wezterm
- fzf
- bat
- eza
- Tomb
