#!/bin/bash
set -euo pipefail

# tested on Gnome 43.9 on Debian 12 bookworm... still can't get things to work properly

echo "This is semi-working... requires pressing enter very fast"
#exit 1 # no dice, go install the extensions manually

# https://extensions.gnome.org/extension/1287/unite/
# https://extensions.gnome.org/extension/1485/workspace-matrix/
# https://extensions.gnome.org/extension/3010/system-monitor-next/
# https://extensions.gnome.org/extension/307/dash-to-dock/

EXTENSIONS="
unite@hardpixel.eu
wsmatrix@martin.zurowietz.de
system-monitor-next@paradoxxx.zero.gmail.com
dash-to-dock@micxgx.gmail.com
"

for EXTENSION in $EXTENSIONS; do
	busctl --user call org.gnome.Shell.Extensions /org/gnome/Shell/Extensions org.gnome.Shell.Extensions InstallRemoteExtension s ${EXTENSION}
done

