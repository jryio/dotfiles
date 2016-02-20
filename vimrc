
"--------------------------------------------------------------------
"                             VUNDLE                                 
"--------------------------------------------------------------------
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin() 

Plugin 'Vundle/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Raimondi/delimitMate'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/syntastic'

call vundle#end()
filetype plugin indent on

"--------------------------------------------------------------------
"                             NERDTREE                               
"--------------------------------------------------------------------
let g:nerdtree_tabs_open_on_gui_startup=0
nmap ,n :NERDTreeToggle<CR>
nmap ,m :NERDTreeFind<CR>

"--------------------------------------------------------------------
"                             VIMAIRLINE
"--------------------------------------------------------------------
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

"--------------------------------------------------------------------
"                             DELIMITMATE
"--------------------------------------------------------------------
let b:delimitMate_autoclose = 1 
let delimitMate_expand_cr = 1

"--------------------------------------------------------------------
"                             SYNTASTIC 
"--------------------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_loc_list_height=3
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" Standard JS
" let g:syntastic_javascript_checkers = ['standard']

"--------------------------------------------------------------------
"                            AUTOMATIC STUFF                        
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
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

  " Automatically wrap at 72 characters and spell check git commit messages
  autocmd FileType gitcommit setlocal textwidth=72
  autocmd FileType gitcommit setlocal spell

augroup END


"--------------------------------------------------------------------
"                             COLORS                                 
"--------------------------------------------------------------------
set t_Co=256
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

"--------------------------------------------------------------------
"                             LAYOUT                                 
"--------------------------------------------------------------------
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

" Standard JS & Syntastic error moving shortcut
nmap <Leader>ln :lnext<CR>
nmap <Leader>lp :lprevious<CR>


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

