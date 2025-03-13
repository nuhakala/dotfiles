export NNN_PLUG="m:nmount;p:preview-tui;f:fzopen"

NNN_BMS+="t:/run/media/jaba/hdd/koulut/lipasto/tietotekniikka_maisteri/;"
NNN_BMS+="l:/run/media/jaba/hdd/koulut/lipasto/;"
NNN_BMS+="d:~/Downloads/;"
NNN_BMS+="m:~/muistiinpanot/;"
NNN_BMS+="o:~/OmatProjektit/;"

# Kurssien kirjanmerkit
NNN_BMS+="k:~/kurssit/;"
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


