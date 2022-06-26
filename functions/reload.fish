function reload
    argparse -n reload -x 'c,i,h' \
        c/config \
        i/init \
        h/help -- $argv
    or return 1

    set -l help_msg "Description: just reload fish config files.

Usage:
reload [option]

Options:
-h, --help          show this message.
-c, --config        reload $__fish_config_dir/config.fish.
-i, --init          install the packages in packages.yml (include commands).
"

    if set -lq _flag_help
        echo $help_msg
    else if set -lq _flag_config
        source (string join '/' $__fish_config_dir config.fish)
        echo reloaded $__fish_config_dir/config.fish
    else if set -lq _flag_init
        init_main -c
        exec fish
    else
        exec fish
    end
end
