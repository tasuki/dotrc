#!/bin/bash

# tested on Gnome 3.36.8 and... it doesn't work!

echo "This ain't working... go install the extensions manually"
exit 1 # no dice, go install the extensions manually

set -euo pipefail

EXTENSION_URL="https://extensions.gnome.org/extension-data"
EXTENSION_PATH="$HOME/.local/share/gnome-shell/extensions/"

# no-title-barjonaspoehler.de.v5.shell-extension.zip - superseded by unite
# remove-dropdown-arrowsmpdeimos.com.v13.shell-extension.zip - superseded by unite
EXTENSIONS="
unitehardpixel.eu.v48.shell-extension.zip
wsmatrixmartin.zurowietz.de.v27.shell-extension.zip
system-monitor-nextparadoxxx.zero.gmail.com.v4.shell-extension.zip
clipboard-indicatortudmotu.com.v37.shell-extension.zip
"

cd /tmp/
for EXTENSION in $EXTENSIONS; do
	echo "Downloading $EXTENSION"
	curl -O "$EXTENSION_URL/$EXTENSION"
	#gnome-extensions install "$EXTENSION"
	UUID=$(unzip -qc "$EXTENSION" metadata.json | jq -r '.uuid')
	echo $UUID

	if [[ ! -d $EXTENSION_PATH/$UUID ]]; then
		echo "Unzipping extension $UUID"
		mkdir "$EXTENSION_PATH/$UUID"
		unzip -q "./$EXTENSION" -d "$EXTENSION_PATH/$UUID"
	else
		echo "Extension $UUID already exists"
	fi
	# gnome-extensions enable "$UUID" # this should work but doesn't?
	gnome-shell-extension-tool -e "$UUID" # this works for some extensions but wsmatrix breaks
done
