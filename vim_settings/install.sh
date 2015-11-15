#!/bin/sh
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# backup any old vim file
[ -f ~/.vimrc ] && mv ~/.vimrc ~/.vimrc.old

# install Vundle
[ -d ~/.vim ] || mkdir ~/.vim
[ -d ~/.vim/bundle/Vundle.vim ] || \
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# link my base config
ln -s $DIR/.vimrc ~/.vimrc

# install plugins with Vundle
vim +PluginInstall +qall
