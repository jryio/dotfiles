" TODO:
" Add tmux support

"--------------------------------------------------------------------
"                             VUNDLE                                 
"--------------------------------------------------------------------
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim
call vundle#begin() 

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'rizzatti/dash.vim'
Plugin 'Raimondi/delimitMate'

call vundle#end()
filetype plugin indent on

"--------------------------------------------------------------------
"                             NERDTREE                               
"--------------------------------------------------------------------
let g:nerdtree_tabs_open_on_gui_startup=0
nmap ,n :NERDTreeToggle<CR>
nmap ,m :NERDTreeFind<CR>

"--------------------------------------------------------------------
"                             POWERLINE                              
"--------------------------------------------------------------------
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

"--------------------------------------------------------------------
"                             DELIMITMATE
"--------------------------------------------------------------------
let b:delimitMate_autoclose = 1 
let delimitMate_expand_cr = 1

"--------------------------------------------------------------------
"                             AUTOMATIC STUFF                        
"--------------------------------------------------------------------
augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80

  " Automatically wrap at 72 characters and spell check git commit messages
  autocmd FileType gitcommit setlocal textwidth=72
  autocmd FileType gitcommit setlocal spell

  " Allow stylesheets to autocomplete hyphenated words
  autocmd FileType css,scss,sass setlocal iskeyword+=-
augroup END


"--------------------------------------------------------------------
"                             COLORS                                 
"--------------------------------------------------------------------
syntax enable
set background=dark
colorscheme base16-railscasts

"--------------------------------------------------------------------
"                             FORMATTING                              
"--------------------------------------------------------------------

" Line Number
set number 

" Tab Formatting
set tabstop=2 shiftwidth=2 expandtab
set smarttab

" Indentation
set autoindent
set smartindent

"--------------------------------------------------------------------
"                             LAYOUT                                 
"--------------------------------------------------------------------
" Virtual Edit Block
set virtualedit=block

" Text wrapping
set tw=80
au BufRead,BufNewFile *.md setlocal textwidth=80

" Show (partial) command in status line.
set showcmd           

" Show the current mode
set showmode       

" Show statusline
set laststatus=2

" Cursorline
set cursorline

"--------------------------------------------------------------------
"                             REMAPPING                              
"--------------------------------------------------------------------

" In Vim 7.4 the backspace is totally fucked so this fixes it
set backspace=indent,eol,start

" Leader Key 
let mapleader=","

" Save
nmap <Leader>s :write<CR>

" visual mode sucks
noremap Q <NOP>

" Buffers
nmap <Leader>bn :bn<CR>
nmap <Leader>bp :bl<CR>
nmap <Leader>bd :bd<CR>

" Dash Integration
nmap <Leader>d :Dash 

" Spellcheck
nmap <Leader>cs :setlocal spell spelllang=en_us<CR>

"--------------------------------------------------------------------
"                             SETTINGS
"--------------------------------------------------------------------

" Fix OS X clipboard yank/paste with vim 7.4
set clipboard=unnamed

" Mouse actions
set mouse=a 

" No swap file
set noswapfile

if $TERM_PROGRAM =~ "iTerm"
    let &t_EI .= "\<Esc>[4 q" " Vertical bar in normal  mode
    let &t_SI = "\<Esc>]50;CursorShape=0\x7" " Block in insert  mode
endif

