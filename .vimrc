let mapleader = "\<Space>"


"========== Plug =============
call plug#begin('~/.vim/plugged')

" ---
"ALE must be loaded before YCM in order not to screw with the completion

Plug 'Isty001/ale'

" YCM will handle this very well
autocmd FileType c,cpp :ALEDisable

" ---

" Autocomplete
Plug 'Valloric/YouCompleteMe', {'do': './install.py --clang-completer'}
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
" Plug 'Isty001/phpcd.vim', { 'for': 'php', 'do': 'composer install' }

" Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" NERDTree
Plug 'scrooloose/nerdtree'

" Color
Plug 'kaicataldo/material.vim'
Plug 'whatyouhide/vim-gotham'
Plug 'connorholyday/vim-snazzy'

" Tags
Plug 'ludovicchabant/vim-gutentags'

" UI
Plug 'qpkorr/vim-bufkill'
Plug 'vim-airline/vim-airline'

"History
Plug 'yegappan/mru'
Plug 'mbbill/undotree'

" Editor
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'machakann/vim-sandwich'

" ---

Plug 'vim-scripts/vim-auto-save'

let g:auto_save = 1
let g:auto_save_in_insert_mode = 0

" ---

Plug 'dkprice/vim-easygrep'
Plug 'matze/vim-move'
Plug 'thiagoalessio/rainbow_levels.vim'
Plug 'editorconfig/editorconfig-vim'

" ---

Plug 'RRethy/vim-illuminate'

hi link illuminatedWord Visual
let g:Illuminate_delay = 100

" ---

Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

let g:UltiSnipsExpandTrigger="<C-a>"
let g:UltiSnipsSnippetsDir = "~/.vim/ulti-snips"
let g:UltiSnipsJumpForwardTrigger="<C-l>"
let g:UltiSnipsJumpBackwardTrigger="<C-h>"


Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'
Plug 'rhysd/clever-f.vim'
Plug 'romainl/vim-cool' " Disables highlight after finishing search
Plug 'tpope/vim-endwise'

" ---

Plug 'alvan/vim-closetag'

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.php.html,*.xml'

autocmd BufNewFile,BufRead *.html.php set ft=php.html

" ---

Plug 'tpope/vim-abolish'
Plug 'google/vim-searchindex'

" ---

" Plug 'itchyny/calendar.vim'

let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

" ---

" PHP
Plug 'docteurklein/php-getter-setter.vim', {'for': 'php'}
Plug 'adoy/vim-php-refactoring-toolbox', {'for': 'php'}
Plug 'beberlei/vim-php-refactor', {'for': 'php'}
Plug 'arnaud-lb/vim-php-namespace', {'for': 'php'}

" Ruby
Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}
" Plug 'Isty001/vim-ruby', {'for': 'ruby'}

" Git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" HBS
Plug 'joukevandermaas/vim-ember-hbs'

" Build & Test
" ---
Plug 'benmills/vimux'

map <leader>x :VimuxRunLastCommand<cr>
autocmd FileType c,cpp map <C-x> :call VimuxRunCommand("make test")<CR>

" ---

Plug 'janko-m/vim-test'

let test#strategy = "vimux"


nmap <silent> <C-n> :TestNearest<CR>
nmap <silent> <C-x> :TestFile<CR>
nmap <silent> <C-t> :TestLast<CR>

" ---


" Game
Plug 'johngrib/vim-game-code-break'
Plug 'johngrib/vim-game-snake'
Plug 'uguu-org/vim-matrix-screensaver'
Plug 'vim-scripts/TeTrIs.vim'

" Lang
" Plug 'sheerun/vim-polyglot'

call plug#end()

let g:comfortable_motion_friction = 0.0
let g:comfortable_motion_air_drag = 4.0


"===========
" == Lint ==
" ==========

let g:ycm_filter_diagnostics = {
  \ "c": {
  \      "regex": [
  \         "function definition is not allowed here",
  \         "use of undeclared identifier '__fn__'",
  \        "operand of type 'void'"
  \      ],
  \    }
  \ }

" ============
" == Keymap ==
" ============


