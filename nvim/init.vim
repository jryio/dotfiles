" --------------------------------------------------
"  Created On           : August 4th, 2015
"  Converted to Vim by  : Daniel Awai
"  Forked from          : martin-svk/dot-files
" --------------------------------------------------

" Auto install Plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

let kb_flow='/Users/jacobyoung/go/src/github.com/keybase/client/shared/node_modules/.bin/flow'
let kb_prettier='/Users/jacobyoung/go/src/github.com/keybase/client/shared/node_modules/.bin/prettier'

" 1.0 Plug List
" ==================================================

" --------------------------------------------------
" 1.1 General tools - linters, formatting, etc.
" --------------------------------------------------

" Better quickfix/locationlist bindings
Plug 'romainl/vim-qf'
" Async maker for different file types
Plug 'benekastah/neomake', { 'on': ['Neomake'] }
" Async linting
Plug 'w0rp/ale'
" Prefer local install of eslint over global
Plug 'benjie/neomake-local-eslint.vim'
" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Automatically closing pair stuff
Plug 'jiangmiao/auto-pairs'
" Commenting support (gc)
Plug 'tpope/vim-commentary'
" CamelCase and snake_case motions
Plug 'bkad/CamelCaseMotion'
" Heuristically set indent settings
Plug 'tpope/vim-sleuth'
" Snippet support
Plug 'Shougo/neosnippet.vim'
" Language Server Client
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }

" --------------------------------------------------
" 1.2 JavaScript
" --------------------------------------------------

" Moder JS support (indent, syntax, etc)
Plug 'pangloss/vim-javascript'
" JSX syntax
Plug 'mxw/vim-jsx', { 'for': ['jsx', 'javascript.jsx'] }
" JSON syntax
Plug 'sheerun/vim-json'
" JSON5 syntax
Plug 'GutenYe/json5.vim'
" Autocomplete using flow (npm install -g flow-bin)
Plug 'wokalski/autocomplete-flow'
" Add flow typing support
Plug 'flowtype/vim-flow'
" Prettier vim
" Plug 'prettier/vim-prettier', { 'for': ['javascript', 'javascript.jsx', 'typescript', 'css', 'less', 'scss', 'json'] }

" --------------------------------------------------
" 1.2.1 Elm
" --------------------------------------------------
Plug 'elmcast/elm-vim'

" --------------------------------------------------
" 1.3 HTML/CSS
" --------------------------------------------------

" HTML5 syntax
Plug 'othree/html5.vim'
" Emmett HTML completion
Plug 'mattn/emmet-vim', { 'for': ['javascript.jsx', 'html', 'css'] }
" HTML Tag Closing
Plug 'alvan/vim-closetag'
" SCSS syntax
Plug 'cakebaker/scss-syntax.vim'
" Color highlighter
Plug 'lilydjwg/colorizer', { 'for': ['css', 'sass', 'scss', 'less', 'html', 'xdefaults', 'javascript', 'javascript.jsx', 'vim'] }

" --------------------------------------------------
" 1.4 Other languages
" --------------------------------------------------

" Elixir syntax
Plug 'elixir-lang/vim-elixir'
" Ruby
Plug 'vim-ruby/vim-ruby'
" Ruby Deoplete
Plug 'fishbullet/deoplete-ruby'
" Rust
Plug 'rust-lang/rust.vim'
" Rust Deoplete
Plug 'sebastianmarkow/deoplete-rust'
" Ruby end completion
Plug 'tpope/vim-endwise'
" Yaml indentation
Plug 'martin-svk/vim-yaml'
" Markdown syntax
Plug 'tpope/vim-markdown'
" Git syntax
Plug 'tpope/vim-git'
" Tmux syntax
Plug 'keith/tmux.vim'
" Dockerfile
Plug 'honza/dockerfile.vim'

" --------------------------------------------------
" 1.5  FZF Fuzzy Searcher
" --------------------------------------------------

Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'

" --------------------------------------------------
" 1.6 Interface improving
" --------------------------------------------------

" Nerdtree file browser
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeFind', 'NERDTreeToggle'] }
" Lightline (simple status line)
Plug 'itchyny/lightline.vim'
" Buffers tabline
Plug 'ap/vim-buftabline'

" --------------------------------------------------
" 1.7 External tools - integration plugins
" --------------------------------------------------

