function reload
    argparse -n bd -x 'c,h' \
        c/config \
        h/help -- $argv
    or return 1

    set -l help_msg "Description: just reload fish config files.

Usage:
reload [option]

Options:
-c, --config        reload $__fish_config_dir/config.fish
"

    if set -lq _flag_help
        echo $help_msg
    else if set -lq _flag_config
        source (string join '/' $__fish_config_dir config.fish)
        echo reloaded $__fish_config_dir/config.fish
    else
        exec fish
    end
end
