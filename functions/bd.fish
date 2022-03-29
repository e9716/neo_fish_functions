#!/usr/bin/env fish
# -*-  mode:fish; tab-width:4  -*-
#
# fish-bd main & usage function
# https://github.com/0rax/bd-fish
#

function bd

    argparse -n bd -x 'c,s,i,h' \
        c/classic \
        s/seems \
        i/insensitive \
        h/help -- $argv
    or return 1

    set -l oldpwd (pwd)
    set -l newpwd ""
    set -l opts "$BD_OPT"
    set -l oldpwd_list (string split / (pwd))
    set -l help_msg "# fish-bd v1.3.3 (https://github.com/0rax/bd-fish)

Description:
    Quickly go back to a parent directory up in your current working directory tree.
    Don't write 'cd ../../..' redundantly, use bd instead.

Usage:
    bd [option] <pattern>

Examples:
    # You are in /home/user/my/path/is/very/long/
    # And you want to go back to 'path', simple type
    > bd path
    # or
    > bd -s pa
    # or
    > bd -i Pat
    # or
    > bd 3
    # And you are now in /home/user/my/path/

Options:
    -c <pattern>
            Classic mode : goes back to the first directory matching the pattern (default)
            Set if default using (set -gx BD_OPT 'classic')
            Default mode when BD_OPT or CLI options are specified
    -s <pattern>
            Seems mode: goes back to the first directory starting with pattern
            Set it as default using (set -gx BD_OPT 'sensitive')
    -i <pattern>
            Case insensitive mode: same as seems mode without case sensitity
            Set it as default using (set -gx BD_OPT 'insensitive')
    -h      Print this help and exit

            Note:
            Fuzzy matching of a directory can be done with any mode using the built-in
            fish-shell autocompletion. This allows you to enter any part of the path
            and still match it.\n"

    if set -lq _flag_help
        printf $help_msg
        return 0
    else if set -lq _flag_classic
        set opts clasic
    else if set -lq _flag_seems
        set opts seems
    else if set -lq _flag_insensitive
        set opts insensitive
    end

    if [ (count $argv) = 0 ]
        cd ..
        return 0
    end

    switch "$opts"
        case seems
            set newpwd (echo $oldpwd | sed 's|\(.*/'$argv[1]'[^/]*/\).*|\1|')
        case insensitive
            set newpwd (echo $oldpwd | perl -pe 's|(.*/'$argv[1]'[^/]*/).*|$1|i')
        case '*' # classic
            set newpwd (echo $oldpwd | sed 's|\(.*/'$argv[1]'/\).*|\1|')
    end

    if [ "$newpwd" = "$oldpwd" ]
        if [ (string match -r "\d*" "$argv[1]") -a $argv[1] -gt 0 ]
            cd (printf "%$argv[1]s" | sed "s/ /..\//g")
        else
            echo "No such occurence." >&2
        end
    else
        cd "$newpwd"
    end
end
