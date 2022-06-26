function install
    set -l arg $argv[1]

    if type -q $arg
        return
    else
        switch (get_os_name)
            case ubuntu
                sudo apt update -y
                sudo apt upgrade -y
                sudo apt autoremove -y
                sudo apt install $arg -y
            case arch
                yes | sudo pacman -S $arg
            case macos
                if type -q brew
                    brew install $arg
                else
                    echo please install brew.
                    echo https://brew.sh/index_ja
                end
            case *
                echo don\'t support (get_os_name) os
        end
    end
end
