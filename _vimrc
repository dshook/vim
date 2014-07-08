" win shiiet
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

let mapleader = ";"

" Plugins -----------------------------------------------------------
filetype off

set rtp+=~/vimfiles/bundle/Vundle.vim/
let path='~/vimfiles/bundle'
call vundle#begin(path)

Plugin 'gmarik/Vundle.vim'

" File Search
Plugin 'rking/ag.vim'

" Panels / Windows
" Plugin 'tpope/vim-fugitive'
" Plugin 'LustyJuggler'
Plugin 'kien/ctrlp.vim'
" Plugin 'sjl/gundo.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'scrooloose/nerdtree'
" Plugin 'joonty/vdebug'
" Plugin 'bling/vim-airline'

" Color schemes
Plugin 'BusyBee'
Plugin 'Blueshift'
Plugin 'Wombat'
Plugin 'twilight'
Plugin 'pyte'
Plugin 'mayansmoke'
Plugin 'Risto-Color-Scheme'
Plugin 'nanotech/jellybeans.vim'
Plugin '29decibel/codeschool-vim-theme'
Plugin 'flazz/vim-colorschemes'
Plugin 'ricardovaleriano/vim-github-theme'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'sjl/badwolf'
Plugin 'sickill/vim-monokai'
Plugin 'john2x/flatui.vim'
Plugin 'noahfrederick/vim-hemisu'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"call vundle#config#require(g:bundles)

"look n feel --------------------------------------------------------
set guifont=Consolas:h10:cANSI
syntax enable
colorscheme Wombat

set tabstop=4
set shiftwidth=4
set softtabstop=4

" lol backups
set nobackup
set noswapfile

" dat menu
set wildmenu
 
" misc
set number
set showmatch
set showmode
set scrolloff=10
set incsearch
set ignorecase
set smartcase
set hidden
set nowrap

" show position
set ruler

" plugin settings ------------------------------------------------------

" ctrlp
let g:ctrlp_extensions=['funky']
let g:ctrlp_follow_symlinks=1
let g:ctrlp_working_path_mode=0
let g:ctrlp_custom_ignore={
  \ 'dir':  '\.git$\|node_modules\|bin\|dist\|bower_components',
  \ 'file': '\.exe$\|\.so$\|\.dat$'
  \ }

" Nerd tree and tag list
nmap <silent> <leader>t :NERDTreeToggle<CR>

" Search highlight
let g:aghighlight=1

"key binds -----------------------------------------------------------------

:nnoremap <F5> :buffers<CR>:buffer<Space>

"buffer shiet
map <leader>n :bn<cr>
map <leader>p :bp<cr>
map <leader>h :new<cr>
map <leader>v :vnew<cr>
map <leader>d :bd<cr>
map <leader>c :bp<bar>sp<bar>bn<bar>bd<CR>
map <leader>o :only<cr>

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

" Switch to alternate file
map <C-Tab> :bnext<cr>
map <C-S-Tab> :bprevious<cr>

" funky action
nnoremap <leader>f :CtrlPFunky<Cr>
nnoremap <leader>F :execute 'CtrlPFunky ' . expand('<cword>')<Cr>


" Other win 
" easy edit vimrc
map <leader>? :e $HOME\_vimrc<CR>
