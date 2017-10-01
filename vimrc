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

"NERDTree
"Plugin 'scrooloose/nerdtree'
"Plugin 'Xuyuanp/nerdtree-git-plugin'

"VimFiler
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimfiler.vim'

" UI
Plugin 'dracula/vim'
Plugin 'qpkorr/vim-bufkill'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'majutsushi/tagbar'
Plugin 'itchyny/lightline.vim'

Plugin 'Raimondi/delimitMate'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

Plugin 'vim-scripts/vim-auto-save'

call vundle#end()            " required
filetype plugin indent on


"=========== BASIC ==========
syntax on

set list
set listchars=tab:>-,trail:.,extends:>,precedes:<

color dracula
set backspace=indent,eol,start

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set nu
set mouse=a

"let g:auto_save = 1
set directory^=$HOME/.vim/tmp//

set undofile
set undodir=$HOME/.vim/tmp//

"========== Lightline ======
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \ },
      \ }

"========== Tagbar ==========
autocmd VimEnter * TagbarOpen

"========== VimFiler =======
autocmd VimEnter * VimFilerExplorer
autocmd VimEnter * wincmd p

set nocompatible
let mapleader=" "
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_expand_jump_to_first_child = 0
let g:vimfiler_ignore_pattern = []

nnoremap <Leader>d :<C-u>VimFilerExplorer -split -simple -parent -winwidth=35 -toggle -no-quit<CR>
nnoremap <Leader>jf :<C-u>VimFilerExplorer -split -simple -parent -winwidth=35 -no-quit -find<CR>

nmap <C-g> :VimFilerExplorer -find<CR>

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


"========== NERDTree ========
" Jump to the main window.
"autocmd vimenter * NERDTree
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"let NERDTreeShowHidden=1

" Open current file in NERDTree
" Check if NERDTree is open or active
"function! IsNERDTreeOpen()
""  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
"endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
"function! SyncTree()
""  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
""    NERDTreeFind
""    wincmd p
""  endif
"endfunction

"nmap <C-n> :NERDTreeFind<CR>

" Highlight currently open buffer in NERDTree
"autocmd VimEnter * call SyncTree()
"autocmd BufEnter * call SyncTree()

"========== Search ==========
set wildmenu 
set wildmode=list:full

"========== YCM ============
set completeopt-=preview

"========== Mini Buff Expl =====
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1 

nmap <Tab> :bn<CR>
nmap <S-Tab> :bp<CR>

"========== Keymap ========
" Switch Window 
nnoremap <C-Left> <C-w>h
nnoremap <C-Down> <C-w>j
nnoremap <C-Up> <C-w>k
nnoremap <C-Right> <C-w>l

let g:move_key_modifier = 'C'
