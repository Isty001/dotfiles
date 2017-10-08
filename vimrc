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
Plugin 'dracula/vim'
Plugin 'josuegaleas/jay'
Plugin 'beigebrucewayne/Turtles'
Plugin 'NLKNguyen/papercolor-theme'


" UI
Plugin 'qpkorr/vim-bufkill'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'majutsushi/tagbar'
Plugin 'itchyny/lightline.vim'

"Synthax highlight
Plugin 'sheerun/vim-polyglot'

" Code
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-surround'

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
syntax enable
set background=dark
colorscheme jay

"=========== BASIC ==========
silent! so .vimlocal

set encoding=utf8
set t_Co=256

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

let g:auto_save = 1
set directory^=$HOME/.vim/tmp//

set undofile
set undodir=$HOME/.vim/tmp//

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

"========== Templates ======

" Go to next placeholder
imap <buffer> ;; <C-O>/<CR><C-O>c3l
nmap <buffer> ;; /%%%<CR>c3l


" PHP
imap <buffer> ;pubf <C-O>mzpublic function %%%(%%%)<CR>{<CR>%%%<CR>}<C-O>'z;;
imap <buffer> ;prof <C-O>mzprotected function %%%(%%%)<CR>{<CR>%%%<CR>}<C-O>'z;;
imap <buffer> ;prif <C-O>mzprivate function %%%(%%%)<CR>{<CR>%%%<CR>}<C-O>'z;;

imap <buffer> ;pubsf <C-O>mzpublic static function %%%(%%%)<CR>{<CR>%%%<CR>}<C-O>'z;;
imap <buffer> ;prosf <C-O>mzprotected static function %%%(%%%)<CR>{<CR>%%%<CR>}<C-O>'z;;
imap <buffer> ;prisf <C-O>mzprivate static function %%%(%%%)<CR>{<CR>%%%<CR>}<C-O>'z;;

imap <buffer> ;vd <C-O>mzvar_dump(%%%);<C-O>'z;;

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
    autocmd VimEnter * TagbarOpen
endif

"========== VimFiler =======
if !&diff
    autocmd VimEnter * VimFilerExplorer
    autocmd VimEnter * wincmd p
endif

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

"========== Vim-Test ========
let test#strategy = "dispatch"

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
nnoremap <C-Left> <C-w>h
nnoremap <C-Down> <C-w>j
nnoremap <C-Up> <C-w>k
nnoremap <C-Right> <C-w>l

nnoremap <C-c> :BD<CR>

let g:move_key_modifier = 'C'
