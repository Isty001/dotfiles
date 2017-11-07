"========== Plug =============

call plug#begin('~/.vim/plugged')

" Autocomplete
Plug 'Valloric/YouCompleteMe'
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }

"UI
"Plug 'Yggdroot/indentLine'

Plug 'matze/vim-move'

" Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"VimFiler
"Plug 'Shougo/unite.vim'
"Plug 'Shougo/vimproc.vim', {'do' : 'make'}
"Plug 'Shougo/vimfiler.vim'

" NERDTree
Plug 'scrooloose/nerdtree'
"Plug 'Xuyuanp/nerdtree-git-plugin'

" Theme 
"Plug 'josuegaleas/jay'
Plug 'dracula/vim'

" UI
Plug 'qpkorr/vim-bufkill'
Plug 'fholgado/minibufexpl.vim'
Plug 'itchyny/lightline.vim'

"History
Plug 'yegappan/mru'
Plug 'mbbill/undotree'

"Synthax highlight
"Plug 'sheerun/vim-polyglot'

" Editor
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'dkprice/vim-easygrep'

" PHP
Plug 'docteurklein/php-getter-setter.vim'
Plug 'adoy/vim-php-refactoring-toolbox'

" Editor
Plug 'editorconfig/editorconfig-vim'
Plug 'SirVer/ultisnips'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Build & Test
Plug 'janko-m/vim-test'
Plug 'benmills/vimux'

" Notes
Plug 'vimwiki/vimwiki'

" Game
Plug 'johngrib/vim-game-code-break'
Plug 'johngrib/vim-game-snake'

call plug#end()

"========== ColorScheme ====
syntax on
filetype plugin on

set background=dark
colorscheme dracula


"=========== BASIC ==========
silent! so .vimlocal

let mapleader=" "

set nocompatible
set encoding=utf8
set t_Co=256

set history=200

set ttyfast
set lazyredraw
set nocursorline

set hlsearch

set list
set listchars=tab:>-,trail:.,extends:>,precedes:<

set backspace=indent,eol,start

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

"set nu
set norelativenumber

set nowrap
set mouse=a

" Use the system clipboard
set clipboard=unnamedplus

set noswapfile
set directory^=$HOME/.vim/tmp//

set undofile
set undodir=$HOME/.vim/tmp//

"========= Word motion ==============

let g:camelchar = "A-Z0-9.,;:{([`'\""

nnoremap <silent><C-Left> :<C-u>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>
nnoremap <silent><C-Right> :<C-u>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>
inoremap <silent><C-Left> <C-o>:call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>
inoremap <silent><C-Right> <C-o>:call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>
vnoremap <silent><C-Left> :<C-U>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>v`>o
vnoremap <silent><C-Right> <Esc>`>:<C-U>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>v`<o


"========= HightLight selected word ==
set updatetime=10

function! HighlightWordUnderCursor()
    if getline(".")[col(".")-1] !~# '[[:punct:][:blank:]]'
        exec 'match' 'Search' '/\V\<'.expand('<cword>').'\>/'
    else
        match none
    endif
endfunction

autocmd! CursorHold,CursorHoldI * call HighlightWordUnderCursor()

"========== TMUX screen-256 fix ===
if exists('$TMUX')
    set term=screen-256color
    set t_8f=^[[38;2;%lu;%lu;%lum
endif

if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

"========== Lightline ======
let g:lightline = {
      \ 'colorscheme': 'default',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \ },
      \ }

"========== VimFiler / NERDTree =======

if !&diff
"    autocmd VimEnter * VimFilerExplore -split -simple -parent -winwidth=42 -toggle -no-quit
    autocmd vimenter * NERDTree
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

    autocmd VimEnter * wincmd p
endif

nmap <C-g> :NERDTreeFind<CR>


let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_expand_jump_to_first_child = 0
let g:vimfiler_ignore_pattern = []

"nnoremap <Leader>d :<C-u>VimFilerExplorer -split -simple -parent -winwidth=35 -toggle -no-quit<CR>
"nnoremap <Leader>jf :<C-u>VimFilerExplorer -split -simple -parent -winwidth=35 -no-quit -find<CR>

"nmap <C-g> :VimFilerExplorer -find -split -simple -parent -winwidth=42 -toggle -no-quit<CR>

"autocmd FileType vimfiler nunmap <buffer> x
"autocmd FileType vimfiler nmap <buffer> x <Plug>(vimfiler_toggle_mark_current_line)
"autocmd FileType vimfiler vmap <buffer> x <Plug>(vimfiler_toggle_mark_selected_lines)
"autocmd FileType vimfiler nunmap <buffer> l
"autocmd FileType vimfiler nmap <buffer> l <Plug>(vimfiler_cd_or_edit)
"autocmd FileType vimfiler nmap <buffer> h <Plug>(vimfiler_switch_to_parent_directory)
"autocmd FileType vimfiler nmap <buffer> <C-R> <Plug>(vimfiler_redraw_screen)
"autocmd FileType vimfiler nmap <silent><buffer><expr> <CR> vimfiler#smart_cursor_map(
\ "\<Plug>(vimfiler_expand_tree)",
\ "\<Plug>(vimfiler_edit_file)")

" ======== FZF ===========
map <leader>f :Ag<CR>
map <leader>m :FZF<CR>

let s:ag_options = ' --skip-vcs-ignores --path-to-ignore=.vim-ignore'

command! -bang -nargs=* Ag
    \ call fzf#vim#ag(
    \   <q-args>,
    \   s:ag_options,
    \  <bang>0 ? fzf#vim#with_preview('up:60%')
    \        : fzf#vim#with_preview('right:50%:hidden', '?'),
    \   <bang>0
    \ )


"========== MRU ===========
let MRU_Window_Height = 15
let MRU_Max_Menu_Entries = 15
let MRU_Max_Submenu_Entries = 15
let MRU_Auto_Close = 1

"========== UndoTree =======
let g:undotree_WindowLayout = 4

" Tree width
let g:undotree_SplitWidth = 40

" Diff height
let g:undotree_DiffpanelHeight = 20

nnoremap <C-h> :UndotreeToggle<cr>

"========== Vim-Test ========
let test#strategy = "vimux"

nmap <silent> <C-n> :TestNearest<CR>
nmap <silent> <C-t> :TestFile<CR>
"nmap <silent> <C-a> :TestSuite<CR>
nmap <silent> <C-x> :TestLast<CR>
"nmap <silent> <leader>g :TestVisit<CR>

"========== Search ==========
set wildmenu 
set wildmode=longest:full,full

"========== YCM ============
set completeopt-=preview
let g:ycm_autoclose_preview_window_after_insertion = 1

"========== Mini Buff Expl =====
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1 

nmap <Tab> :bn<CR>
nmap <S-Tab> :bp<CR>

"========== VimWiki ======

let wiki = {}
let wiki.path = '~/vimwiki/'
let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'c': 'c', 'php': 'php', 'json': 'json'}
let g:vimwiki_list = [wiki]

"========== Keymap ========
" Switch Window 
nnoremap <C-w>Left <C-w>h
nnoremap <C-w>Down <C-w>j
nnoremap <C-w>Up <C-w>k
nnoremap <C-w>Right <C-w>l

nnoremap <C-c> :BD<CR>

let g:move_key_modifier = 'C'
