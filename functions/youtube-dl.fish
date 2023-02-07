#!/usr/bin/env fish
# -*-  mode:fish; tab-width:4  -*-
#
# This command needs yt-dlp.
# https://github.com/yt-dlp/yt-dlp
#
# This command was created with reference to the following website.
# https://zenn.dev/almon/articles/f5952bf9047608

if type -q yt-dlp
    function youtube-dl
        argparse -n bd -x 'h,v' \
            h/help \
            v/version \
            H/highquority -- $argv
        or return 1

        set -l help_msg "Description: Download YouTube videos using yt-dlp.

Usage: bd [options] [video|music] [URL]

Options:
-h, --help            Show this help message.
-v, --version         Show yt-dlp version.
-H, --highquority     Download with high quority. (Default: false)

Examples:
youtube-dl video \"https://www.youtube.com/watch?v=xxxxxxxxxxx\"
youtube-dl music \"https://www.youtube.com/watch?v=xxxxxxxxxxx\"

youtube-dl video --highquority \"https://www.youtube.com/watch?v=xxxxxxxxxxx\"
youtube-dl music -H \"https://www.youtube.com/watch?v=xxxxxxxxxxx\"
        "

        if set -lq _flag_help
            echo $help_msg
            return 0
        else if set -lq _flag_version
            yt-dlp --version
            return 0
        end

        switch $argv[1]
            case music
                if set -lq _flag_highquority
                    yt-dlp -x -f "ba[ext=webm]" --audio-format mp3 $argv[3]
                else
                    yt-dlp -x -f "ba[ext=webm]" --audio-format mp3 $argv[2]
                end
            case video
                if set -lq _flag_highquority
                    yt-dlp -f "bv[ext=webm]+ba[ext=webm]" --merge-output-format webm --recode-video mp4 $argv[3]
                else
                    yt-dlp -f "ba[ext=m4a]" $argv[2]
                end
            case '*'
                echo "Invalid argument: $argv[1]\n"
                echo $help_msg
        end

        return 0
    end
end
