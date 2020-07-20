#!/usr/bin/fish

source $HOME/.config/lemonbar/colors.fish

# Show bspwm desktops
function bspwm
    set BSPWM (bspc query -D)
    set BUSY (bspc query -D -d .occupied)
    set CURRENT (bspc query -D -d)

    for DESK in $BSPWM;
        set NAME (bspc query -D -d $DESK --names)

        # set action to switch desktops
        echo -n "%{A:bspc desktop $DESK -f:}"

        if string match -q -r $DESK $CURRENT;
            echo -n "%{F$BACKGROUND}%{B$FOREGROUND}";    
        else if string match -q -r $DESK $BUSY;
            echo -n "%{F$BACKGROUND}%{B$BRIGHT_BLACK}";
        else;
            echo -n "%{F$FOREGROUND}%{B$BACKGROUND}";
        end

        echo -n " $NAME "
        echo -n "%{F-}%{B-}"
        echo -n "%{A}"
    end
end

# Show date and time
function clock
    printf '\uF017 ';
    echo -n (date '+%Y-%m-%d %H:%M');
end

while true;
    sleep 0.1s;
    echo "%{l}" (bspwm) "%{r}" (clock) " "
end
