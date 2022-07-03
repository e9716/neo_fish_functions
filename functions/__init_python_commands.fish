function __init_python_commands
    #* shebangの作成
    if [ -d $__fish_config_dir/.venv ]
        set -f shebang "#!$__fish_config_dir/.venv/bin/python"
    else
        set -f shebang "#!/usr/bin/env python"
    end

    if not [ -d "$__fish_config_dir/functions/_python_functions" ]
        mkdir "$__fish_config_dir/functions/_python_functions"
    end

    set -f python_files (ls "$__fish_config_dir/functions/" | grep -E '.*\.py')

    for file in $python_files
        set -l filename (string match -r '(.*)\.py$' $file)[2]
        set -l file_path "$__fish_config_dir/functions/$file"
        set -l firstline (cat $file_path | head -1 | string match -r '^(..).*')[2]

        #* shebangの追加
        if [ "$firstline" != "#!" ]
            sed -i "1i$shebang" "$file_path"
        end

        #* ./_python_functionsへシンボリックリンクを追加(拡張子無しver)
        if not [ -f "$__fish_config_dir/functions/_python_functions/$filename" ]
            ln -s "$file_path" "$__fish_config_dir/functions/_python_functions/$filename"
        end

    end

    #* 環境変数に追加
    fish_add_path "$__fish_config_dir/functions/_python_functions/"
end

__init_python_commands
