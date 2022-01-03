let mapleader = "\<Space>"


"========== Plug =============
call plug#begin('~/.vim/plugged')

" ---

Plug 'Isty001/ale'

let g:php_phpstan_configuration = '--autoload-file=' . get(g:, 'php_autoloader_file')
let g:ale_sign_column_always = 1
let g:ale_fixers = {
\   'php': ['php_cs_fixer'],
\   'yaml': ['prettier'],
\   'ruby': ['rubocop'],
\   'json': ['jq'],
\   'xml': ['xmllint']
\}

nnoremap <leader>r :ALEFix<CR>

" autocmd FileType yaml,c :ALEDisable
autocmd FileType c :ALEDisable

" ---

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Extensions: phpls, solargraph, json, ultisnips

let g:coc_global_extensions = ['coc-clangd', 'coc-db', 'coc-phpls', 'coc-json', 'coc-ultisnips', 'coc-rls']

" SEE: https://github.com/neoclide/coc.nvim

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

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
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>l  :<C-u>CocListResume<CR>

" ---
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

map <leader>f :FZF<CR>
" map <leader>a :Ag<CR>
let s:ag_options = ' --skip-vcs-ignores --path-to-ignore=.vim-ignore'
let $FZF_DEFAULT_COMMAND = 'ag -g ""' . s:ag_options

function! s:ag_with_opts(arg, bang)
  let tokens  = split(a:arg)
  let ag_opts = join(filter(copy(tokens), 'v:val =~ "^-"')) . ' --skip-vcs-ignores --path-to-ignore=.vim-ignore --color --color-path="0;38;5;24" --color-line-number="0" --color-match="1;33"'
  let query   = join(filter(copy(tokens), 'v:val !~ "^-"'))
  call fzf#vim#ag(query, ag_opts, a:bang ? {} : { 'window' : { 'width': 0.9, 'height': 0.6, 'highlight': 'Normal' } })
endfunction

autocmd VimEnter * command! -nargs=* -bang Ag call s:ag_with_opts(<q-args>, <bang>0)

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

" ---

Plug 'scrooloose/nerdtree'

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

nmap <leader>g :NERDTreeFind<CR>
nmap <leader>G :NERDTreeFind<CR><C-w>l<CR>

" ---

Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
" Plug 'dracula/vim', { 'as': 'dracula' }

" ---

Plug 'qpkorr/vim-bufkill'

nnoremap <C-c> :BD<CR>

" ---

Plug 'vim-scripts/vim-auto-save'

let g:auto_save = 1
let g:auto_save_in_insert_mode = 0

" ---

Plug 'dkprice/vim-easygrep'

let g:EasyGrepRecursive=1

autocmd vimenter * silent! GrepProgram ag

" ---

Plug 'matze/vim-move'

let g:move_key_modifier = 'C'

" --

Plug 'editorconfig/editorconfig-vim'

" ---

Plug 'psliwka/vim-smoothie'

" ---

Plug 'wellle/targets.vim'

autocmd User targets#mappings#user call targets#mappings#extend({
    \ '%': {'separator': [{'d': '%'}]},
    \ })

" ---

Plug 'RRethy/vim-illuminate'

hi link illuminatedWord Visual
let g:Illuminate_delay = 100

augroup illuminate_augroup
    autocmd!
    autocmd VimEnter * hi illuminatedWord cterm=underline gui=underline
augroup END

" ---

Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

let g:UltiSnipsExpandTrigger="<C-a>"
let g:UltiSnipsSnippetsDir = "~/.vim/ulti-snips"
let g:UltiSnipsJumpForwardTrigger="<C-l>"
let g:UltiSnipsJumpBackwardTrigger="<C-h>"

" ---

Plug 'alvan/vim-closetag'

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.php.html,*.xml'

autocmd BufNewFile,BufRead *.html.php set ft=php.html

" ---

Plug 'benmills/vimux'

map <leader>x :VimuxRunLastCommand<cr>

autocmd FileType c,cpp map <C-x> :call VimuxRunCommand("make test")<CR>

