"========== Plug =============
call plug#begin('~/.vim/plugged')

" Lint
Plug 'w0rp/ale' "ALE must be loaded before YCM in order not to screw with the completion

" Autocomplete, tags
Plug 'Valloric/YouCompleteMe', {'do': './install.py --clang-completer'}
"Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
Plug 'Isty001/phpcd.vim', { 'for': 'php', 'do': 'composer install' }

"Plug 'ludovicchabant/vim-gutentags'
"Plug 'shawncplus/phpcomplete.vim'

" Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" NERDTree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Color
Plug 'dracula/vim'
Plug 'dsalychev/firesparks'
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }

" UI
Plug 'qpkorr/vim-bufkill'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"History
Plug 'yegappan/mru'
Plug 'mbbill/undotree'

" Editor
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/vim-auto-save'
Plug 'dkprice/vim-easygrep'
Plug 'matze/vim-move'
Plug 'thiagoalessio/rainbow_levels.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'machakann/vim-highlightedyank'
Plug 'chaoren/vim-wordmotion'

" PHP
Plug 'docteurklein/php-getter-setter.vim'
Plug 'adoy/vim-php-refactoring-toolbox'
Plug 'arnaud-lb/vim-php-namespace'

Plug 'tobyS/vmustache'
Plug 'tobyS/pdv'

"Ruby
Plug 'vim-ruby/vim-ruby'

" Git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'iberianpig/tig-explorer.vim'
Plug 'kablamo/vim-git-log'
Plug 'sodapopcan/vim-twiggy'

" Build & Test
Plug 'janko-m/vim-test'
Plug 'benmills/vimux'

" Notes
Plug 'vimwiki/vimwiki'

" Game
Plug 'johngrib/vim-game-code-break'
Plug 'johngrib/vim-game-snake'

call plug#end()


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

let mapleader = "\<Space>"

" Delete word after cursor
imap <C-b> <C-[>diwi

" == Search
nmap <leader>g :NERDTreeFind<CR><C-w>l<CR>
map <leader>f :FZF<CR>
map <leader>a :Ag<CR>

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

" == Test runner
nmap <silent> <C-n> :TestNearest<CR>
nmap <silent> <C-x> :TestFile<CR>
nmap <silent> <C-t> :TestLast<CR>
"nmap <silent> <C-a> :TestSuite<CR>
"nmap <silent> <leader>g :TestVisit<CR>

" == History
nnoremap <leader>h :UndotreeToggle<cr>

" == Indentation highlight
map <leader>l :RainbowLevelsToggle<cr>

" == Navigation between symbols
autocmd FileType *c* nnoremap <buffer> <C-y> :YcmCompleter GoTo<CR>

" == Navigation in popup menu
inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "j"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "k"

" == Use PHP class under cursor
autocmd FileType php inoremap <leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <leader>u :call PhpInsertUse()<CR>

" == PHP doc
nnoremap <leader>pd :call pdv#DocumentWithSnip()<CR>

" == Snippets
let g:UltiSnipsExpandTrigger="<C-d>"

" == Git
nnoremap <Leader>t :TigOpenCurrentFile<CR>

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

set background=dark

color challenger_deep

" ==================
" == VIM SETTINGS ==
" ==================

" == Project settings
silent! so .vimlocal

set nocompatible
set encoding=utf8

set history=600

set ttyfast
set nocursorline

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
set norelativenumber

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

 " ==============
" == AutoSave ==
" ==============

let g:auto_save = 1
let g:auto_save_in_insert_mode = 0


" ==================================
" == Hightlight word under cursor ==
" ==================================

set updatetime=10

function! HighlightWordUnderCursor()
    if bufname("%") !~ '^NERD' && getline(".")[col(".")-1] !~# '[[:punct:][:blank:]]'
        exec 'match' 'Search' '/\V\<'.expand('<cword>').'\>/'
    else
        match none
    endif
endfunction

autocmd! CursorHold,CursorHoldI * call HighlightWordUnderCursor()


" =========
" == PHP ==
" =========

function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a', 'n')
endfunction


let g:php_namespace_sort_after_insert = 1

" == Doc generation
let g:pdv_template_dir = $HOME ."/.vim/plugged/pdv/templates_snip"

" ==========
" == Ruby ==
" ==========
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" ====================
" == Tag generation ==
" ====================

let g:gutentags_project_root = ['src']
let g:gutentags_cache_dir = "~/.cache/tags"


" =============
" == Tabline ==
" =============

let g:airline#extensions#tabline#enabled = 1


" ==============
" == NERDTree ==
" ==============

let NERDTreeShowHidden=1
let g:NERDTreeWinSize=35

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

command! -bang -nargs=* Ag
    \ call fzf#vim#ag(
    \   <q-args>,
    \   s:ag_options,
    \  <bang>0 ? fzf#vim#with_preview('up:60%')
    \        : fzf#vim#with_preview('right:50%:hidden', '?'),
    \   <bang>0
    \ )


let g:EasyGrepRecursive=1

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


" ==========
" == Test ==
" ==========

let test#strategy = "vimux"


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

