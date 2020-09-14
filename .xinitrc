# source global configs if they exist
[[ -f ~/.Xresources ]] && xrdb ~/.Xresources
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
[[ -f ~/.Xmodmap.local ]] && xmodmap ~/.Xmodmap.local

# faster typing
type xset > /dev/null && xset r rate 200 40

# disable dpms / energy star
type xset > /dev/null && xset -dpms
