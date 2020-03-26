syntax on

"----- GENERAL SETTINGS-------
set shiftwidth=4                " Set number of spaces to be inserted for indentation
set tabstop=4                   " Set number of spaces to be inserted when tab is pressed

let s:counter = 0
let s:timer = -1

set mouse=a                     " Enable support for mouse

set noerrorbells                " No beeps
set number                      " Show line numbers
set backspace=indent,eol,start  " Makes backspace key more powerful
set showcmd                     " Show me what I'm typing
set showmode                    " Show current mode

set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
set nowritebackup               " Don't create backup files on successful write
set nowrap						" Disable line wrapping
set autoread                    " Automatically reread changed files without asking me anything

set colorcolumn=80				" Create a ruler at 80th column 
set ruler                       " Show the cursor position all the time
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " But not when search pattern contains upper case characters
set foldmethod=syntax			" Set block folding to language syntax
set foldlevelstart=1			" Set default code block fold level

syntax sync minlines=256
set synmaxcol=300
set re=1

" speed up syntax highlighting
set nocursorcolumn
set nocursorline

filetype off 

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

set splitright	" Open the split on right instead of left
set splitbelow	" Open the split below instead of above

"-------------- PLUGINS STARTS -----------------
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/syntastic'
Plugin 'xolox/vim-misc'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'Raimondi/delimitMate'
Plugin 'jez/vim-c0'
Plugin 'flazz/vim-colorschemes'
Plugin 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call vundle#end()  
"-------------- PLUGINS END --------------------

filetype plugin on

let g:airline_powerline_fonts = 1
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled = 1
set background=dark             " Default color theme
let g:solarized_termcolors=256
silent! colorscheme solarized           " Color theme

" Set the 80 column ruler color
highlight ColorColumn ctermbg=grey 

"-------- SYNTASTIC SETTINGS---------
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"

"---------GIT SETTINGS--------------
hi clear SignColumn
let g:airline#extensions#hunks#non_zero_only = 1

"----------DELIMITEMATE SETTINGS-----------------
let delimitMate_expand_cr = 1
augroup mydelimitMate
    au!
    au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
    au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

"----------MOUSE SUPPORT IN TMUX-----------------
if &term =~ '^screen'
   " tmux knows the extended mouse mode
   set ttymouse=xterm2
endif

"----------VIM GO SETTINGS-----------------------
let g:go_fmt_command = "goimports"    " Run goimports along gofmt on each save     
set balloonexpr=go#tool#DescribeBalloon()
set ttymouse=sgr
set balloondelay=250
set ballooneval
set balloonevalterm


autocmd FileType * set formatoptions-=cro	" Disable comment continuation to the next line
