#!/bin/bash

############################################
# Download files from git contrib directory
############################################

GIT_CONTRIB_DIR="git/git-contrib"

if [ ! -f $GIT_CONTRIB_DIR/completion ]; then
    mkdir -p $GIT_CONTRIB_DIR/completion
fi
if cd $GIT_CONTRIB_DIR/completion; then
   curl https://github.com/git/git/raw/master/contrib/completion/git-completion.bash -OL
   curl https://github.com/git/git/raw/master/contrib/completion/git-prompt.sh -OL
else
   echo "Directory '$GIT_CONTRIB_DIR/completion' not found"
fi

#cd git/git-contrib/diff-highlight

#curl https://github.com/git/git/raw/master/contrib/diff-highlight/README -OL
#curl https://github.com/git/git/raw/master/contrib/diff-highlight/diff-highlight -OL

#Also checkout https://github.com/git/git/tree/master/contrib/subtree
#Use this method - http://stackoverflow.com/a/13738951/24949
