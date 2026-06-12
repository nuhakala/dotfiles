# export NNN_PLUG="m:nmount;p:preview-tui;f:fzopen"

# Kirjanmerkit
NNN_BMS+="d:~/Downloads/;"
NNN_BMS+="m:~/muistiinpanot/;"
NNN_BMS+="o:~/OmatProjektit/;"
export NNN_BMS

export NNN_FIFO="/tmp/nnn.fifo nnn" # Required for preview-tui
export NNN_OPENER="/usr/bin/nvim"

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


