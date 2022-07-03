## collection of fish commands for my own use.

A collection of useful commands for myself.  
Includes forked commands developed by others.  
Supports wsl2(may be few commands not working), macOS and ArchLinux.  
**Most commands have a help option**, so check it for details.  

## command list

- bd  -->  Quickly go back to a parent directory(0rax/fish-bd)
- pwdc  -->  Copy the current directory path.
- reload  -->  Just reload the fish shell.
- copy --> just copy. Supports win(wsl) & mac.
- open_fish_config/ofc --> Just open the fish config file.
- get_os_name --> Returns the name of the OS distribution you are currently using.
- alias_safe --> make alias if given command has already installed. (experimental)
- gcc_auto --> Compile and run the given c file.

## requirements

- python3.10
- click (python package)

## how to install

### using fisher

```shell
fisher install e9716/my_fish_functions
```
