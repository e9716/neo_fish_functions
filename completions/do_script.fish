function __available_scripts
    set -l cwd (pwd)
    set -l root (git rev-parse --show-toplevel 2>/dev/null)

    set -l scripts
    for script in (find $root/scripts -type f -name "*.sh")
        set script (basename -s ".sh" "$script")
        echo $script
        set scripts $scripts $script
    end
    printf $scripts
end

complete -c do_script -f
complete -c do_script -n "not __fish_seen_subcommand_from (__available_scripts)" -a "(__available_scripts)"
