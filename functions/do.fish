#!/usr/bin/env fish
# -*-  mode:fish; tab-width:4  -*-

function do
    set -l cwd (pwd)
    set -l root (git rev-parse --show-toplevel 2>/dev/null)

    set -l scripts
    for script in (find $root/scripts -type f -name "*.sh")
        set script (basename -s ".sh" "$script")
        set scripts $scripts $script
    end

    if [ -d ./scripts ]
        if [ -f "$root/scripts/$argv[1].sh" ]
            sh "$root/scripts/$argv[1].sh"
        else
            echo "Available scripts: $scripts"
        end
    end

    return 0
end
