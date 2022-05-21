function copy
    switch (uname)
        case Darwin
            pbcopy
        case Linux
            if [ (string match -r -- "\d*-microsoft-standard-WSL2" (uname -r)) ]
                /mnt/c/WINDOWS/system32/clip.exe
            else
                # TODO: support native linux
                echo "doesn't support native linux"
            end
        case *
            echo "doesnt't support (uname) os"
    end
end
