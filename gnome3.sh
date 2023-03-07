#!/bin/bash

set -euo pipefail


### Customizable preferences

GNOME_FONT_SIZE=${GNOME_FONT_SIZE:-'12'}
GNOME_SYSTEM_MONITOR_SERVICES=${GNOME_SYSTEM_MONITOR_SERVICES:-'cpu memory swap net disk'}
GNOME_SYSTEM_MONITOR_GRAPH_WIDTH=${GNOME_SYSTEM_MONITOR_GRAPH_WIDTH:-'50'}

# Preferences
CLOCKS="[
	<(uint32 2, <('San Francisco', 'KOAK', true, [(0.65832848982162007, -2.133408063190589)], [(0.659296885757089, -2.1366218601153339)])>)>,
	<(uint32 2, <('New York', 'KNYC', true, [(0.71180344078725644, -1.2909618758762367)], [(0.71059804659265924, -1.2916478949920254)])>)>,
	<(uint32 2, <('London', 'EGWU', true, [(0.89971722940307675, -0.007272211034407213)], [(0.89884456477707964, -0.0020362232784242244)])>)>,
	<(uint32 2, <('Prague', 'LKKB', true, [(0.87478393392930087, 0.25383384995537522)], [(0.87411906122272931, 0.25249097093961048)])>)>,
	<(uint32 2, <('Tokyo', 'RJTI', true, [(0.62191898430954862, 2.4408429589140699)], [(0.62282074357417661, 2.4391218722853854)])>)>
]"
# wrap each item in object with 'location' key
WORLD_CLOCKS=$(echo "$CLOCKS" | sed "s/\(<(.*)>)>\)/{'location': \1}/g")


### Gnome

gsettings set org.gnome.clocks world-clocks "$WORLD_CLOCKS"

gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'pl'), ('xkb', 'cz+qwerty')]"
gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:swapcaps', 'grp:shifts_toggle']"
gsettings set org.gnome.desktop.interface clock-format "12h"
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface cursor-blink false
gsettings set org.gnome.desktop.interface document-font-name "Ubuntu $GNOME_FONT_SIZE"
gsettings set org.gnome.desktop.interface font-name "Ubuntu $GNOME_FONT_SIZE"
gsettings set org.gnome.desktop.interface monospace-font-name "Ubuntu Mono $((GNOME_FONT_SIZE + 2))"
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.peripherals.keyboard delay 200
gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 25
gsettings set org.gnome.desktop.peripherals.mouse natural-scroll false
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll false
gsettings set org.gnome.desktop.peripherals.touchpad speed 0.8
gsettings set org.gnome.desktop.peripherals.touchpad two-finger-scrolling-enabled true
gsettings set org.gnome.desktop.privacy remember-recent-files false
gsettings set org.gnome.desktop.wm.preferences focus-mode "sloppy"
gsettings set org.gnome.desktop.wm.preferences num-workspaces 6
gsettings set org.gnome.desktop.wm.preferences titlebar-font "Ubuntu $GNOME_FONT_SIZE"

gsettings set org.gnome.nautilus.preferences click-policy "single"

gsettings set org.gnome.settings-daemon.plugins.power idle-brightness 100

gsettings set org.gnome.shell disabled-extensions "['desktop-icons@csoriano']"
gsettings set org.gnome.shell.world-clocks locations "$CLOCKS"


### Extensions

# System extensions
gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity 0.5
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position "BOTTOM"
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false


# Custom extensions

function schema { echo "--schemadir $HOME/.local/share/gnome-shell/extensions/$@/schemas/"; }

# Superseded by unite@hardpixel.eu
# SCHEMA=$(schema "no-title-bar@jonaspoehler.de")
# gsettings $SCHEMA set org.gnome.shell.extensions.no-title-bar button-position "hidden"

SCHEMA=$(schema "unite@hardpixel.eu")
gsettings $SCHEMA set org.gnome.shell.extensions.unite extend-left-box false
gsettings $SCHEMA set org.gnome.shell.extensions.unite hide-aggregate-menu-arrow true
gsettings $SCHEMA set org.gnome.shell.extensions.unite notifications-position "center"
gsettings $SCHEMA set org.gnome.shell.extensions.unite show-window-buttons "never"

SCHEMA=$(schema "system-monitor-next@paradoxxx.zero.gmail.com")
gsettings $SCHEMA set org.gnome.shell.extensions.system-monitor icon-display false
for SETTING in `echo "$GNOME_SYSTEM_MONITOR_SERVICES"`; do
	gsettings $SCHEMA set org.gnome.shell.extensions.system-monitor "$SETTING"-display true
	gsettings $SCHEMA set org.gnome.shell.extensions.system-monitor "$SETTING"-graph-width "$GNOME_SYSTEM_MONITOR_GRAPH_WIDTH"
	gsettings $SCHEMA set org.gnome.shell.extensions.system-monitor "$SETTING"-refresh-time 1500
	gsettings $SCHEMA set org.gnome.shell.extensions.system-monitor "$SETTING"-show-text false
done


# Schemaless
# Use `dconf dump / > dump.dconf` to get the current values
# Use `dconf reset -f /org/gnome/shell/extensions/extension-name/` to clear all settings there

dconf write /org/gnome/shell/extensions/wsmatrix/show-overview-grid true

dconf write /org/gnome/desktop/notifications/application/kitty/enable false
dconf write /org/gnome/desktop/notifications/application/org-gnome-shell-extensions/enable false
