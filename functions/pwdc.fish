function test_pwdc
    switch (uname)
        case Darwin
            pwd | tr -d "\n" | pbcopy
        case Linux
            if [ (string match -r -- "\d*-microsoft-standard-WSL2" (uname -r)) ]
                pwd | tr -d "\n" | clip.exe
            else
                # TODO: support native linux
                echo "doesn't support native linux"
            end
        case *
            echo "doesnt't support (uname) os"
    end
end
