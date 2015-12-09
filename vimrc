" John F. Mercer's VIMRC file

set nocompatible        " Disable vi compatibility
filetype off            " Required by Vundle

" ================ Vundle Setup ===================================
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
source ~/.vim/bundles.vim
call vundle#end()
" ================ End Vundle Setup ===============================

" ================ General Config =================================

filetype plugin on      " Enable filetype-specific plugins (required)
filetype indent on      " Enable filetype-specific indenting (required)
syntax on               " Enable syntax highlighting
set visualbell          " Turn off bell
set number              " Adds line numbers.
set hidden              " Allows unwritten buffers to be hidden
set ruler               " Show the cursor position all the time
set showmode            " Show which mode are we in
set showmatch           " Show matching brackets.
set cursorline          " Highlight current line
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

" ================ Indentation and Whitespace ====================================

set autoindent    " Always set autoindenting on
set smartindent
set smarttab

set tabstop=4     " Specifies the number of spaces that a tab equals
set shiftwidth=4  " Specifies the number of spaces to insert when using Normal Mode's indent function
set softtabstop=4 " Sets the number of spaces Backspace uses in Insert Mode
set expandtab     " When enabled, specifies the uses of spaces instead of tab characters

set list          " Show invisible characters
set listchars=tab:▸\ ,trail:· ",eol:¬  " Set appearance of invisible characters

set wrap          " Wrap lines
set linebreak     " Wrap lines at convenient points
" creates :Wrap: command, which quickly softwraps text
command! -nargs=* Wrap set wrap linebreak nolist

" The following specifies tab/whitespace settings for specific filetypes. autocmd & "filetype on" must be set
if has("autocmd")
" Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType java setlocal ts=3 sts=3 sw=3 expandtab
  autocmd FileType php setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType c setlocal ts=3 sts=3 sw=3 expandtab
  " Automatically strip trailing whitespaces on save
  " This will really mess up git diffs unless the purpose of the commit
  " is to fix whitespace
  " autocmd BufWritePre *.py,*.js :call <SID>StripTrailingWhitespaces()
endif

" ================ Folds ==========================================

set foldmethod=syntax   "fold based on X
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

set guifont=Menlo\ for\ Powerline:h18

" ================ vim-airline ===================================

" set t_Co=256     " Forces 256 colors, unneeded when TERM is already set to 256
let g:airline_powerline_fonts = 1

" ================ Solarized Colorscheme Settings =================

set background=dark
colorscheme solarized

" ================ Key Mappings  ==================================

" Changes leader key from "\" to ","
let mapleader = ","

" This maps <ESC> to 'jk'
inoremap jk <esc>

" Toggle :set list!
nnoremap <leader>l :set list!<CR>   " Shortcut to rapidly toggle `set list` with '<leader>l'

" Toggle highlighting :noh -> <leader><h>
noremap <silent> <leader>h :nohlsearch<CR><C-n>

" Toggle line numbers :set nu -> <leader><n>
noremap <silent> <leader>n :set nu!<CR><C-n>

" Fast vimrc editing
nnoremap <silent> <leader>ev :e $MYVIMRC<cr>   " 'e'dit 'v'imrc
nnoremap <silent> <leader>sv :so $MYVIMRC<cr>  " 's'ource 'v'imrc

" Fast path expansion of active buffer in command mode
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Function Keys
set pastetoggle=<F2>                " Toggle paste function for clipboard pasting
nnoremap <F3> :NERDTreeToggle<CR>   " Toggle NERDTree
nnoremap <F4> :TagbarToggle<CR>     " Toggle tagbar
nnoremap <F5> :GundoToggle<CR>      " Toggle gundo

" Disable Arrow Keys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
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
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" ================ Window Settings  ==============================

set splitright  " This sets vertical split windows to open on the right rather than the left.
set splitbelow  " This sets horizontal split windows to open below rather than above.

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

set ofu=syntaxcomplete#Complete     " Turn on omnicomplete
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

" ================ NERDTree autocommands  =========================
" Open NERDTree on startup
autocmd vimenter * NERDTree
" Open NERDTree on startup EVEN IF no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd vimenter * if !argc() | NERDTree | endif
" Close vim even if the only window left open is NERDTree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" ================ vimscript functions =========================================

" :Stab
" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction

" :SummarizeTabs
" Display tab and space settings
command! -nargs=* SummarizeTabs call SummarizeTabs()
function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction

" :Strip
" Strip Trailing Whitespace
command! -nargs=* Strip call <SID>StripTrailingWhitespaces()
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

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

