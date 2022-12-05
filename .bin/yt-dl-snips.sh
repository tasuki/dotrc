# Download songs from a playlist
youtube-dl -x --audio-format mp3 -o "%(playlist_index)s-%(title)s.%(ext)s" "https://www.youtube.com/playlist?list=PLoJ4K2AUb-t6FcY0XLlneofU83s0b2moS"
