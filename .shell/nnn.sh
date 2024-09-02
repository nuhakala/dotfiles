export NNN_PLUG="m:nmount;p:preview-tui;f:fzopen"
NNN_BMS="u:~/filen-drive/;"
NNN_BMS+="t:~/filen-drive/lipasto/tietotekniikka_maisteri/;"
NNN_BMS+="l:~/filen-drive/lipasto/;"
NNN_BMS+="d:~/Downloads/;"
NNN_BMS+="m:~/muistiinpanot/;"
NNN_BMS+="o:~/OmatProjektit/;"
NNN_BMS+="r:~/OmatProjektit/treenit-v2/;"
# Kurssien kirjanmerkit
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


