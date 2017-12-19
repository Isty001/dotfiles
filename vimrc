"========== Plug =============

call plug#begin('~/.vim/plugged')


" Lint
Plug 'w0rp/ale' "ALE must be loaded before YCM in order not to screw with the completion

" Autocomplete, tags
Plug 'Valloric/YouCompleteMe', {'do': './install.py --clang-completer'}
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
Plug 'ludovicchabant/vim-gutentags'
"Plug 'shawncplus/phpcomplete.vim'

" Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" NERDTree
Plug 'scrooloose/nerdtree'

" Color
Plug 'dracula/vim'

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

" PHP
Plug 'docteurklein/php-getter-setter.vim'
Plug 'adoy/vim-php-refactoring-toolbox'
Plug 'arnaud-lb/vim-php-namespace'

Plug 'tobyS/vmustache'
Plug 'tobyS/pdv'

" Editor
Plug 'editorconfig/editorconfig-vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'kablamo/vim-git-log'

" Build & Test
Plug 'janko-m/vim-test'
Plug 'benmills/vimux'

" Notes
Plug 'vimwiki/vimwiki'

" Game
Plug 'johngrib/vim-game-code-break'
Plug 'johngrib/vim-game-snake'

call plug#end()


" ============
" == Keymap ==
" ============

let mapleader=" "

" == Search
nmap <C-g> :NERDTreeFind<CR><C-W>Right<CR>
map <Leader>m :FZF<CR>

" == Windows
nnoremap <C-w>Left <C-w>h
nnoremap <C-w>Down <C-w>j
nnoremap <C-w>Up <C-w>k
nnoremap <C-w>Right <C-w>l

nnoremap <C-c> :BD<CR>

" == Line moving
let g:move_key_modifier = 'C'

" == Word motion
let g:camelchar = "A-Z0-9.,;:{([`'\""

nnoremap <silent><C-Left> :<C-u>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>
nnoremap <silent><C-Right> :<C-u>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>
inoremap <silent><C-Left> <C-o>:call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>
inoremap <silent><C-Right> <C-o>:call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>
vnoremap <silent><C-Left> :<C-U>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>v`>o
vnoremap <silent><C-Right> <Esc>`>:<C-U>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>v`<o

" ==Navigate between tabs
nmap <Tab> :bn<CR>
nmap <S-Tab> :bp<CR>

" == Test runner
nmap <silent> <C-n> :TestNearest<CR>
nmap <silent> <C-x> :TestFile<CR>
nmap <silent> <C-t> :TestLast<CR>
"nmap <silent> <C-a> :TestSuite<CR>
"nmap <silent> <leader>g :TestVisit<CR>

" == History
nnoremap <C-h> :UndotreeToggle<cr>

" == Indentation highlight
map <leader>l :RainbowLevelsToggle<cr>

" == Navigation
autocmd FileType *c* nnoremap <buffer> <C-]> :YcmCompleter GoTo<CR>

" == Use PHP class under cursor
autocmd FileType php inoremap <C-u> <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <C-u> :call PhpInsertUse()<CR>

" == PHP doc
nnoremap <buffer> <leader>d :call pdv#DocumentWithSnip()<CR>


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
endif


" =================
" == ColorScheme ==
" =================

syntax on
filetype plugin indent on

set background=dark
colorscheme dracula


" ==================
" == VIM SETTINGS ==
" ==================

" == Project settings
silent! so .vimlocal

set nocompatible
set encoding=utf8
set t_Co=256

set history=300

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

