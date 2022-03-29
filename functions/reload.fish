function reload
    argparse -n bd -x 'c,s,i,h' \
        c/config \
        h/help -- $argv
    or return 1

    if set -lq _flag_config
        source (string join '' $__fish_config_dir config.fish)
    else if set -lq _fish_help
        set -l help_msg "Description: just reload fish config files.

Usage:
reload [option]

Options:
    -c, --config        reload $__fish_config_dir/config.fish
"
    end
end
