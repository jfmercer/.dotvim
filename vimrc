" Mercer's VIMRC file

" PATHOGEN -- Keep at top!
" "-------------------------------------------------
set nocompatible        " Disable vi compatibility
filetype off " Turn filetype detection off because it interferes with pathogen (Debian turns ft on by default)
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#runtime_append_all_bundles() " Load all plugins in the ~/.vim/bundle directory
call pathogen#helptags()                  " Generate helptags for everything in 'runtimepath'
" "-------------------------------------------------

syntax on               " Enable syntax highlighting
filetype on             " Enable filetype detection----This may interfere with Pathogen
filetype indent on      " Enable filetype-specific indenting
filetype plugin on      " Enable filetype-specific plugins
set vb t_vb=            " Turn off bell
set number              " Adds line numbers. Unneeded now because of status
"                         line. See "set stl=" below
" set mouse=a           " Enable the mouse
set cpoptions+=$        " Appends a $ symbol to the end of a block of code being changed by "c" & "C"
"
" backup to ~/.tmp
" set backup
" set backupdir=$HOME/.tmp
" set writebackup
set encoding=utf-8
scriptencoding utf-8
"
" folding settings
" set foldmethod=indent   "fold based on indent
" set foldnestmax=10      "deepest fold is 10 levels
" set nofoldenable        "dont fold by default
" set foldlevel=1         "this is just what i use
"
" Set Font for gvim
set gfn=Consolas:h16

" SEARCH OPTIONS
set incsearch           "Find as you type the search
set hlsearch            "highlight search results
set ignorecase          "Case insensitive search
set smartcase           "Case insensitive search (again)

" Basic Settings
set hidden              " Allows unwritten buffers to be hidden 
set ruler       		" Show the cursor position all the time
set showmode            " Show which mode are we in
set smartindent		    " Always set autoindenting on
set autoindent		    " Always set autoindenting on
set showmatch		    " Show matching brackets.
set laststatus=2        " Always show the status line
set linespace=3         " Prefer a slightly higher line height
set noerrorbells        " Disables the annoying beep
set lazyredraw          " Don't update the display while executing macros
set wildmenu            " Enable enhanced command-line completion

" Set the status line the way I like it
set stl=%f\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%b][0x%B]

" BETTER LINE WRAPPING
set wrap
set textwidth=79
" set formatoptions=qrn1 " I don't know yet what this does.
" set colorcolumn=85 " show a colored column at 85 characters

" INDENT GUIDES SETTINGS
" "-------------------------------------------------
" let g:indent_guides_color_change_percent = 3
" let g:indent_guides_enable_on_vim_startup = 1
"
" SOLARIZED COLORSCHEME SETTINGS 
set background=dark
colorscheme solarized 

" Ctags
set tags=~/.vim/bundle/taglist.vim
let Tlist_WinWidth = 50
map <F3> :TlistToggle<cr>

" TAB SETTINGS
" The following changes tabs to spaces
set ts=4 sts=4 sw=4 expandtab
" To change spaces back to tabs, use set: noexpandtab
" 
" The following specifies tab/whitespace settings for specific filetypes.
" "autocmd" must be supported by VIM for this to work
" "filetype on" must be set (as it is below)

if has("autocmd")
" Enable file type detection
  filetype on
     
" Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
             
" Customizations based on house-style (arbitrary)
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
               
" Treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss setfiletype xml
endif

" Mappings
" This maps <ESC> to 2 letter "j"'s 
:imap jj <Esc>
" Shortcut to rapidly toggle `set list` with "\l"
set list
nmap <leader>l :set list!<CR>
" Backspace for dummies
set backspace=indent,eol,start
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Let's make it easy to edit this file (mnemonic for the key sequence is
" 'e'dit 'v'imrc)
nmap <silent> ,ev :e $MYVIMRC<cr>

" And to source this file as well (mnemonic for the key sequence is
" 's'ource 'v'imrc)
nmap <silent> ,sv :so $MYVIMRC<cr>

" :SET PASTE allows me to paste text from outside vim or the terminal without
" screwing up the formatting & indentation. 
" This setting allows me to toggle :SET PASTE with <F2>
set pastetoggle=<F2>

" This sets vertical split windows to open on the right rather than the left.
set splitright

" This sets horizontal split windows to open below rather than above.
set splitbelow

" NEW WINDOWS
" :new opens a horizontal window
" :vnew opens a vertical window
" vim -o file.one file.two on the commandline will open a series
" of files in horizontal windows

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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Omni complete functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use CTRL-X CTRL-O in Insert mode to start the completion.
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType java set omnifunc=javacomplete#Complete 