" Git changes showed on line numbers
Plug 'airblade/vim-gitgutter'

" --------------------------------------------------
" 1.8 Text insertion/manipulation
" --------------------------------------------------

" Surround (cs"')
Plug 'tpope/vim-surround'
" Easy text alignment
Plug 'godlygeek/tabular', { 'on':  'Tabularize' }
" Titlecase motion (gt)
Plug 'christoomey/vim-titlecase'


" --------------------------------------------------
" 1.9 Text insertion/manipulation
" --------------------------------------------------
Plug 'vivien/vim-linux-coding-style'

" --------------------------------------------------
" 1.10 Other tools
" --------------------------------------------------

" Easily expand selected region
Plug 'terryma/vim-expand-region'
" Intelligent buffer closing
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }
" Tmux ressurect using vim sessions
Plug 'tpope/vim-obsession'

call plug#end()

" ==================================================
" 2.0 Basic settings
"   (Neovim defaults: https://neovim.io/doc/user/vim_diff.html
"   #nvim-option-defaults)
" ==================================================

set shell=/bin/zsh                          " Setting shell to zsh
set number                                  " Line numbers on
set showmode                                " Always show mode
set nowrap                                  " Do not wrap long line
set showcmd                                 " Show commands as you type them
set cmdheight=1                             " Command line height
set pumheight=10                            " Completion window max size
set noswapfile                              " New buffers will be loaded without creating a swapfile
set hidden                                  " Enables to switch between unsaved buffers and keep undo history
set clipboard+=unnamed                      " Allow to use system clipboard

                                            " As it turns out, there is a negative performce issue when having lazy redraw
                                            " on while use tmux. It causes an ugly redraw that makes the entire pane blank
set lazyredraw                              " Don't redraw while executing macros (better performance)

set showmatch                               " Show matching brackets when text indicator is over them
set matchtime=2                             " How many tenths of a second to blink when matching brackets
set nostartofline                           " Prevent cursor from moving to beginning of line when switching buffers
set virtualedit=block                       " To be able to select past EOL in visual block mode
set nojoinspaces                            " No extra space when joining a line which ends with . ? !
set scrolloff=5                             " Scroll when closing to top or bottom of the screen
set updatetime=1000                         " Update time used to create swap file or other things
set suffixesadd+=.js,.rb                    " Add js and ruby files to suffixes
set cursorline                              " Highlight the active line but only style the line number highlight

" --------------------------------------------------
" 2.1 Split settings (more natural)
" --------------------------------------------------

set splitbelow                              " Splitting a window will put the new window below the current
set splitright                              " Splitting a window will put the new window right of the current

" --------------------------------------------------
" 2.2 Timeout settings
" --------------------------------------------------
" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely. (by Steve Losh)
set notimeout
set ttimeout
set ttimeoutlen=10

" --------------------------------------------------
" 2.3 Spelling settings
" --------------------------------------------------

set spellfile=~/.config/nvim/spell/dictionary.utf-8.add
set spelllang=en_us                         " Set language to US English
set nospell                                 " Disable checking by default (use <F4> to toggle)

" --------------------------------------------------
" 2.4 Search settings
" --------------------------------------------------

set ignorecase                              " Ignore case by default
set smartcase                               " Make search case sensitive only if it contains uppercase letters
set wrapscan                                " Search again from top when reached the bottom
set nohlsearch                              " Don't highlight after search

" --------------------------------------------------
" 2.5 Persistent undo settings
" --------------------------------------------------

if has('persistent_undo')
  set undofile
  set undodir=~/.config/nvim/tmp/undo//
endif

" --------------------------------------------------
" 2.6 White characters settings
" --------------------------------------------------

set list                                    " Show listchars by default
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:·,nbsp:·
set showbreak=↪

" --------------------------------------------------
" 2.7 Filetype settings
" --------------------------------------------------

filetype plugin on
filetype indent on

" --------------------------------------------------
" 2.8 Folding settings
" --------------------------------------------------

set foldmethod=marker                       " Markers are used to specify folds.
set foldlevel=2                             " Start folding automatically from level 2
set fillchars="fold: "                      " Characters to fill the statuslines and vertical separators

" --------------------------------------------------
" 2.9 Omni completion settings
" --------------------------------------------------

