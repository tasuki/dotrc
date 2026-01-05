#!/bin/bash

set -euo pipefail


### Customizable preferences

GNOME_FONT_SIZE=${GNOME_FONT_SIZE:-'12'}
GNOME_SYSTEM_MONITOR_SERVICES=${GNOME_SYSTEM_MONITOR_SERVICES:-'cpu memory swap net disk thermal fan'}
GNOME_SYSTEM_MONITOR_GRAPH_WIDTH=${GNOME_SYSTEM_MONITOR_GRAPH_WIDTH:-'70'}

# Preferences
CLOCKS="[
	<(uint32 2, <('San Francisco', 'KOAK', true, [(0.6583, -2.1334)], [(0.6592, -2.1366)])>)>,
	<(uint32 2, <('New York', 'KNYC', true, [(0.7118, -1.2909)], [(0.7105, -1.2916)])>)>,
	<(uint32 2, <('London', 'EGWU', true, [(0.8997, -0.0072)], [(0.8988, -0.0020)])>)>,
	<(uint32 2, <('Prague', 'LKKB', true, [(0.8747, 0.2538)], [(0.8741, 0.2524)])>)>,
	<(uint32 2, <('Tokyo', 'RJTI', true, [(0.6219, 2.4408)], [(0.6228, 2.4391)])>)>
]"
# wrap each item in object with 'location' key
WORLD_CLOCKS=$(echo "$CLOCKS" | sed "s/\(<(.*)>)>\)/{'location': \1}/g")


### Gnome

gsettings set org.gnome.clocks world-clocks "$WORLD_CLOCKS"
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'pl'), ('xkb', 'cshack')]"
gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:swapcaps', 'grp:shifts_toggle', 'compose:rctrl']"
gsettings set org.gnome.desktop.input-sources show-all-sources true
gsettings set org.gnome.desktop.interface accent-color "orange"
gsettings set org.gnome.desktop.interface clock-format "24h"
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface cursor-blink false
gsettings set org.gnome.desktop.interface cursor-theme "Yaru"
gsettings set org.gnome.desktop.interface document-font-name "Ubuntu $GNOME_FONT_SIZE"
gsettings set org.gnome.desktop.interface enable-hot-corners false
gsettings set org.gnome.desktop.interface font-name "Ubuntu $GNOME_FONT_SIZE"
gsettings set org.gnome.desktop.interface gtk-theme "Yaru"
gsettings set org.gnome.desktop.interface icon-theme "Yaru"
gsettings set org.gnome.desktop.interface monospace-font-name "Ubuntu Mono $((GNOME_FONT_SIZE + 2))"
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.peripherals.keyboard delay 250
gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 25
gsettings set org.gnome.desktop.peripherals.mouse natural-scroll false
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll false
gsettings set org.gnome.desktop.peripherals.touchpad speed 0.8
gsettings set org.gnome.desktop.peripherals.touchpad two-finger-scrolling-enabled true
gsettings set org.gnome.desktop.privacy remember-recent-files false
gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "['<Shift><Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward "['<Shift><Alt>Tab']"
gsettings set org.gnome.desktop.wm.preferences focus-mode "sloppy"
gsettings set org.gnome.desktop.wm.preferences num-workspaces 6
gsettings set org.gnome.desktop.wm.preferences titlebar-font "Ubuntu $GNOME_FONT_SIZE"

gsettings set org.gnome.nautilus.preferences click-policy "single"

gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
gsettings set org.gnome.settings-daemon.plugins.color night-light-temperature 2500
gsettings set org.gnome.settings-daemon.plugins.power idle-brightness 100
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type "nothing"

gsettings set org.gnome.shell.app-switcher current-workspace-only false
gsettings set org.gnome.shell disabled-extensions "['desktop-icons@csoriano']"
gsettings set org.gnome.shell.world-clocks locations "$CLOCKS"
gsettings set org.gnome.shell.window-switcher current-workspace-only true

gsettings set org.gnome.system.locale region 'en_DK.UTF-8' # oh the sanity

# Gnome Terminal; an amazing amount of effort considering I don't even use it...
hex_to_rgb() { printf "rgb(%d,%d,%d)\n" 0x${1:1:1}${1:1:1} 0x${1:2:1}${1:2:1} 0x${1:3:1}${1:3:1}; }

TERMINAL_PROFILE_ID=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d \')
TERMINAL_PROFILE="org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$TERMINAL_PROFILE_ID/"
gsettings set $TERMINAL_PROFILE use-system-font false
gsettings set $TERMINAL_PROFILE font 'Rec Mono Duotone 14'
gsettings set $TERMINAL_PROFILE scrollbar-policy 'never'

