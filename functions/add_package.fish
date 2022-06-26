function add_package
    argparse -n add_package -x 'c,h' \
        c/command \
        h/help -- $argv
    or return 1
    set -l help_msg "Options:
    -h --help           print this help message.
    -c --command        append the given command to packages list.
Examples:
    \$ add_package git
    \$ add_package -c \"curl https://get.volta.sh | bash\"
"

    set -f tab_space "\ \ \ \ "
    set -f tab_space_raw "    "

    if not test -e "$HOME/.config/fish/packages.yml"
        touch $target_path
        echo "commands:" >> "$HOME/.config/fish/packages.yml"
        echo "packages" >> "$HOME/.config/fish/packages.yml"
    end

    if set -lq _flag_help
        echo $help_msg
    else if set -lq _flag_command
        set -l command (echo $argv)
        sed -i "1a$tab_space- $command" "$HOME/.config/fish/packages.yml"
    else
        for package in $argv
            echo "$tab_space_raw- $package" >> "$HOME/.config/fish/packages.yml"
        end
    end
end
