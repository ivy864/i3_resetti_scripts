#!/bin/bash
help="Usage: resetti_script [mode]\nModes:\n\tplay\n\treset\n\tsetup"

if [[ $# != 1 ]]; then
    echo -e "$help"
fi

case "$1" in
    "play") 
        i3-msg [title="(?i).*projector.*"] move position 1919px 1079px
        i3-msg floating disable
    ;;
    "reset")
        i3-msg [title="(?i).*projector.*"] move position 0px 0px
        i3-msg [class="(?i).*minecraft.*"] floating enable, move position 1919px 1079px
    ;;
    "setup")
        i3-msg [class="(?i).*minecraft.*"] floating enable, move position 1919px 1079px, move container to workspace number 5;
        i3-msg [title="(?i).*projector.*"]  floating enable, border none, resize set 1920px 1061px, move position 0px 0px,;
    ;;
    *) echo -e "$help";;
esac