COLOR_SCHEME=$(gsettings get org.gnome.desktop.interface color-scheme | tr -d "'")
if [ "$COLOR_SCHEME" = "prefer-dark" ]; then
	SOLAR_3="#FFE"
	SOLAR_2="#EED"
	SOLAR_1="#CCB"
	SOLAR_0="#AA9"
	SOLAR_00="#577"
	SOLAR_01="#355"
	SOLAR_02="#133"
	SOLAR_03="#022"
else
	SOLAR_03="#FFE"
	SOLAR_02="#EED"
	SOLAR_01="#CCB"
	SOLAR_00="#AA9"
	SOLAR_0="#577"
	SOLAR_1="#355"
	SOLAR_2="#133"
	SOLAR_3="#022"
fi

SOLAR_RED="#E34"
SOLAR_ORA="#C60"
SOLAR_YEL="#A80"
SOLAR_GRN="#890"
SOLAR_CYA="#2A9"
SOLAR_BLU="#28C"
SOLAR_VIO="#77D"
SOLAR_MAG="#C4B"

gsettings set $TERMINAL_PROFILE use-theme-colors false
gsettings set $TERMINAL_PROFILE background-color $(hex_to_rgb "$SOLAR_03")
gsettings set $TERMINAL_PROFILE foreground-color $(hex_to_rgb "$SOLAR_0")
gsettings set $TERMINAL_PROFILE palette \
	"['"$(hex_to_rgb "$SOLAR_03")"'
	, '"$(hex_to_rgb "$SOLAR_RED")"'
	, '"$(hex_to_rgb "$SOLAR_GRN")"'
	, '"$(hex_to_rgb "$SOLAR_YEL")"'
	, '"$(hex_to_rgb "$SOLAR_BLU")"'
	, '"$(hex_to_rgb "$SOLAR_MAG")"'
	, '"$(hex_to_rgb "$SOLAR_CYA")"'
	, '"$(hex_to_rgb "$SOLAR_2")"'
	, '"$(hex_to_rgb "$SOLAR_02")"'
	, '"$(hex_to_rgb "$SOLAR_ORA")"'
	, '"$(hex_to_rgb "$SOLAR_01")"'
	, '"$(hex_to_rgb "$SOLAR_00")"'
	, '"$(hex_to_rgb "$SOLAR_0")"'
	, '"$(hex_to_rgb "$SOLAR_VIO")"'
	, '"$(hex_to_rgb "$SOLAR_1")"'
	, '"$(hex_to_rgb "$SOLAR_3")"'
	]"


### Extensions

# Schemaless
# Use `dconf dump / > dump.dconf` to get the current values
# Use `dconf reset -f /org/gnome/shell/extensions/extension-name/` to clear all settings there

dconf write /org/gnome/shell/extensions/dash-to-dock/background-opacity 0.5
dconf write /org/gnome/shell/extensions/dash-to-dock/dock-fixed false
dconf write /org/gnome/shell/extensions/dash-to-dock/dock-position "'BOTTOM'"
dconf write /org/gnome/shell/extensions/dash-to-dock/extend-height false

dconf write /org/gnome/shell/extensions/system-monitor/center-display false
dconf write /org/gnome/shell/extensions/system-monitor/compact-display false
dconf write /org/gnome/shell/extensions/system-monitor/icon-display false
for SETTING in $(echo "$GNOME_SYSTEM_MONITOR_SERVICES"); do
	dconf write /org/gnome/shell/extensions/system-monitor/"$SETTING"-display true
	dconf write /org/gnome/shell/extensions/system-monitor/"$SETTING"-graph-width "$GNOME_SYSTEM_MONITOR_GRAPH_WIDTH"
	dconf write /org/gnome/shell/extensions/system-monitor/"$SETTING"-refresh-time 1000
	dconf write /org/gnome/shell/extensions/system-monitor/"$SETTING"-show-text false
done

dconf write /org/gnome/shell/extensions/wsmatrix/show-overview-grid true
dconf write /org/gnome/shell/extensions/wsmatrix/num-columns 3
dconf write /org/gnome/shell/extensions/wsmatrix/num-rows 2

dconf write /org/gnome/desktop/notifications/application/kitty/enable true
dconf write /org/gnome/desktop/notifications/application/org-gnome-shell-extensions/enable false

dconf write /org/gtk/gtk4/settings/file-chooser/sort-directories-first true
dconf write /org/gtk/settings/file-chooser/sort-directories-first true
