#!/usr/bin/python3

'''
ln_dir2dir - links all files directory to destination
ln_dir2dir source_directory destination_directory
'''

# is this overengineering? ffs, I can just do all the links by hand too..
# eh whatever

import sys
import shutil
import os

# sys.tracebacklimit = 0

try:
    _, source_dir, destination_dir = sys.argv
except:
    print('Error: wrong usage')
    print('ln_dir2dir source_directory destination_directory')
    sys.exit(1)

for file in os.listdir(source_dir):
    src, dst = f'{os.path.abspath(source_dir)}/{file}', f'{destination_dir}/{file}'

    # move or remove dst if exists
    try:
        old_file = f'/tmp/{file}-old'
        try:
            shutil.move(dst, old_file)
            print(f'moved old {dst} file to {old_file}')
        except FileExistsError:
            os.remove(dst)
            print(f'removed old {dst} file')
    except:
        pass

    print(f'linking {src} to {dst}')
    os.symlink(src, dst)
