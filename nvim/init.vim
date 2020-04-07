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

let kb_flow=$HOME."/go/src/github.com/keybase/client/shared/node_modules/.bin/flow"
let kb_prettier=$HOME."/go/src/github.com/keybase/client/shared/node_modules/.bin/prettier"

" ==================================================
" 1.0 Plug List
" ==================================================

" --------------------------------------------------
" 1.1 General tools - linters, formatting, etc.
" --------------------------------------------------

" Better quickfix/locationlist bindings
Plug 'romainl/vim-qf'
" Async maker for different file types
Plug 'benekastah/neomake', { 'on': ['Neomake'] }
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
" Autocomplete COC (Conquerer of Completion)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" --------------------------------------------------
" 1.2 JavaScript
" --------------------------------------------------
" Moder JS support (indent, syntax, etc)
Plug 'pangloss/vim-javascript'

" JSX syntax
" This repository does not seem to support the newest JSX syntax
" So I decided to follow the suggestion of a member of the OSS community and
" use his package instead
"   source: https://github.com/mxw/vim-jsx/issues/152#issuecomment-466856462
"   new package: https://github.com/amadeus/vim-jsx
Plug 'mxw/vim-jsx', { 'for': ['jsx', 'javascript.jsx'] }

" Typescript syntax highlighting
Plug 'leafgarland/typescript-vim'
"" This syntax highlighter also handles the react fragments syntax as well
Plug 'peitalin/vim-jsx-typescript'
"JSON syntax
Plug 'sheerun/vim-json'
" JSON5 syntax
Plug 'GutenYe/json5.vim'

" --------------------------------------------------
" 1.2.1 Elm
" --------------------------------------------------
Plug 'elmcast/elm-vim'

" --------------------------------------------------
" 1.2.1 Coffee Script
" --------------------------------------------------
Plug 'kchmck/vim-coffee-script'

" --------------------------------------------------
" 1.3 HTML/CSS
" --------------------------------------------------

" HTML5 syntax
Plug 'othree/html5.vim'
" Emmett HTML completion
" Plug 'mattn/emmet-vim', { 'for': ['javascript.jsx', 'html', 'css'] }
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
" Ruby end completion
" Plug 'tpope/vim-endwise'
" Yaml indentation
Plug 'martin-svk/vim-yaml'
" Markdown syntax
Plug 'tpope/vim-markdown'
" Git syntax
Plug 'tpope/vim-git'
" Git Blame (virtualtext support)
Plug 'tveskag/nvim-blame-line'
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
" Vim Maximizer will make the current window 'fullscreen'
Plug 'szw/vim-maximizer'

call plug#end()

" ==================================================
" 2.0 Basic settings
"   (Neovim defaults: https://neovim.io/doc/user/vim_diff.html
"   #nvim-option-defaults)
" ==================================================

set shell=/bin/zsh                          " Setting shell to zsh
set number norelativenumber                 " Just absolute numbers
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
set nolazyredraw                            " Don't redraw while executing macros (better performance)

set showmatch                               " Show matching brackets when text indicator is over them
set matchtime=2                             " How many tenths of a second to blink when matching brackets
set nostartofline                           " Prevent cursor from moving to beginning of line when switching buffers
set virtualedit=block                       " To be able to select past EOL in visual block mode
set nojoinspaces                            " No extra space when joining a line which ends with . ? !
set scrolloff=5                             " Scroll when closing to top or bottom of the screen
set updatetime=300                          " Update time used to create swap file or other things
set suffixesadd+=.js,.rb                    " Add js and ruby files to suffixes
set cursorline                              " Highlight the active line but only style the line number highlight
set shortmess+=c                            " From COC: don't give |ins-completion-menu| messages.
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

" Creates a special virtualenvironment for neovim so packages do not need to
" be reinstalled in each new virtual environment
let g:python3_host_prog=$HOME."/.pyenv/versions/neovim_python_venv/bin/python"

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
" Source (reload configuration)
nnoremap <silent> <F5> :source $MYNVIMRC<CR>

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

nnoremap <silent> <C-w>z :MaximizerToggle<CR>
inoremap <silent> <C-w>z :MaximizerToggle<CR>

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
let $FZF_DEFAULT_OPTS='--layout=reverse'

" Original measurements
" https://kassioborges.dev/2019/04/10/neovim-fzf-with-a-floating-window.html
"
" Borders
" https://github.com/neovim/neovim/issues/9718#issuecomment-546603628
function! FloatingFZF(border)
  let height = &lines - 3
  let width = float2nr(&columns - (&columns * 2 / 6))
  let col = float2nr((&columns - width) / 2)
  let top = ((&lines - height) / 2) - 1
  let left = (&columns - width) / 2
  let opts = {
        \ 'relative': 'editor',
        \ 'row': top,
        \ 'col': left,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }
  if a:border == v:true
    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Normal
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    au BufWipeout <buffer> exe 'bw '.s:buf
  else
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
  endif
endfunction

" Tell fzf to layout upside down
let g:fzf_layout = { 'window': 'call FloatingFZF(v:true)' }

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

	function! CocDiagnosticStatus() abort
	  let info = get(b:, 'coc_diagnostic_info', {})
	  if empty(info) | return '' | endif
	  let msgs = []
	  if get(info, 'error', 0)
	    call add(msgs, 'E' . info['error'])
	  endif
	  if get(info, 'warning', 0)
	    call add(msgs, 'W' . info['warning'])
	  endif
	  return join(msgs, ' ') . ' ' . get(g:, 'coc_status', '')
	endfunction

