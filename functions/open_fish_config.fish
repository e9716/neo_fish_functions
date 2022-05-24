function open_fish_config
    argparse -n open_fish_config -x 'c,p,h' \
        c/cat \
        p/path \
        h/help -- $argv
    or return 1

    set -l help_msg "Description: just open fish config files.

    Usage:
    open_fish_config [option]
    open_config [option]

    Options:
    -h, --help        print this help message.
    -c, --cat         cat $__fish_config_dir/config.fish
    -p, --path        echo $__fish_config_dir/config.fish
    "

    if set -lq _flag_help
        echo $help_msg
    else if set -lq _flag_cat
        if type -q bat
            bat $__fish_config_dir/config.fish
        else
            cat $__fish_config_dir/config.fish
        end
    else if set -lq _flag_path
        echo $__fish_config_dir/config.fish
    else
        vim $__fish_config_dir/config.fish
    end
end

abbr open_config open_fish_config
abbr ofc open_fish_config
