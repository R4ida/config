#!/bin/bash

# links all the stuff from my config directory, use it when it is in its desired location

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
MOVED_BASHRC="FALSE"

echo linking files from "$SCRIPT_DIR" directory...

pushd "$HOME" >/dev/null

unmove_bashrc_and_exit() {
    if [[ "$MOVED_BASHRC" == "TRUE" ]]; then
        mv .bashrc_system .bashrc
    fi
    exit 1
}

check_if_exists() {
    FILENAME="$1"
    if [[ -h "$FILENAME" ]]; then
        echo "$FILENAME" file is already a link, exitting...
        unmove_bashrc_and_exit
    fi

    if [[ -f "$FILENAME" ]]; then
        echo "$FILENAME" file already exists, exitting...
        unmove_bashrc_and_exit
    fi

    if [[ -d "$FILENAME" ]]; then
        echo "$FILENAME" directory already exists, exitting...
        unmove_bashrc_and_exit
    fi
}

if [[ -f ".bashrc" ]]; then
    if [[ -f ".bashrc_system" ]]; then
        echo .bashrc_system file already exists, exitting...
        exit 1
    fi
    mv .bashrc .bashrc_system
    MOVED_BASHRC="TRUE"
fi

# @todo: apparently .config doesnt exist on macs, and it crashes script..
# but then, even if it manages to link everything, my .bashrc config makes bash segfault on macs...
linking_locations=".inputrc .bashrc .tmux.conf .config/ipython .config/mpv .config/zathura .config/nvim"
for file in $linking_locations; do
    check_if_exists "$file"
done

ln -s "$SCRIPT_DIR"/inputrc   "$HOME"/.inputrc
ln -s "$SCRIPT_DIR"/tmux.conf "$HOME"/.tmux.conf
ln -s "$SCRIPT_DIR"/bashrc    "$HOME"/.bashrc
ln -s "$SCRIPT_DIR"/ipython   "$HOME"/.config/ipython
ln -s "$SCRIPT_DIR"/nvim      "$HOME"/.config/nvim
ln -s "$SCRIPT_DIR"/zathura   "$HOME"/.config/zathura
ln -s "$SCRIPT_DIR"/mpv       "$HOME"/.config/mpv

if [[ ! -f ".git-prompt.sh" ]]; then
    curl 'https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh' --output '.git-prompt.sh'
fi

popd >/dev/null

"$SCRIPT_DIR/PlugInstall.sh"
