
"--------------------------------------------------------------------"
"                             VUNDLE                                 "
"--------------------------------------------------------------------"
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim
call vundle#begin() 

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'chriskempson/base16-vim'

call vundle#end()
filetype plugin indent on

"--------------------------------------------------------------------"
"                             NERDTREE                               "
"--------------------------------------------------------------------"

let g:nerdtree_tabs_open_on_gui_startup=0
nmap ,n :NERDTreeToggle<CR>
nmap ,m :NERDTreeFind<CR>

"--------------------------------------------------------------------"
"                             POWERLINE                              "
"--------------------------------------------------------------------"
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

"--------------------------------------------------------------------"
"                             COLORS                                 "
"--------------------------------------------------------------------"

syntax enable

set background=dark

colorscheme base16-railscasts

"--------------------------------------------------------------------"
"                             FORMATTING                             " 
"--------------------------------------------------------------------"

" Line Number
set number 

" Tab Formatting
set tabstop=2 shiftwidth=2 expandtab
set smarttab

" Indentation
set autoindent
set smartindent

"--------------------------------------------------------------------"
"                             LAYOUT                                 "
"--------------------------------------------------------------------"

" Virtual Edit Block
set virtualedit=block

" Text wrapping
set tw=80
au BufRead,BufNewFile *.md setlocal textwidth=80

" Show (partial) command in status line.
set showcmd           

" Show the current mode
set showmode       

set laststatus=2

" Cursorline
set cursorline

"--------------------------------------------------------------------"
"                             REMAPPING                              "
"--------------------------------------------------------------------"

" In Vim 7.4 the backspace is totally fucked so this fixes it
set backspace=indent,eol,start

" Leader Key 
let mapleader=","

" Save
nmap <Leader>s :write<CR>

" Buffers
nmap <Leader>bn :bn<CR>
nmap <Leader>bd :bd<CR>

" Spellcheck
nmap <Leader>cs :setlocal spell spelllang=en_us<CR>

"--------------------------------------------------------------------"
"                             SETTINGS
"--------------------------------------------------------------------"

" Fix OS X clipboard yank/paste with vim 7.4
set clipboard=unnamed

" Mouse actions
set mouse=a 

"--------------------------------------------------------------------"
"                            STATUSLINE 
"--------------------------------------------------------------------"
set statusline=%f
set statusline=%f\ -\ FileType:\ %y


"--------------------------------------------------------------------"

if $TERM_PROGRAM =~ "iTerm"
    let &t_EI .= "\<Esc>[4 q" " Vertical bar in normal  mode
    let &t_SI = "\<Esc>]50;CursorShape=0\x7" " Block in insert  mode
endif
