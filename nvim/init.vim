" ---------------------------------------------------
" Dotfiles
" Author                  : thebearjew <Jacob Young>
" Creation Date           : August 4th, 2015
" Convereted to Vim by    : Daniel Awai
" ---------------------------------------------------


" Auto install Plug 
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
" end - Auto install plug
call plug#begin('~/.config/nvim/plugged')

" Plug Packages

" - 1. General plugins - tools, linters, etc,
" ---------------------------------------------------
Plug 'scrooloose/nertree'
Plug 'shougo/vimfiler.vim'
Plug 'scrooloose/syntastic'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'elixir-lang/vim-elixir'

" - 2. JavaScript - ES6, React, etc.
" ---------------------------------------------------
"  Modern JavaScript support - indent, syntax, etc
Plug 'pangloss/vim-javascript'
" JSX Sytax - React
Plug 'pangloss/vim-jsx'
" JSON Syntax
Plug 'sheerun/vim-json'
" Tern JS - autocomplete, static analyzer
Plug 'carlitux/deoplete-ternjs'
" Flow - static type checker for JavaScript
Plug 'steelsojka/deoplete-flow'
" JSDoc - documentation comments

" - 3. HTML & CSS - Syntax highlighting
" ---------------------------------------------------
" HTML snytax
Plug "othree/html5.vim"
" SCSS syntax 
Plug 'cakebaker/scss-syntax.vim'
" Color highlighter
Plug 'lilydjwg/colorizer', { 'for': ['css', 'sass', 'scss', 'less', 'html', 'xdefaults', 'javascript', 'javascript.jsx'] }

" - 4. Elxiir 

call plug#end()


" COLORS
set background=dark
colorscheme base16-railscasts
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Line Number
set number 

" Tab Formatting
set tabstop=2 shiftwidth=2 expandtab
set smarttab

" Indentation
set autoindent

" Virtual Edit Block
set virtualedit=block

" Text wrapping
au BufRead,BufNewFile *.md setlocal textwidth=80

" Show (partial) command in status line.
set showcmd           

" Show the current mode
set showmode       

" Show statusline
set laststatus=2

" Cursorline
" set cursorline

"--------------------------------------------------------------------
"                             REMAPPING                              
"--------------------------------------------------------------------

" Leader Key 
let mapleader=","

" Save
nmap <Leader>s :write<CR>

" Buffers
nmap <Leader>j :bn<CR>
nmap <Leader>k :bp<CR>
nmap <Leader>bd :bd<CR>

" visual mode sucks
noremap Q <NOP>

" Spellcheck
nmap <Leader>cs :setlocal spell spelllang=en_us<CR>

" In Vim 7.4 the backspace is totally fucked so this fixes it
set backspace=indent,eol,start

" SETTINGS
" Fix OS X clipboard yank/paste with vim 7.4
set clipboard=unnamed

" No swap file
set noswapfile

if has('nvim')
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
endif

" NERDTREE
let g:nerdtree_tabs_open_on_gui_startup=0
nmap ,n :NERDTreeToggle<CR>
nmap ,m :NERDTreeFind<CR>

" VIM AIRLINE
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts=1
let g:airline_theme='base16'

" DELIMITMATE
let b:delimitMate_autoclose = 1 
let delimitMate_expand_cr = 1

" SYNTASTIC
let g:syntastic_check_on_wq = 0 
let g:syntastic_check_on_open = 0
let g:syntastic_always_populate_loc_list = 1

" STANDARD JS
let g:syntastic_javascript_checkers = ['standard']
let g:syntastic_python_python_exec = '/Library/Frameworks/Python.framework/Versions/3.4/bin/python3'

" AUTOMATIC STUFF
augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   execute "normal! g`\"" |
    \ endif
  
  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

  " Automatically wrap at 72 characters and spell check git commit messages
  autocmd FileType gitcommit setlocal textwidth=72
  autocmd FileType gitcommit setlocal spell
augroup END

