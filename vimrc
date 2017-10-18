"========== Plug =============

call plug#begin('~/.vim/plugged')

" Autocomplete
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }

"UI
Plug 'Yggdroot/indentLine'

call plug#end()

"=========== VUNDLE ==========

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'
Plugin 'matze/vim-move'

Plugin 'mileszs/ack.vim'

"VimFiler
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimfiler.vim'

" Theme 
Plugin 'josuegaleas/jay'

" UI
Plugin 'qpkorr/vim-bufkill'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'majutsushi/tagbar'
Plugin 'itchyny/lightline.vim'

"History
Plugin 'yegappan/mru'
Plugin 'mbbill/undotree'

"Synthax highlight
Plugin 'sheerun/vim-polyglot'

" Code
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/dbext.vim'

" Editor
Plugin 'editorconfig/editorconfig-vim'
Plugin 'SirVer/ultisnips'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

Plugin 'vim-scripts/vim-auto-save'

" Build & Test
Plugin 'janko-m/vim-test'
Plugin 'tpope/vim-dispatch'
Plugin 'reinh/vim-makegreen'
Plugin 'benmills/vimux'


call vundle#end()
filetype plugin indent on

"========== ColorScheme ====
syntax on

set background=dark
colorscheme jay


"=========== BASIC ==========
silent! so .vimlocal

set encoding=utf8

set t_Co=256

set hlsearch

set list
set listchars=tab:>-,trail:.,extends:>,precedes:<

set backspace=indent,eol,start

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set nu
set nowrap
set mouse=a

" Use the system clipboard
set clipboard=unnamedplus

let g:auto_save = 1

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

"========= ACK/AG ==============
let g:ackprg = 'ag --skip-vcs-ignores --path-to-ignore=./.vim-ignore'

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
      \ 'colorscheme': 'jay',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \ },
      \ }

"========== Tagbar ==========
if !&diff 
    "autocmd VimEnter * TagbarOpen
endif

"========== VimFiler =======
if !&diff
    autocmd VimEnter * VimFilerExplore -split -simple -parent -winwidth=42 -toggle -no-quit
    autocmd VimEnter * wincmd p
endif

set nocompatible
let mapleader=" "
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_expand_jump_to_first_child = 0
let g:vimfiler_ignore_pattern = []

"nnoremap <Leader>d :<C-u>VimFilerExplorer -split -simple -parent -winwidth=35 -toggle -no-quit<CR>
"nnoremap <Leader>jf :<C-u>VimFilerExplorer -split -simple -parent -winwidth=35 -no-quit -find<CR>

nmap <C-g> :VimFilerExplorer -find -split -simple -parent -winwidth=42 -toggle -no-quit<CR>

autocmd FileType vimfiler nunmap <buffer> x
autocmd FileType vimfiler nmap <buffer> x <Plug>(vimfiler_toggle_mark_current_line)
autocmd FileType vimfiler vmap <buffer> x <Plug>(vimfiler_toggle_mark_selected_lines)
autocmd FileType vimfiler nunmap <buffer> l
autocmd FileType vimfiler nmap <buffer> l <Plug>(vimfiler_cd_or_edit)
autocmd FileType vimfiler nmap <buffer> h <Plug>(vimfiler_switch_to_parent_directory)
autocmd FileType vimfiler nmap <buffer> <C-R> <Plug>(vimfiler_redraw_screen)
autocmd FileType vimfiler nmap <silent><buffer><expr> <CR> vimfiler#smart_cursor_map(
\ "\<Plug>(vimfiler_expand_tree)",
\ "\<Plug>(vimfiler_edit_file)")

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

"========== Keymap ========
" Switch Window 
nnoremap <C-w>Left <C-w>h
nnoremap <C-w>Down <C-w>j
nnoremap <C-w>Up <C-w>k
nnoremap <C-w>Right <C-w>l

nnoremap <C-c> :BD<CR>

let g:move_key_modifier = 'C'
