#!/bin/bash

############################################
# Setup proper symlinks and additional files
############################################

# wrapper for sed . `-E` is used so that it is compatible in both Mac and Ubuntu.
_sed() {
	sed -E "$1" $2 > $2.tmp && mv $2.tmp $2
}

#_sed "/^additional_files=/s#\"[^\"]*\"#\"$PWD\"#g" $PWD/bash/bashrc

# Bash files
if [ -f  ~/.bashrc ]; then
    mv ~/.bashrc ~/.bashrc_backup
fi;
ln -sv $PWD/bash/bashrc ~/.bashrc
ln -sv $PWD/bash/bash_profile ~/.bash_profile
ln -sv $PWD/bash/bash_logout ~/.bash_logout

if [ "$TERM_PROGRAM" == "Apple_Terminal" ]; then
    ln -sv $PWD/bash/profile ~/.profile
fi

# screen files
ln -sv $PWD/tmux/tmux.conf ~/.tmux.conf

# inputrc. For programs that use readline library
ln -sv $PWD/bash/inputrc ~/.inputrc

# editrc. For programs that use editline library
ln -sv $PWD/bash/editrc ~/.editrc


# git files
ln -sv $PWD/git/gitconfig ~/.gitconfig       # You might have to adjust some paths in this file

# vim files
ln -sv $PWD/vim/vimrc ~/.vimrc
if [[ -d ~/.vim && ! -h ~/.vim ]]; then
    mv ~/.vim ~/.vim_backup
fi
[ ! -h ~/.vim ] && ln -sv $PWD/vim/vim ~/.vim || echo "Already exist"



# Install vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +BundleInstall +qall

# ignore changes to the yankring history file
git update-index --assume-unchanged vim/vim/yankring/yankring_history_v2.txt

# install and setup scripts from git contrib
source get-git-contrib.sh