if exists('$TMUX')
    set term=screen-256color
    set t_8f=^[[38;2;%lu;%lu;%lum
    set t_8b=^[[48;2;%lu;%lu;%lum
    let &t_ZH="\e[3m"
    let &t_ZR="\e[23m"
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

" ---

Plug 'janko-m/vim-test'

let test#strategy = "vimux"

nmap <silent> <C-n> :TestNearest<CR>
nmap <silent> <C-x> :TestFile<CR>
nmap <silent> <C-t> :TestLast<CR>

" ---

" Example: :%Subvert/facilit{y,ies}/building{,s}/g
Plug 'tpope/vim-abolish'

" ---

Plug 'ap/vim-buftabline'

" ---

Plug 'Raimondi/delimitMate'
Plug 'machakann/vim-sandwich'
Plug 'LandonSchropp/vim-stamp'

" ---

Plug 'markonm/hlyank.vim'
Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'
Plug 'rhysd/clever-f.vim'
Plug 'romainl/vim-cool' " Disables highlight after finishing search
Plug 'tpope/vim-endwise', {'for': 'ruby'}
Plug 'google/vim-searchindex'
Plug 'adoy/vim-php-refactoring-toolbox', {'for': 'php'}
Plug 'tpope/vim-fugitive'
Plug 'evidens/vim-twig'
Plug 'Yggdroot/indentLine'

" ---

" Plug 'StanAngeloff/php.vim'

" syntax sync minlines=100
" syntax sync maxlines=150
" set synmaxcol=500

" ----

" let g:polyglot_disabled = ['ftdetect', 'sensible', 'autoindent']
" autocmd BufEnter * set indentexpr=

" Plug 'sheerun/vim-polyglot'

" ---

Plug 'noprompt/vim-yardoc', {'for': 'ruby'}

" ---

Plug 'itchyny/vim-gitbranch'


set statusline=%f         " Path to the file
set statusline+=\ -\      " Separator
set statusline+=%{gitbranch#name()}

" ---

Plug 'mhinz/vim-signify'
Plug 'joukevandermaas/vim-ember-hbs', {'for': 'html.handlebars'}
Plug 'kshenoy/vim-signature'

" ---

Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'

let g:db_ui_auto_execute_table_helpers = 0
let g:db_ui_win_position = 'right'
let g:db_ui_execute_on_save = 0

" ---

call plug#end()

runtime macros/matchit.vim

" ---
" Keymap
" ---


" search visually selected text
vnoremap // y/<C-R>"<CR>

" change window
map <C-h> <C-W>h
map <C-l> <C-W>l


" == Navigate between buffers
nmap <Tab> :bn<CR>
nmap <S-Tab> :bp<CR>

" == Indent in viusal mode, reselect text
vnoremap < <gv
vnoremap > >gv

" == History
nnoremap <leader>h :UndotreeToggle<cr>

" == Copy file path

nmap <leader>p :let @+=expand("%:p")<cr>
nmap <leader>rp :let @+=expand("%")<cr>

" == Navigation in popup menu
inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "j"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "k"

" Always delete to black hole
nnoremap d "_d
vnoremap d "_d

" Navigate in command mode
cnoremap <C-K> <Up>
cnoremap <C-J> <Down>

" Delete mark
nnoremap dm :execute 'delmarks '.nr2char(getchar())<cr>

" ---
" Color scheme
" ---

syntax on
filetype plugin indent on

set termguicolors
set t_Co=256
set exrc

set background=dark

" color bogster
color challenger_deep
" color dracula

" let g:purify_undercurl = 0

" hi CursorLine cterm=NONE ctermbg=242

hi Normal guibg=NONE ctermbg=NONE

hi Visual ctermfg=3 ctermbg=8 guibg=#82858C

" ---
" Vim Settings
" ---

set nocompatible
set encoding=utf8
set ignorecase
set history=600
set exrc
set shell=/bin/bash

set ttyfast

autocmd BufNewFile,BufRead *.html.php set ft=php

set lazyredraw

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
set scrolloff=3

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
set undolevels=1000


" Keep window position on buffer change
if v:version >= 700
  au BufLeave * let b:winview = winsaveview()
  au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
endif

" ---
" Swap words
" ---

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
