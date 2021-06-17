syntax on

"----- GENERAL SETTINGS-------
set shiftwidth=4                " Set number of spaces to be inserted for indentation
set tabstop=4                   " Set number of spaces to be inserted when tab is pressed

let s:counter = 0
let s:timer = -1

set mouse=a                     " Enable support for mouse

"set noerrorbells                " No beeps
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
Plugin 'majutsushi/tagbar'
Plugin 'dense-analysis/ale'
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
set ttymouse=sgr
set balloondelay=250
set ballooneval
set balloonevalterm

" Returns either the contents of a fold, lint err/warn or godef.
function! BalloonExpr()
  let foldStart = foldclosed(v:beval_lnum)

  " check if we are in a fold
  if foldStart >= 0
    let foldEnd = foldclosedend(v:beval_lnum)
    let numLines = foldEnd - foldStart + 1
    let lines = []
    " Up to 31 lines get shown okay; beyond that, only 30 lines are shown with
    " ellipsis in between to indicate too much. The reason why 31 get shown ok
    " is that 30 lines plus one of ellipsis is 31 anyway.
    if ( numLines > 31 )
      let lines = getline( foldStart, foldStart + 14 )
      let lines += [ '-- Snipped ' . ( numLines - 30 ) . ' lines --' ]
      let lines += getline( foldEnd - 14, foldEnd )
    else
      let lines = getline( foldStart, foldEnd )
    endif

    "return join( lines, has( "balloon_multiline" ) ? "\n" : " " )
    call popup_beval(lines, #{mousemoved:'word'})
    return ""
  endif

  " check if there is a lint error on the line
  let l:loclist = get(g:ale_buffer_info, v:beval_bufnr, {'loclist': []}).loclist
  let l:index = ale#util#BinarySearch(l:loclist, v:beval_bufnr, v:beval_lnum, v:beval_col)
  " get the lint message if found
  if l:index >= 0
    return l:loclist[l:index].text
  endif

  " use golang as default
  return go#tool#DescribeBalloon()
endfunction
set balloonexpr=BalloonExpr()


autocmd FileType * set formatoptions-=cro	" Disable comment continuation to the next line

nnoremap <silent> <F8> :TagbarToggle<CR>	" Set tag fold key
