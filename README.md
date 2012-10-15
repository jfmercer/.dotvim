     ______   _______ _________         _________ _______ 
    (  __  \ (  ___  )\__   __/|\     /|\__   __/(       )
    | (  \  )| (   ) |   ) (   | )   ( |   ) (   | () () |
    | |   ) || |   | |   | |   | |   | |   | |   | || || |
    | |   | || |   | |   | |   ( (   ) )   | |   | |(_)| |
    | |   ) || |   | |   | |    \ \_/ /    | |   | |   | |
    | (__/  )| (___) |   | |     \   /  ___) (___| )   ( |
    (______/ (_______)   )_(      \_/   \_______/|/     \|

# dotvim

These are my vim dotfiles. My goal is to hone vim into the best tool in my programming toolkit. 

Syncing vim's vimrc AND submodules with Git & Pathogen

# Installation

    git clone git://github.com/jfmercer/dotvim.git ~/.vim

Create symlinks:

    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc

Switch to the `~/.vim` directory, and fetch submodules:

    cd ~/.vim
    git submodule init
    git submodule update

## A Note Regarding Plugin Installation

As you can already see, I manage my vim plugins as git submodules with the help of Tim Pope's excellent plugin [pathogen](https://github.com/tpope/vim-pathogen). For an explanation of how this is done, please see @nelstrom's vimcast, [Synchronizing plugins with git submodules and pathogen](http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/). 
