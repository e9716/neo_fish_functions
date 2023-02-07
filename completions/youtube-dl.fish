# all subcommands of youtube-dl
set -l commands video audio

complete -c youtube-dl -s h -l help -x --description "Display help"
complete -c youtube-dl -s v -l version -x --description "Print `yt-dlp` version"
complete -c youtube-dl -s H -l highquority -x --description "Download with high quority. (Default: False)"
complete -c youtube-dl -n "not __fish_seen_subcommand_from $commands" \
    -a video -d "Download videos"
complete -c youtube-dl -n "not __fish_seen_subcommand_from $commands" \
    -a audio -d "Download audios"
