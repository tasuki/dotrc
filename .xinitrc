# source global configs if they exist
[[ -f ~/.Xresources ]] && xrdb ~/.Xresources
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
[[ -f ~/.xinitrc.local ]] && . ~/.xinitrc.local

# faster typing
type xset > /dev/null && xset r rate 200 40
