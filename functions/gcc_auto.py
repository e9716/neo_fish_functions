
# -*- coding: utf-8 -*-
import argparse
import subprocess
import os
from pathlib import Path

current_dir = Path(os.getcwd())


def gcc_auto():
    parser = argparse.ArgumentParser(
        description='compile and run a c file.')
    parser.add_argument('-d', '--debug',
                        action='store_true',
                        help='run with debug mode.')
    parser.add_argument('-r', '--run',
                        action='store_true',
                        help='compile the given file with gcc and run it.')
    parser.add_argument('argv', nargs='*')

    args = parser.parse_args()
    argv = args.argv

    if __name__ == "__main__":
        # * debug
        if args.debug:
            print(f'args: {args}')

        # * main
        for arg in argv:
            path = Path(arg)
            input_path = path
            output_path = Path(f'{str(path.parent)}/{path.stem}')
            if args.debug:
                print(f'in: {input_path}\nout: {output_path}')
            res_gcc = subprocess.run(
                f'gcc {input_path} --output {output_path}',
                shell=True)

        if args.run:
            for arg in argv:
                path = Path(arg)
                output_path = Path(f'{str(path.parent)}/{path.stem}')
                res_run = subprocess.run(
                    f'{output_path}',
                    shell=True)

