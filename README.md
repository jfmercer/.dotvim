     ______   _______ _________         _________ _______
    (  __  \ (  ___  )\__   __/|\     /|\__   __/(       )
    | (  \  )| (   ) |   ) (   | )   ( |   ) (   | () () |
    | |   ) || |   | |   | |   | |   | |   | |   | || || |
    | |   | || |   | |   | |   ( (   ) )   | |   | |(_)| |
    | |   ) || |   | |   | |    \ \_/ /    | |   | |   | |
    | (__/  )| (___) |   | |     \   /  ___) (___| )   ( |
    (______/ (_______)   )_(      \_/   \_______/|/     \|

# dotvim

These are my vim dotfiles. My goal is to hone vim into the best text editor in my programming toolkit.

# Installation

    git clone git://github.com/jfmercer/dotvim.git ~/.vim

Create symlinks:

    ln -s ~/.vim/vimrc ~/.vimrc

In any vim buffer, run `:BundleInstall`. Then restart vim.

## A Note Regarding Plugin Installation

I manage my vim plugins as git submodules with [Vundle](https://github.com/gmarik/vundle).

# vimrc
I've tried to keep my vimrc organized by topic and as clean as possible. Suggestions are welcome.

# Key Mappings
* `ESC` is now `jk`. This will save your left pinky from a premature death.
* `F2` toggles paste.
* `F3` toggles NERDTree.
* `F4` toggles tagbar.
* `F5` toggles gundo.
* `,ev` edits your vimrc. The mnemonic is 'e'dit 'v'imrc.
* `,sv` sources your vimrc. The mnemonic is 's'ource 'v'imrc.

# Plugins

### [Vundle](https://github.com/gmarik/vundle)
This manages the runtimepath.
### [Fugitive](https://github.com/tpope/vim-fugitive)
To quote Tim Pope, it's "a Git wrapper so awesome, it should be illegal."
### [NERDTree](https://github.com/scrooloose/nerdtree)
A file tree explorer. Basically, the project drawer you may be missing from Textmate and Sublime Text.
### [NERD Commenter](https://github.com/scrooloose/nerdcommenter)
This makes commenting much easier. Select something, `[count]<leader>cc`, done.
### [Tagbar](https://github.com/majutsushi/tagbar)
Tagbar is for browsing the tags of source code files. It needs to have [Exuberant ctags](http://ctags.sourceforge.net/) installed in order to work.
### [Gundo](http://sjl.bitbucket.org/gundo.vim/)
Gundo views and explorers vim's undo history. vim keeps its undo history in a tree. If you want to escape the hell of the `:undolist` command, then gundo is for you.
### [Syntastic](https://github.com/scrooloose/syntastic)
Syntastic brings syntax checking to vim. As soon as you save a file, syntastic will check it for syntax errors and list them on the left-hand column. Note that it works with supported syntax checks, and if these are not installed, it won't work. For example, for Python, you need to have `flake8`, `pyflakes`, or `pylint` in your `$PATH`. Jump between errors with `:lnext` and `:lprev`.
### [Easy Motion](https://github.com/Lokaltog/vim-easymotion)
Easy Motion makes it much, much easier to move the cursor around the screen. See @Lokaltog's [introduction](https://github.com/Lokaltog/vim-easymotion#introduction) for details. The short version: hit `<Leader><Leader>` followed by a motion key (say, `<Leader><Leader>w`) and then watch the magic happen.
### [vim-airline](https://github.com/bling/vim-airline)
A beautiful and very useful vim status line. For this to work properly, you may have to install Powerline-ready fonts, four of which [may be found here](https://github.com/jfmercer/mad/tree/master/fonts).
### [vim-solarized](https://github.com/altercation/vim-colors-solarized)
The best color scheme in the business. It's like a massage for the eyes.
### [delimitMate](https://github.com/Raimondi/delimitMate)
Provides insert mode auto-completion for quotes, parentheses, brackets, etc.
