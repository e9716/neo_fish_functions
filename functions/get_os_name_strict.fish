function get_os_name_strict
    if test -e /etc/debian_version; or test -e /etc/debian_release;
        if test -e /etc/lsb-debian-release
            echo 'ubuntu'
        else
            echo 'debian'
        end
    else if test -e /etc/fedora-release
        echo 'fedora'
    else if test -e /etc/redhat-release
        if test -e /etc/oracle-release
            echo 'oracle'
        else
            echo 'redhat'
        end
    else if test -e /etc/arch-release
        echo 'arch'
    else if test -e /etc/tubolinux-release
        echo 'turbol'
    else if test -e /etc/SuSE-release
        echo 'suse'
    else if type -e /etc/mandriva-release
        echo 'mandriva'
    else if type -e /etc/vine-release
        echo 'vine'
    else if test -e /etc/gentoo-release
        echo 'gentoo'
    end
    return 1
end
