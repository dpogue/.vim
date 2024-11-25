" Turn on line numbering. Turn it off with "set nonu" 
set nu

set nocompatible

" Set syntax on
syntax on
:syntax enable

" Fix regex engine hanging
set re=0

" insert space characters whenever the tab key is presse
set expandtab

" insert 4 spaces characters when tab key is pressed
set tabstop=4
set softtabstop=4

" insert 4 spaces wen autoindent indents
set shiftwidth=4

" Do smart indentation depending on code syntax (e.g. change after { }, keywords etc)
set smartindent

" Indent automatically depending on filetype
filetype plugin indent on
set autoindent

set backspace=indent,eol,start

let mapleader = ","

" Case insensitive search
set ic

" Highlight search
set hls

" Incremental search
set incsearch

" Disable arrow keys in normal & insert modes - use hjkl!!!
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

if version >= 700
  nnoremap gf :tabe <cfile><cr>
endif

nnoremap <leader><space> :noh<cr>
nnoremap <leader>w <C-w>v<C-w>l

" Wrap text instead of being on one line
set lbr

" Set current directory
if version >= 703
  " Set colorcolumn here because it needs the same version as autochdir
  set colorcolumn=80
  set autochdir
endif

" sane tab counts
set tpm=20

" Enable mouse support
if has('mouse')
  set mouse=a
endif

" Hack to speed up MacVim
let g:matchparen_timeout = 2
let g:matchparen_insert_timeout = 2

" Autofix some mistakes
cab W  w
cab Wq wq
cab wQ wq
cab WQ wq
cab Q  q

" Show special characters (Thanks Zrax!)
hi NonText      term=bold cterm=bold ctermfg=6 gui=bold guifg=gray
hi SpecialKey   term=bold cterm=bold ctermfg=0 guifg=gray
set listchars=tab:»\ ,trail:·,extends:»,precedes:«
set list

set fileencodings=ucs-bom,utf-8,gbk,big5,latin1
set termencoding=utf-8
if has ('multi_byte') && v:version > 601
  if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
    set ambiwidth=double
  endif
endif


set laststatus=2

set bg=dark

set ruler

colorscheme koehler

let &guicursor = &guicursor . ",a:blinkon0"

set synmaxcol=2048

set noeb vb t_vb=
autocmd GUIEnter * set vb t_vb=

if has('gui_running')
    if has("gui_macvim")
        set guifont=Roboto\ Mono:h11
    else
        set guifont=Roboto\ Mono
    endif

    " set columns=79
    " autocmd GUIEnter * set columns=80
endif

if !has('gui_running') && !has('nvim')
    set ttyfast
    set ttyscroll=3
    set lazyredraw
    set vb t_vb=
endif

au BufNewFile,BufRead *.ejs set filetype=html

packadd! editorconfig


" PLUGINS
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'tpope/vim-fugitive'
Plug 'rking/ag.vim'
Plug 'maksimr/vim-jsbeautify'

Plug 'vim-scripts/a.vim'

" Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'

Plug 'skammer/vim-css-color', { 'for': ['css', 'less', 'scss'] }
Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'less', 'scss'] }
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'pangloss/vim-javascript', { 'for': ['js', 'es6', 'json'] }
Plug 'keith/swift.vim', { 'for': ['swift'] }
Plug 'leafOfTree/vim-vue-plugin', { 'for': ['vue'] }
Plug 'tikhomirov/vim-glsl'

Plug 'dense-analysis/ale', { 'for': ['js', 'typescript', 'vue', 'c', 'cpp'] }

call plug#end()

let g:ale_fixers = { 'javascript': ['eslint'], 'vue': ['eslint', 'prettier'] }
let g:ale_sign_error = '🟥'
let g:ale_sign_warning = '🔸'
let g:ale_fix_on_save = 1
let g:ale_linters = { 'cpp': ['clangd'], 'c': ['clangd'] }
let g:ale_completion_enabled = 1

let g:html_indent_script1="zero"

" NERDTree helper
map <leader>n :NERDTreeToggle<CR>
