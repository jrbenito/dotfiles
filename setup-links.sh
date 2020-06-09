#!/bin/bash

############################################
# Setup proper symlinks and additional files
############################################

# wrapper for sed . `-E` is used so that it is compatible in both Mac and Ubuntu.
_sed() {
	sed -E "$1" "$2" > "$2.tmp" && mv "$2.tmp" "$2"
}

#_sed "/^additional_files=/s#\"[^\"]*\"#\"$PWD\"#g" $PWD/bash/bashrc

# Bash files
[[ -f  ~/.bashrc && ! -h ~/.bashrc ]] && mv ~/.bashrc ~/.bashrc_backup
ln -sv "$PWD/bash/bashrc" ~/.bashrc
[[ -f ~/.bash_profile && ! -h ~/.bash_profile ]] && mv ~/.bash_profile ~/.bash_profile_backup
ln -sv "$PWD/bash/bash_profile" ~/.bash_profile
[[ -f ~/.bash_logout && ! -h ~/.bash_logout ]] && mv ~/.bash_logout ~/.bash_logout_backup
ln -sv "$PWD/bash/bash_logout" ~/.bash_logout

# screen files
[[ -f ~/.tmux.conf && ! -h ~/.tmux.conf ]] && mv ~/.tmux.conf ~/.tmux.conf_backup
ln -sv "$PWD/tmux/tmux.conf" ~/.tmux.conf

# inputrc. For programs that use readline library
ln -sv "$PWD/bash/inputrc" ~/.inputrc

# editrc. For programs that use editline library
ln -sv "$PWD/bash/editrc" ~/.editrc

# git files
[[ -f ~/.gitconfig && ! -h ~/.gitconfig ]] && mv ~/.gitconfig ~/.gitconfig_backup
ln -sv "$PWD/git/gitconfig" ~/.gitconfig       # You might have to adjust some paths in this file

# vim files
ln -sv "$PWD/vim/vimrc" ~/.vimrc
#ln -sv "$PWD/vim/ycm_extra_conf.py" ~/.ycm_extra_conf.py
if [[ -d ~/.vim && ! -h ~/.vim ]]; then
    mv ~/.vim ~/.vim_backup
fi
[ ! -h ~/.vim ] && ln -sv "$PWD/vim/vim" ~/.vim || echo "Already exist"

# nodejs and its packages files
[[ -f ~/.jshintrc && ! -h ~/.jshintrc ]] && mv ~/.jshintrc ~/.jshintrc_backup
ln -sv "$PWD/nodejs/jshintrc" ~/.jshintrc

# bin directory  and files
mkdir -p ~/bin
if [ -d ~/bin ]; then
    [ ! -h ~/bin/garmin-sync.sh ] && ln -sv "$PWD/bin/garmin-sync.sh" ~/bin || echo "Already exist"
    [ ! -h ~/bin/rainbowstream.sh ] && ln -sv "$PWD/bin/rainbowstream.sh" ~/bin || echo "Already exist"
    [ ! -h ~/bin/shellcheck ] && ln -sv "$PWD/bin/shellcheck" ~/bin || echo "Already exist"
fi

# Install vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +BundleInstall +qall

# ignore changes to the yankring history file
git update-index --assume-unchanged vim/vim/yankring/yankring_history_v2.txt

# install and setup scripts from git contrib
# shellcheck disable=SC1091
source get-git-contrib.sh
