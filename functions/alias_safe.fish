function alias_safe
    set -f key $argv[1]
    set -f value $argv[2]

    set -f command (echo (string split ' ' $value)[1])

    # echo "key: $key"
    # echo "value: $value"
    # echo "command: $command"

    #* main
    if type -q $command
        alias $key $value
    end
end
