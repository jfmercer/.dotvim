" Mercer's VIMRC file

set nocompatible        " Disable vi compatibility
filetype off            " Required by Vundle

" ================ Vundle Setup ===================================
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
source ~/.vim/bundles.vim

filetype plugin on 		" Enable filetype-specific plugins (required)
filetype indent on 		" Enable filetype-specific indenting (required)
" ================ General Config =================================

syntax on               " Enable syntax highlighting
set visualbell          " Turn off bell
set number              " Adds line numbers.
set hidden              " Allows unwritten buffers to be hidden 
set ruler       		" Show the cursor position all the time
set showmode            " Show which mode are we in
set showmatch		    " Show matching brackets.
set laststatus=2        " Always show the status line
set linespace=3         " Prefer a slightly higher line height
set noerrorbells        " Disables the annoying beep
set lazyredraw          " Don't update the display while executing macros
set history=1000        " Store lots of :cmdline history
set showcmd             " Show incomplete cmds down the bottom
set showmode            " Show current mode down the bottom
set gcr=a:blinkon0      " Disable cursor blink
set backspace=indent,eol,start  "Allow backspace in insert mode
set encoding=utf-8
setglobal fileencoding=utf-8

" ================ Indentation ====================================

set autoindent 			" Always set autoindenting on
set smartindent
set smarttab
" These change tabs to spaces
" To change spaces back to tabs, use set: noexpandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set wrap            "Wrap lines
set linebreak       "Wrap lines at convenient points
" creates ":Wrap: command, which quickly softwraps text
command! -nargs=* Wrap set wrap linebreak nolist

" The following specifies tab/whitespace settings for specific filetypes. autocmd & "filetype on" must be set
if has("autocmd") 
" Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
  autocmd FileType java setlocal ts=3 sts=3 sw=3 expandtab
  autocmd FileType c setlocal ts=3 sts=3 sw=3 expandtab
endif

" ================ Folds ==========================================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Search Settings  ===============================

set incsearch           "Find as you type the search
set hlsearch            "highlight search results
set ignorecase          "Case insensitive search
set smartcase           "Case insensitive search (again)

" ================ Completion =====================================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif,*.pdf

" ================ gvim font =====================================

set guifont=Monaco\ for\ Powerline:h16

" ================ vim-powerline  =================================

set t_Co=256
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
" let g:Powerline_theme="skwp"	"this messes up the prompt somehow
" let g:Powerline_colorscheme="skwp"
" let g:Powerline_symbols = 'fancy'

" ================ Solarized Colorscheme Settings =================
set background=dark
colorscheme solarized 

" ================ Key Mappings  ==================================

" Changes leader key from "\" to ","
" let mapleader = ","

" This maps <ESC> to 'jk'
:inoremap jk <esc>
" disables <ESC> for finger training
:inoremap <esc> <Nop>

" Toggle :set list!
nmap <leader>l :set list!<CR>	" Shortcut to rapidly toggle `set list` with "\l"

" :noh -> <C-l>
nnoremap <silent> <C-l> :nohlsearch<CR>

" Function Keys
set pastetoggle=<F2>			" Toggle paste function for clipboard pasting
nnoremap <F3> :NERDTreeToggle<CR> 	" Toggle NERDTree
nnoremap <F4> :TagbarToggle<CR>     " Toggle tagbar
nnoremap <F5> :GundoToggle<CR>      " Toggle gundo

" Disable Arrove Keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" This sets the movement keys to move by DISPLAY LINE rather than by 
" PHYSICAL LINE. In other words, the keys won't be all screwy. 
" Note that to move by PHYSICAL LINE I must use gj, gk, etc. 
" Basically, this changes vim's original gj to j, gk to k, & vice-versa.
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

" WINDOW CYCLING
" These make cycling between windows easier & faster. 
" Instead of Control-w h, you just hit Control-h
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Fast vimrc editing
nmap <silent> ,ev :e $MYVIMRC<cr>	" 'e'dit 'v'imrc
nmap <silent> ,sv :so $MYVIMRC<cr>	" 's'ource 'v'imrc

" ================ Window Settings  ==============================

set splitright 		" This sets vertical split windows to open on the right rather than the left.
set splitbelow  	 " This sets horizontal split windows to open below rather than above.

" ================ Turn Off Swap Files ===========================

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ===============================
" Keep undo history across sessions, by storing in file.
" Only works all the time.

" silent !mkdir ~/.vim/backups > /dev/null 2>&1
" set undodir=~/.vim/backups
" set undofile

" ================ Scrolling =====================================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Omnicomplete ==================================

set ofu=syntaxcomplete#Complete 	" Turn on omnicomplete
" Use CTRL-X CTRL-O in Insert mode to start the completion.
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType java set omnifunc=javacomplete#Complete 
autocmd Filetype java setlocal completefunc=javacomplete#CompleteParamsInfo

" ================ Notes =========================================
" Old Status Line setting
" set stl=%f\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%b][0x%B]

" Use the same symbols as TextMate for tabstops and EOLs
" set listchars=tab:▸\ ,eol:¬

" vim -o file.one file.two on the commandline will open a series
" of files in horizontal windows

" NEW WINDOWS
" :new opens a horizontal window
" :vnew opens a vertical window

" ================ NERDTree autocommands  =========================
" Open NERDTree on startup
" autocmd vimenter * NERDTree
" Open NERDTree on startup EVEN IF no files were specified
" autocmd vimenter * if !argc() | NERDTree | endif
" Close vim even if the only window left open is NERDTree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