set completeopt-=preview                    " Don't show preview scratch buffers
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=tmp/**

" --------------------------------------------------
" 2.10 Neovim specific settings
" --------------------------------------------------

" let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1         " Set an environment variable to use the t_SI/t_EI hack
let g:loaded_python_provider=1              " Disable python 2 interface
let g:python_host_skip_check=1              " Skip python 2 host check

" ==================================================
" 3.0 Mapping settings
" ==================================================

" 3.1 Setting leader
" -----------------------------------------------------
let g:mapleader=","

" -----------------------------------------------------
" 3.2 Disabling arrow keys, space key, exmode enter
" with Q key, help with F1, etc.
" -----------------------------------------------------
nnoremap <up> <NOP>
nnoremap <down> <NOP>
nnoremap <left> <NOP>
nnoremap <right> <NOP>
nnoremap <bs> <NOP>
nnoremap <delete> <NOP>
inoremap <up> <NOP>
inoremap <down> <NOP>
inoremap <left> <NOP>
inoremap <right> <NOP>
nnoremap <Space> <NOP>
inoremap <F1> <NOP>
nnoremap <F1> <NOP>
nnoremap Q <NOP>

" -----------------------------------------------------
" 3.3 Vim defaults overriding
" -----------------------------------------------------

" Easier window switching
" nmap <silent> <C-w><C-w> :call utils#intelligentCycling()<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Native Neovim terminal switching
tnoremap <Esc> <C-\><C-n>
" tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" Visual linewise up and down by default (and use gj gk to go quicker)
nnoremap j gj
nnoremap k gk
nnoremap gj 5j
nnoremap gk 5k
vnoremap j gj
vnoremap k gk
vnoremap gj 5j
vnoremap gk 5k

" When jump to next match also center screen
" Note: Use :norm! to make it count as one command. (i.e. for i_CTRL-o)
nnoremap <silent> n :norm! nzz<CR>
nnoremap <silent> N :norm! Nzz<CR>
vnoremap <silent> n :norm! nzz<CR>
vnoremap <silent> N :norm! Nzz<CR>

" Same when moving up and down
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz
vnoremap <C-u> <C-u>zz
vnoremap <C-d> <C-d>zz
vnoremap <C-f> <C-f>zz
vnoremap <C-b> <C-b>zz

" Remap H and L (top, bottom of screen to left and right end of line)
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L g_

" More logical Y (default was alias for yy)
nnoremap Y y$

" Don't yank to default register when changing something
nnoremap c "xc
xnoremap c "xc

" After block yank and paste, move cursor to the end of operated text and don't override register
vnoremap y y`]
vnoremap p "_dP`]
nnoremap p p`]

" Use CamelCaseMotion instead of default motions
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

" Fix the cw at the end of line bug default vim has special treatment (:help cw)
nmap cw ce
nmap dw de

" Uppercase word in insert mode
inoremap <C-u> <ESC>mzgUiw`za

" Matching brackets with TAB (using matchit) (Breaks the <C-i> jump)
map <TAB> %
silent! unmap [%
silent! unmap ]%

" Don't cancel visual select when shifting
xnoremap <  <gv
xnoremap >  >gv

" Terminal mode mappings
if has('nvim')
  tnoremap <ESC> <C-\><C-n>
  tnoremap ,<ESC> <ESC>
endif

" Stay down after creating fold
vnoremap zf mzzf`zzz

" -----------------------------------------------------
" 3.4 Common tasks
" -----------------------------------------------------

" Quick save and close buffer
nnoremap <leader>s :w<CR>
nnoremap <silent> <leader>w :Sayonara!<CR>
nnoremap <silent> <leader>q :Sayonara<CR>

" Yank and paste from clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>yy "+yy
nnoremap <leader>p "+p

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" CTags generation / navigation (:tselect to select from menu)
nnoremap ]t :tn<CR>
nnoremap [t :tp<CR>
nnoremap <leader>ts :ts<CR>
nnoremap <leader>tg :GTags<CR>


" Reselect last-pasted text
nnoremap gp `[v`]

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" [S]plit line (sister to [J]oin lines) S is covered by cc.
nnoremap S mzi<CR><ESC>`z

" Easier fold toggling
nnoremap <Space>z za

" Start substitute on current word under the cursor
nnoremap <Space>s :%s///gc<Left><Left><Left>

" Start search on current word under the cursor
nnoremap <Space>/ /<CR>

" Start reverse search on current word under the cursor
nnoremap <Space>? ?<CR>

" Faster sort
vnoremap <Space>s :!sort<CR>

" Fix spelling error on the go
inoremap <C-s> <C-g>u<ESC>[s1z=`]a<C-g>u

" Fix spelling error in normal mode
" nnoremap <C-s> <C-g>u<ESC>[s1z=`]a<C-g>u
" -----------------------------------------------------
" 3.5 F-key actions
" -----------------------------------------------------

" NERDTree wrapper
nnoremap <silent> <Space>n :call utils#nerdWrapper()<CR>
" Free
" nnoremap <silent> <F2>
" Free
" nnoremap <silent> <F3>
" Toggle spelling
nnoremap <silent> <F4> :set spell!<CR> :set spell?<CR>
" Source (reload configuration)
nnoremap <silent> <F5> :source $MYNVIMRC<CR>
" Toggle search highlight
nnoremap <silent> <F6> :set nohlsearch!<CR> :set nohlsearch?<CR>
" Toggle white characters visibility
nnoremap <silent> <F7> :set list!<CR> :set list?<CR>
" New term buffer
nnoremap <silent> <F8> :terminal<CR>
" Fire REST Request
nnoremap <silent> <F9> :call VrcQuery()<CR>
" Free
" nnoremap <silent> <F10>
" Howdoi
nnoremap <silent> <F11> :call utils#howDoI()<CR>
" Informative echo
nnoremap <F12> :call utils#showToggles()<CR>

" -----------------------------------------------------
" 3.6 Window / Buffer management
" -----------------------------------------------------

" Intelligent windows resizing using ctrl + arrow keys
" nnoremap <silent> <S-Right> :call utils#intelligentVerticalResize('right')<CR>
" nnoremap <silent> <S-Left> :call utils#intelligentVerticalResize('left')<CR>
" nnoremap <silent> <S-Up> :resize +1<CR>
" nnoremap <silent> <S-Down> :resize -1<CR>

" Buffers navigation and management
nnoremap <silent> + :bn<CR>
nnoremap <silent> _ :bp<CR>

" 10x horizontal window resize
map <silent> <M-l> 10<C-w>>
map <silent> <M-h> 10<C-w><
map <silent> <M-j> 10<C-w>-
map <silent> <M-k> 10<C-w>+

" 10x vertical window resize
" nnoremap <silent> <C-w>+ 5<C-w>+
" nnoremap <silent> <C-w>- 5<C-w>-

" -----------------------------------------------------
" 3.7 Command abbreviations and mappings
" -----------------------------------------------------

" Quiting and saving all
cnoremap ww wqall
cnoremap qq qall

" -----------------------------------------------------
" 3.8 Custom commands and functions
" -----------------------------------------------------

" " Generate tags definitions
" command! GTags :call utils#generateCtags()

" " Open notes
" command! Notes :call utils#openNotes()

" " Run current file
" command! Run :call utils#runCurrentFile()
" nnoremap <silent> ,r :Run<CR>

" " Reformat whole or selection from file
" command! Format :call utils#formatFile()
" nnoremap <silent> ,f :Format<CR>

" " Annotate file (show values in special # => comments)
" command! Annotate :call utils#annotateFile()
" nnoremap <silent> ,A :Annotate<CR>

" " Profile
" command! Profile :call utils#profile()

" " Retab
" command! Retab :call utils#retabToFourSpaces()

" ==================================================
" 4.0 Plugins settings
" ==================================================

" -----------------------------------------------------
" 4.1 Auto-switch sk -> en keyboard layouts
" -----------------------------------------------------
let g:utils_autoswitch_kb_layout=0

" -----------------------------------------------------
" 4.2 FZF
" -----------------------------------------------------
"
" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~20%' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" -----------------------------------------------------
" 4.3 NERDTree
" -----------------------------------------------------
let g:NERDTreeMinimalUI=1
let g:NERDTreeWinSize=30
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeShowHidden=1
let g:NERDTreeHighlightCursorline=0
let g:NERDTreeRespectWildIgnore=1

" -----------------------------------------------------
" 4.4 Neosnippet settings
" -----------------------------------------------------
let g:neosnippet#snippets_directory='~/.config/nvim/snippets'
let g:neosnippet#enable_completed_snippet = 1
let g:neosnippet#disable_runtime_snippets = {
    \   '_' : 1
\ }


" -----------------------------------------------------
" 4.5 Gitgutter settings
" -----------------------------------------------------
let g:gitgutter_map_keys=0
let g:gitgutter_max_signs=9999
let g:gitgutter_sign_added='+'
let g:gitgutter_sign_modified='~'
let g:gitgutter_sign_removed='-'
let g:gitgutter_sign_modified_removed='~'
let g:gitgutter_sign_removed_first_line='-'

" -----------------------------------------------------
" 4.6 Vim JSX highlighting settings
" -----------------------------------------------------
let g:jsx_ext_required=0

" -----------------------------------------------------
" 4.7 Lightline settings
" -----------------------------------------------------
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'tab': {
      \   'active': [ 'filename' ],
      \   'inactive': [ 'filename' ]
      \ },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename' ], [ 'session' ] ],
      \   'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'filetype', 'fileencoding', 'fileformat' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"HELP":&readonly?"RO":""}'
      \ },
      \ 'component_function': {
      \   'mode': 'utils#lightLineMode',
      \   'filename': 'utils#lightLineFilename',
      \   'filetype': 'utils#lightLineFiletype',
      \   'fileformat': 'utils#lightLineFileformat',
      \   'fileencoding': 'utils#lightLineFileencoding'
      \ },
      \ 'component_expand': {
      \   'session': 'utils#lightLineSession'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&readonly)'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

" -----------------------------------------------------
" 4.8.0 Elm Settings
" -----------------------------------------------------
let g:elm_format_autosave = 1
" Disable all default Elm-vim keybdindings (redefine them below)
let g:elm_setup_keybindings = 0
"
" -----------------------------------------------------
" 4.8 Neomake settings
" -----------------------------------------------------
" let g:neomake_verbose=3
let g:neomake_warning_sign = {
      \ 'text': '❯',
      \ 'texthl': 'WarningMsg',
      \ }
let g:neomake_error_sign = {
      \ 'text': '❯',
      \ 'texthl': 'ErrorMsg',
      \ }
let g:neomake_javascript_enabled_makers = ["eslint"]
let g:neomake_javascript_jsx_enabled_makers = ["eslint"]

let g:neomake_c_enabled_makers = ["gcc"]
" -----------------------------------------------------
" 4.9 Vim Markdown settings
" -----------------------------------------------------
let g:vim_markdown_no_default_key_mappings=1
let g:vim_markdown_folding_disabled=1

" -----------------------------------------------------
" 4.10 Vim REST console settings
" -----------------------------------------------------
let g:vrc_set_default_mapping=0
let g:vrc_output_buffer_name='__RESPONSE__.rest'

" -----------------------------------------------------
" 4.11 Deoplete autocomplete settings
" -----------------------------------------------------
set runtimepath+=~/.config/nvim/plugged/deoplete.nvim/
let g:deoplete#enable_at_startup=1
let g:deoplete#enable_refresh_always=0
let g:deoplete#file#enable_buffer_path=1

" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
let g:deoplete#soruces#flow#flow_bin=g:kb_flow
let g:deoplete#sources={}
let g:deoplete#sources._= ['around', 'member', 'buffer', 'file']
let g:deoplete#sources#rust#racer_binary='/Users/CASE/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/Users/CASE/.rust/rust/src'
let g:deoplete#sources.ruby=['around', 'buffer', 'member', 'file', 'neosnippet' ]
let g:deoplete#sources.vim=['around', 'buffer', 'member', 'file', 'neosnippet' ]
let g:deoplete#sources['javascript.jsx']=['flow', 'neosnippet', 'member', 'buffer', 'file']
let g:deoplete#sources.javascript=['flow', 'neosnippet', 'member', 'buffer', 'file']
let g:deoplete#sources.css=['around', 'buffer', 'member', 'file', 'omni']
let g:deoplete#sources.scss=['around', 'buffer', 'member', 'file', 'omni']
let g:deoplete#sources.html=['around', 'buffer', 'member', 'file', 'omni']

" -----------------------------------------------------
" 4.12 Ctrl-SF settings
" -----------------------------------------------------
let g:ctrlsf_default_root='project'
let g:ctrlsf_populate_qflist=0
let g:ctrlsf_position='bottom'
let g:ctrlsf_winsize = '30%'
let g:ctrlsf_auto_close=0
let g:ctrlsf_regex_pattern=0

" -----------------------------------------------------
" 4.13 Plug settings
" -----------------------------------------------------
let g:plug_timeout=20

" -----------------------------------------------------
" 4.14 Vim-markdown settings
" -----------------------------------------------------
let g:markdown_fenced_languages=[
      \'bash=sh',
      \'git=gitconfig',
      \'javascript',
      \'lua',
      \'ruby',
      \'tmux',
      \'viml=vim',
      \'xdefaults',
      \'zsh']

" 4.15 Colorizer settings
" -----------------------------------------------------
let g:colorizer_nomap=1

" 4.16 JsDoc settings
" -----------------------------------------------------
let g:jsdoc_allow_input_prompt=1
let g:jsdoc_input_description=1
let g:jsdoc_enable_es6=1

" -----------------------------------------------------
" 4.17 Deoplete-tern settings
" -----------------------------------------------------
" let g:tern_request_timeout=1
" let g:tern_show_signature_in_pum=1

" -----------------------------------------------------
" 4.18 vim-javascript settings
" -----------------------------------------------------
let g:javascript_plugin_jsdoc=1
let g:javascript_plugin_flow=1

" -----------------------------------------------------
" 4.18 vim-javascript settings
" -----------------------------------------------------

" Sets emmet to use JSX despite the javascript file extension
let g:user_emmet_install_global=0
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\  'javascript': {
\      'extends' : 'jsx',
\  },
\}

autocmd FileType html,css,javascript.jsx EmmetInstall

" -----------------------------------------------------
" 4.18 Flow Settings
" -----------------------------------------------------
let g:flow#flowpath=g:kb_flow
let g:flow#enable=0
let g:flow#autoclose=1

" let local_flow = finddir('node_modules', '.;') . '/.bin/flow'
" if matchstr(local_flow, "^\/\\w") == ''
"     let local_flow= getcwd() . "/" . local_flow
" endif
" if executable(local_flow)
"   let g:flow#flowpath = local_flow
" endif

" let g:LanguageClient_loadSettings=0
" let g:LanguageClient_serverCommands = {
"     \ 'javascript': ['flow-language-server', '--flow-path=' . kb_flow, '--stdio', '--no-auto-download'],
"     \ 'javascript.jsx': ['flow-language-server', '--flow-path=' . kb_flow, '--stdio', '--no-auto-download'],
"     \ }

" let g:LanguageClient_rootMarkers = ['.flowconfig']

" " Use fzf as the selection UI
" let g:LanguageClient_selectionUI = 'fzf'
" " This will display a location-list window detailing the issues in the file.
" let g:LanguageClient_diagnosticsList = 'Location'
" let g:LanguageClient_diagnosticsDisplay = {
"     \ '1': { "name": "Error", "texthl": "ALEError", "signText": "❯", "signTexthl": "ALEErrorSign" },
"     \ '2': { "name": "Warning", "texthl": "ALEWarning", "signText": "❯", "signTexthl": "ALEWarningSign" },
"     \ '3': { "name": "Info", "texthl": "ALEInfo", "signText": "ℹ", "signTexthl": "ALEInfoSign" },
"     \ '4': { "name": "Hint", "texthl": "ALEInfo", "signText": "ℹ", "signTexthl": "ALEInfoSign", },
"     \ }

" let g:LanguageClient_loggingLevel = 'INFO'
" let g:LanguageClient_loggingFile = '/tmp/LanguageClient.log'
" let g:LanguageClient_serverStderr = '/tmp/LanguageServer.log'

" -----------------------------------------------------
" 4.19 vim-prettier
" -----------------------------------------------------
let g:prettier#exec_cmd_path=g:kb_prettier
let g:prettier#exec_cmd_async=1
let g:prettier#quickfix_enabled=0
let g:prettier#quickfix_auto_focus=0

" -----------------------------------------------------
" 4.19 ALE
" -----------------------------------------------------

" Set this setting in vimrc if you want to fix files automatically on save.
" This is off by default.
let g:ale_lint_on_text_changed = 'never'
let g:ale_fix_on_save = 1

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_open_list = 0
let g:ale_keep_list_window_open = 0

let g:ale_sign_warning = 'W'
let g:ale_sign_error = 'X'

let g:ale_echo_msg_format='%linter%: [%severity%|%code%] %s'
let g:ale_loclist_msg_format='%linter%: [%severity%|%code%] %s'

highlight link ALEWarningSign String
highlight link ALEErrorSign Title

let g:ale_javascript_prettier_use_local_config = 1

let g:ale_linters = {
\   'javascript': ['eslint', 'flow'],
\}
" Put this in vimrc or a plugin file of your own.
" After this is configured, :ALEFix will try and fix your JS code with ESLint.
let g:ale_fixers = {
\   'javascript': ['eslint', 'prettier'],
\}


" -----------------------------------------------------
" 4.20 (Blaze it) Vim Quickfix
" -----------------------------------------------------
let g:qf_window_bottom = 0
let g:qf_loclist_window_bottom = 0

let g:qf_auto_open_quickfix = 0
let g:qf_auto_open_loclist = 0

let g:qf_auto_quit = 0

" ==================================================
" 5.0 Plugin mappings
" ==================================================

" -----------------------------------------------------
" 5.1 FZF mapings
" -----------------------------------------------------
" Search files
nnoremap <space>f :Files<CR>

" Search between open files - [b]uffers
nnoremap <space>b :Buffers<CR>

" Search Neosnippets
" nnoremap <space>S :NeoSnippetEdit<CR>

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)


autocmd! FileType fzf tnoremap <buffer> <Esc> <C-c>
" -----------------------------------------------------
" 5.2 Neosnippet
" -----------------------------------------------------
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-J> <Plug>(neosnippet_expand_or_jump)
smap <C-J> <Plug>(neosnippet_expand_or_jump)
xmap <C-J> <Plug>(neosnippet_expand_target)

" -----------------------------------------------------
" 5.3 Gitgutter
" -----------------------------------------------------
nnoremap [h :GitGutterPrevHunk<CR>
nnoremap ]h :GitGutterNextHunk<CR>
nnoremap ,hs :GitGutterStageHunk<CR>
nnoremap ,hr :GitGutterRevertHunk<CR>

" -----------------------------------------------------
" 5.4 Expand region
" -----------------------------------------------------
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" -----------------------------------------------------
" 5.5 Vim Markdown
" -----------------------------------------------------
nmap [[ <Plug>Markdown_MoveToPreviousHeader
nmap ]] <Plug>Markdown_MoveToNextHeader

" -----------------------------------------------------
" 5.6 Deoplete autocomplete
" -----------------------------------------------------
" Insert <TAB> or select next match
inoremap <silent> <expr> <Tab> utils#tabComplete()

" Manually trigger tag autocomplete
inoremap <silent> <expr> <C-]> utils#manualTagComplete()

" <C-h>, <BS>: close popup and delete backword char
inoremap <expr><C-h> deolete#mappings#smart_close_popup()."\<C-h>"
inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"

" -----------------------------------------------------
" 5.7 CtrlSF
" -----------------------------------------------------
nnoremap <leader>gg :CtrlSF<Space>
nnoremap <leader>gG :CtrlSFToggle<Space>

" -----------------------------------------------------
" 5.8 Vim-Plug
" -----------------------------------------------------
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>pu :PlugUpdate<CR>
nnoremap <leader>pU :PlugUpgrade<CR>
nnoremap <leader>pc :PlugClean<CR>

" -----------------------------------------------------
" 5.9 Ctrl-SF
" -----------------------------------------------------
let g:ctrlsf_mapping = {
      \ "next"    : "n",
      \ "prev"    : "N",
      \ "quit"    : "q",
      \ "openb"   : "",
      \ "split"   : "s",
      \ "tab"     : "",
      \ "tabb"    : "",
      \ "popen"   : "",
      \ "pquit"   : "",
      \ "loclist" : "",
      \ }

nnoremap <silent> <leader>g :call utils#searchCurrentWordWithAg()<CR>

" -----------------------------------------------------
" 5.10 BufOnly -> [C]lose all
" -----------------------------------------------------
nnoremap <leader>C :Bonly<CR>

" -----------------------------------------------------
" 5.11 Tabularize -> [a]lign
" -----------------------------------------------------
vnoremap <leader>a :Tabularize /

" -----------------------------------------------------
" 5.12 Elm
" -----------------------------------------------------
" Custom Elm-vim keybindings
au FileType elm nmap <leader>em <Plug>(elm-make)
au FileType elm nmap <leader>eb <Plug>(elm-make-main)
au FileType elm nmap <leader>et <Plug>(elm-test)
au FileType elm nmap <leader>ee <Plug>(elm-error-details)
au FileType elm nmap <leader>ed <Plug>(elm-show-docs)
au FileType elm nmap <leader>ew <Plug>(elm-browse-docs)

" -----------------------------------------------------
" 5.13 Flow
" -----------------------------------------------------
nnoremap <leader>fm :call FlowMake
nnoremap <leader>fd :call LanguageClient#textDocument_definition()<CR>
nnoremap <leader>fh :call LanguageClient#textDocument_hover()<CR>

" -----------------------------------------------------
" 5.14 ALE
" -----------------------------------------------------


" -----------------------------------------------------
" 5.14 Vim-Quickfix
" -----------------------------------------------------

" Jump to quickfix/loclist menu
nnoremap <leader>e <Plug>(qf_qf_switch)

" QuickFix navigation
nnoremap [f <Plug>(qf_qf_next)
nnoremap ]f <Plug>(qf_qf_previous)

" Location list navigation
nnoremap [l <Plug>(qf_loc_next)
nnoremap ]l <Plug>(qf_loc_previous)

" Error mnemonic (ALE, Vim-Flow, and Neomake use locatin-list)
nnoremap [e <Plug>(qf_loc_next)
nnoremap ] <Plug>(qf_loc_previous)

" ==================================================
" 6.0 Color and highlighting settings
" ==================================================

" Syntax highlighting
syntax on

" Color scheme
set background=dark
colorscheme base16-railscasts

" This is a fix for vim-jsx mismatching closing tag colors
hi Tag        ctermfg=04
hi xmlTag     ctermfg=04
hi xmlTagName ctermfg=04
hi xmlEndTag  ctermfg=04

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Highlight term cursor differently
highlight TermCursor ctermfg=green guifg=green


" Listchars highlighting
highlight NonText ctermfg=8 guifg=gray
highlight SpecialKey ctermfg=8 guifg=gray

" Remove underline in folded lines
highlight! Folded term=NONE cterm=NONE gui=NONE ctermbg=NONE

" Link highlight groups to improve buftabline colors
highlight! link BufTabLineCurrent Identifier
highlight! link BufTabLineActive Comment
highlight! link BufTabLineHidden Comment
highlight! link BufTabLineFill Comment



" ==================================================
" 7.0 Autocommands
" ==================================================
" autocmd VimEnter * setlocal term=$TERM

" Always move quickfix to the very bottom split
au FileType qf wincmd J

" Keywordprg settings
autocmd FileType vim setlocal keywordprg=:help

" Set *.flow files to be javascript.jsx filetypes
autocmd BufNewFile,BufRead,BufReadPost *.flow set filetype=javascript.jsx

" Turn spellcheck on for markdown files
autocmd BufNewFile,BufRead *.md setlocal spell
autocmd BufNewFile,BufRead *.md setlocal tw=80

" Two space tabs for all file types
autocmd FileType * setlocal tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

" Remove trailing whitespaces automatically before save
autocmd BufWritePre * call utils#stripTrailingWhitespaces()

" Resize splits when the window is resized
" autocmd VimResized * :wincmd =

" Make sure Vim returns to the same line when you reopen a file. Thanks, Amit and Steve Losh.
augroup line_return
  au!
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" Run checktime in buffers, but avoiding the "Command Line" (q:) window
autocmd CursorHold * if getcmdwintype() == '' | checktime | endif

" -----------------------------------------------------
" 7.1 Run linters after save
" -----------------------------------------------------

" npm install -g eslint
" autocmd BufWritePost *.js Neomake eslint
" npm install -g eslint
" autocmd BufWritePost *.jsx Neomake eslint

" Run Prettier on javascript files
" autocmd BufWritePre *.js,*.jsx,*.json PrettierAsync

" npm install -g jsonlint
autocmd BufWritePost *.json Neomake jsonlint
" sudo apt-get install elixir
autocmd BufWritePost *.ex Neomake elixir
" gcc
autocmd BufWritePost *.c Neomake gcc
" apt-get install tidy
autocmd BufWritePost *.html Neomake tidy
" gem install mdl
autocmd BufWritePost *.md Neomake mdl