let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'tab': {
      \   'active': [ 'filename' ],
      \   'inactive': [ 'filename' ]
      \ },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename' ], [ 'session' ],  ['cocstatus' ] ],
      \   'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'filetype', 'fileencoding' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"HELP":&readonly?"RO":""}'
      \ },
      \ 'component_function': {
      \   'mode': 'utils#lightLineMode',
      \   'filename': 'utils#lightLineFilename',
      \   'fileencoding': 'utils#lightLineFileencoding',
      \   'cocstatus': 'coc#status',
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

" Use auocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" Changes the lightline middle color for the active buffer
" This helps a lot with finding out which split is active
" Howver it's confusing as to which 256 color is magenta (the one set in alacritty.yaml)
let s:palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
" Active buffer gets yellow middle bar color
let s:palette.normal.middle = [ [ "#30302c", "#fad07a", 236, 222 ] ]
" Inctive buffers get usual middle bar color
let s:palette.inactive.middle = [ [ "#30302c", "#30302c", 236, 236 ] ]

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
" 4.12 Plug settings
" -----------------------------------------------------
let g:plug_timeout=20

" -----------------------------------------------------
" 4.13 Vim-markdown settings
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

" -----------------------------------------------------
" 4.14 Colorizer settings
" -----------------------------------------------------
let g:colorizer_nomap=1

" -----------------------------------------------------
" 4.15 JsDoc settings
" -----------------------------------------------------
let g:jsdoc_allow_input_prompt=1
let g:jsdoc_input_description=1
let g:jsdoc_enable_es6=1

" -----------------------------------------------------
" 4.16 Deoplete-tern settings
" -----------------------------------------------------
" let g:tern_request_timeout=1
" let g:tern_show_signature_in_pum=1

" -----------------------------------------------------
" 4.17 vim-javascript settings
" -----------------------------------------------------
" Syntax highlighting
let g:javascript_plugin_jsdoc=1
let g:javascript_plugin_flow=1

" -----------------------------------------------------
" 4.18 COC Extensions
" -----------------------------------------------------
let g:coc_global_extensions = [
      \ 'coc-tsserver',
      \ 'coc-eslint',
      \ 'coc-prettier',
      \ 'coc-json',
      \ 'coc-css',
      \ 'coc-html',
      \ 'coc-markdownlint',
      \ 'coc-git',
      \ 'coc-dictionary',
      \ 'coc-word',
      \ ]

" -----------------------------------------------------
" 4.19 Vim Quickfix
" -----------------------------------------------------
let g:qf_window_bottom = 0
let g:qf_loclist_window_bottom = 0

let g:qf_auto_open_quickfix = 0
let g:qf_auto_open_loclist = 0

let g:qf_auto_quit = 0

" -----------------------------------------------------
" 4.20 Closetag
" -----------------------------------------------------
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.jsx,*.tsx'

" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx'

" These are the file types where this plugin is enabled.
let g:closetag_filetypes = 'html,jsx,tsx,typescript.tsx'

" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filetypes = 'xhtml,jsx,typescript.tsx,tsx'

" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 1

" Disables auto-close if not in a "valid" region (based on filetype)
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
" let g:closetag_close_shortcut = '<leader>>'

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
nmap <space><tab> <plug>(fzf-maps-n)
xmap <space><tab> <plug>(fzf-maps-x)
omap <space><tab> <plug>(fzf-maps-o)


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
" 5.8 Vim-Plug
" -----------------------------------------------------
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>pu :PlugUpdate<CR>
nnoremap <leader>pU :PlugUpgrade<CR>
nnoremap <leader>pc :PlugClean<CR>
" -----------------------------------------------------
" 5.6 COC VIM
" -----------------------------------------------------
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call CocActionAsync("doHover")<CR>

" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
" nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

" augroup mygroup
"   autocmd!
"   " Setup formatexpr specified filetype(s).
"   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"   " Update signature help on jump placeholder
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
" nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
" nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
" xmap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap if <Plug>(coc-funcobj-i)
" omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <C-d> <Plug>(coc-range-select)
" xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Jump to quickfix/loclist menu
" nnoremap <leader>e <Plug>(qf_qf_switch)

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

" This is to set OperatorMono font italics on html arguments and comments
" Source: https://github.com/jwilm/alacritty/issues/489#issuecomment-288074579
highlight Comment cterm=italic term=italic gui=italic
highlight htmlArg cterm=italic term=italic gui=italic
highlight xmlAttrib cterm=italic term=italic gui=italic

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

" Comment syntax in JSONC files (coc-settings)
autocmd FileType json syntax match Comment +\/\/.\+$+

" Format and import on save of go files using COC
" autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
" Set *.tsx files to be tsx filetype
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
" Set *.iced to be coffeescript filetype
autocmd BufNewFile,BufRead *.iced set filetype=coffee

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
" sudo apt-get install elixir
autocmd BufWritePost *.ex Neomake elixir
" gcc
autocmd BufWritePost *.c Neomake gcc
" apt-get install tidy
autocmd BufWritePost *.html Neomake tidy
" gem install mdl
autocmd BufWritePost *.md Neomake mdl
