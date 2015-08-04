
"--------------------------------------------------------------------"
"                             VUNDLE
"--------------------------------------------------------------------"
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin() 

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'chriskempson/base16-vim'

call vundle#end()

" Required - allows for filetype specific indentation
filetype plugin indent on

"--------------------------------------------------------------------"
"                             NERDTREE
"--------------------------------------------------------------------"
let g:nerdtree_tabs_open_on_gui_startup=0
nmap ,n :NERDTreeToggle<CR>
nmap ,m :NERDTreeFind<CR>

"--------------------------------------------------------------------"
"                             COLORS
"--------------------------------------------------------------------"
" FUCKING SYNTAX HIHGLIGHTING YO!
syntax enable

set background=dark

" Solarized Options [Not Active] 
" let g:solarized_visibility = "high"
" let g:solarized_contrast = "high"
" let g:solarized_termtrans = 1 

" Color Scheme 
colorscheme base16-railscasts

"--------------------------------------------------------------------"
"                             INDENTATION 
"--------------------------------------------------------------------"

" Line Numbers
set number

" Tab Formatting
set tabstop=2 shiftwidth=2 expandtab
set smarttab

" Indentation
set autoindent
set smartindent

" Virtual Edit Block
set virtualedit=block

" Don't Create Swap Files
set noswapfile

" Fix OS X clipboard yank/paste with vim 7.4
set clipboard=unnamed

" Show (partial) command in status line.
set showcmd           

" Show the current mode
set showmode        

" Text wrapping
set tw=79
au BufRead,BufNewFile *.md setlocal textwidth=80

" Always show status line
set laststatus=2     

" Statusline
set statusline=%F
set statusline+=%=
set statusline+=%m
set statusline+=\ %Y
set statusline+=\ %3l/%L[%3p%%]

" Cursor Line
set cursorline

"--------------------------------------------------------------------"
"                             REMAPPING
"--------------------------------------------------------------------"
" Ctrl-C will copy to system clipboard

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
