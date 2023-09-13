# My config files

You will find my neovim configuration written in lua under `.config/nvim/`

This repository is a place to backup and restore my config files. It is
done with git bare repository. Instructions here:
https://www.atlassian.com/git/tutorials/dotfiles

1. Add `.cfg` to gitignore in home folder:
    ```echo ".cfg" >> .gitignore```
2. clone thise repo:
   ```git clone --bare <repo address> $HOME/.cfg```
3. create alias (either in shell scope or to .profile/.zshrc)
    ```alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME```
4. fetch from git
    ```git checkout```
In this step you might to need rename/delete old files
5. set git to follow only explicitly marked files
    ```config config --local status.showUntrackedFiles no```