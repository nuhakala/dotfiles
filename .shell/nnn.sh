export NNN_PLUG="m:nmount;p:preview-tui;f:fzopen"
export NNN_BMS="u:~/filen-drive/;t:~/filen-drive/lipasto/tietotekniikka_maisteri/;d:~/Downloads/;m:~/muistiinpanot/;s:~/filen-drive/lipasto/taloustiede/strategic_decisions/;c:~/filen-drive/lipasto/tietotekniikka_maisteri/concurrency_theory/;o:~/OmatProjektit/;p:~/filen-drive/lipasto/tietotekniikka_maisteri/linux_kernel_programming/linux-6.5.7-lkp/AA_Development/project/"
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


