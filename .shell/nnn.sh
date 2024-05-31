export NNN_PLUG="m:nmount;p:preview-tui;f:fzopen"
NNN_BMS="u:~/filen-drive/;"
NNN_BMS+="t:~/filen-drive/lipasto/tietotekniikka_maisteri/;"
NNN_BMS+="d:~/Downloads/;"
NNN_BMS+="m:~/muistiinpanot/;"
NNN_BMS+="o:~/OmatProjektit/;"
# Kurssien kirjanmerkit
NNN_BMS+="s:~/filen-drive/lipasto/taloustiede/agt/;"
NNN_BMS+="e:~/filen-drive/lipasto/tietotekniikka_maisteri/intro_embedded/;"
NNN_BMS+="p:~/filen-drive/lipasto/tietotekniikka_maisteri/PCA/;"
NNN_BMS+="a:~/filen-drive/lipasto/tietotekniikka_maisteri/ait/;"
export NNN_BMS
export NNN_FIFO="/tmp/nnn.fifo nnn" # Required for preview-tui
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


