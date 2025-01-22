#!/bin/bash
set -euo pipefail

for type in $(grep "image" /etc/mime.types | awk '{print $1}'); do
	xdg-mime default geeqie.desktop "$type"
done

for type in $(grep "audio" /etc/mime.types | awk '{print $1}'); do
	xdg-mime default clementine.desktop "$type"
done

for type in $(grep "video" /etc/mime.types | awk '{print $1}'); do
	xdg-mime default vlc.desktop "$type"
done

for type in $(grep "^text" /etc/mime.types | grep -v html | awk '{print $1}'); do
	xdg-mime default gvim.desktop "$type"
done