" == Delete newxt word
imap <C-b> <C-[>dvb

" == Search
nmap <leader>g :NERDTreeFind<CR><C-w>l<CR>
map <leader>f :FZF<CR>
map <leader>a :Ag<CR>
vnoremap // y/<C-R>"<CR>

" == Windows
nnoremap <C-c> :BD<CR>

map <C-h> <C-W>h
map <C-l> <C-W>l

" == Line/Selection moving
let g:move_key_modifier = 'C'

" == Navigate between tabs
nmap <Tab> :bn<CR>
nmap <S-Tab> :bp<CR>

" == Indent in viusal mode, reselect text
vnoremap < <gv
vnoremap > >gv

" == History
nnoremap <leader>h :UndotreeToggle<cr>

" == Indentation highlight
map <leader>l :RainbowLevelsToggle<cr>

" == Navigation between symbols
autocmd FileType *c* nnoremap <buffer> <C-y> :YcmCompleter GoToDeclaration<CR>
" autocmd FileType *c* nnoremap <buffer> <C-]> :YcmCompleter GoToDefinition<CR>

" == Navigation in popup menu
inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "j"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "k"

" == Use PHP class under cursor
autocmd FileType php inoremap <C-p> <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <C-p> :call PhpInsertUse()<CR>

" Always delete to black hole
nnoremap d "_d
vnoremap d "_d

" Navigate in command mode
cnoremap <C-K> <Up>
cnoremap <C-J> <Down>

nnoremap <leader>r :ALEFix<CR>

let g:ale_fixers = {
\   'php': ['php_cs_fixer'],
\}

let g:ale_sign_column_always=1

" == Snippets
" ==========
" == TMUX ==
" ==========

if exists('$TMUX')
    set term=screen-256color
    set t_8f=^[[38;2;%lu;%lu;%lum
    set t_8b=^[[48;2;%lu;%lu;%lum
endif

if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"

    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif


" =================
" == ColorScheme ==
" =================

syntax on
filetype plugin indent on

set termguicolors
set t_Co=256

" set background=dark

let ayucolor="dark"
" color material
color snazzy

if g:colors_name == "snazzy"
    highlight Normal guibg=#180C26
endif

" ==================
" == VIM SETTINGS ==
" ==================


set nocompatible
set encoding=utf8
set ignorecase
set history=600

set ttyfast

autocmd BufNewFile,BufRead *.html.php   set ft=php

"This makes the autocomplete dropdown flashing and slowish :-(
"set lazyredraw

set hlsearch

set list
set listchars=tab:>-,trail:.,extends:>,precedes:<
set backspace=indent,eol,start

" == Default indent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab


set nu
set relativenumber
set cursorline

set nofoldenable

set nowrap
set mouse=a

set nrformats+=alpha

" == Use the system clipboard
set clipboard=unnamedplus

" == Working dir of Vim files
set noswapfile
set directory^=$HOME/.vim/tmp//

set undofile
set undodir=$HOME/.vim/tmp//


" =========
" == PHP ==
" =========

function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a', 'n')
endfunction

autocmd FileType php nnoremap <silent><leader>pcf :call PhpCsFixerFixFile()<CR>

let g:php_namespace_sort_after_insert = 1

" == Doc generation
let g:pdv_template_dir = $HOME ."/.vim/plugged/pdv/templates_snip"

" ==========
" == Ruby ==
" ==========
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby set ai sw=2 sts=2 et


" ====================
" == Tag generation ==
" ====================

"let g:gutentags_project_root = ['src']
let g:gutentags_cache_dir = "~/.cache/tags"
let g:gutentags_ctags_executable_php = "ctags -R --fields=+aimlS --languages=php --PHP-kinds=+cfit-va"

set statusline+=%{gutentags#statusline()}

" =============
" == Tabline ==
" =============

let g:airline#extensions#tabline#enabled = 1


" ==============
" == NERDTree ==
" ==============

let NERDTreeShowHidden=1
let g:NERDTreeWinSize=40

if !&diff
    autocmd vimenter * NERDTree
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

    autocmd VimEnter * wincmd p
endif


" ===================
" == Search FZF/AG ==
" ===================

let s:ag_options = ' --skip-vcs-ignores --path-to-ignore=.vim-ignore'
let $FZF_DEFAULT_COMMAND = 'ag -g ""' . s:ag_options

function! s:ag_with_opts(arg, bang)
  let tokens  = split(a:arg)
  let ag_opts = join(filter(copy(tokens), 'v:val =~ "^-"')) . ' --skip-vcs-ignores --path-to-ignore=.vim-ignore --color --color-path="0;38;5;24" --color-line-number="0" --color-match="1;33"'
  let query   = join(filter(copy(tokens), 'v:val !~ "^-"'))
  call fzf#vim#ag(query, ag_opts, a:bang ? {} : {'down': '40%'})
endfunction

autocmd VimEnter * command! -nargs=* -bang Ag call s:ag_with_opts(<q-args>, <bang>0)

" FZF colors
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Replace
let g:EasyGrepRecursive=1
autocmd vimenter * silent! GrepProgram ag

" =========
" == MRU ==
" =========

let MRU_Window_Height = 15
let MRU_Max_Menu_Entries = 15
let MRU_Max_Submenu_Entries = 15
let MRU_Auto_Close = 1


" ==============
" == UndoTree ==
" ==============

let g:undotree_WindowLayout = 4

" == Width
let g:undotree_SplitWidth = 40

" == Height
let g:undotree_DiffpanelHeight = 20



" =========
" == YCM ==
" =========

set completeopt-=preview
let g:ycm_autoclose_preview_window_after_insertion = 1


" =============
" == VimWiki ==
" =============

let wiki = {}
let wiki.path = '~/vimwiki/'
let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'c': 'c', 'php': 'php', 'json': 'json'}
let g:vimwiki_list = [wiki]


" ================
" == Swap words ==
" ================

" :call SwapWords({'foo':'bar'})
"
" If any of the words contains a /, a delimiter is required as 2nd parameter:
" :call SwapWords({'foo/bar':'foo/baz'}, '@')

" https://stackoverflow.com/questions/3578549/easiest-way-to-swap-occurrences-of-two-strings-in-vim

function! Mirror(dict)
    for [key, value] in items(a:dict)
        let a:dict[value] = key
    endfor
    return a:dict
endfunction

function! S(number)
    return submatch(a:number)
endfunction

function! SwapWords(dict, ...)
    let words = keys(a:dict) + values(a:dict)
    let words = map(words, 'escape(v:val, "|")')
    if(a:0 == 1)
        let delimiter = a:1
    else
        let delimiter = '/'
    endif
    let pattern = '\v(' . join(words, '|') . ')'
    exe '%s' . delimiter . pattern . delimiter
        \ . '\=' . string(Mirror(a:dict)) . '[S(0)]'
        \ . delimiter . 'g'
endfunction

" Project settings
silent! so .vimlocal

