" win shiiet
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

:set guioptions-=T "remove toolbar

let mapleader = ";"

" Plugins -----------------------------------------------------------
filetype off

set rtp+=~/vimfiles/bundle/Vundle.vim/
let path='~/vimfiles/bundle'
call vundle#begin(path)

Plugin 'gmarik/Vundle.vim'

" Editing utils
Plugin 'Align'
" Plugin 'gregsexton/MatchTag'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
" Plugin 'SirVer/ultisnips'
" Plugin 'Valloric/YouCompleteMe'

" Panels / Windows
" Plugin 'tpope/vim-fugitive'
" Plugin 'LustyJuggler'
Plugin 'kien/ctrlp.vim'
" Plugin 'sjl/gundo.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'scrooloose/nerdtree'
Plugin 'joonty/vdebug'
Plugin 'bling/vim-airline'

" Javascript / JSON / Coffeescript
" Plugin 'marijnh/tern_for_vim'
" Plugin 'helino/vim-json'
" Plugin 'JavaScript-Indent'
" Plugin 'jelera/vim-javascript-syntax'

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
colorscheme codeschool

set tabstop=4
set softtabstop=4
set expandtab!
set shiftwidth=4
set shiftround
set autoindent
set copyindent
set smarttab
set smartindent

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

" tern
" let g:tern_show_signature_in_pum=1
" nmap <silent> <F12> :TernDef<CR>
" nmap <silent> <c-s> :TernType<CR>

" Align Settings
" Remove align maps scrit as to not super pollute leader keys
if exists(":AlignMapsClean")
    AlignMapsClean
endif

" Align stuff
vmap AA :Align =<CR>
vmap Ap :Align =><CR>
vmap Aa :Align :<CR>

" airline / powerline
let g:airline_powerline_fonts=1
let g:airline_theme="powerlineish"

" let syntastic clobber location list
let g:syntastic_always_populate_loc_list=1
map <leader>e :SyntasticCheck<CR>

" Vdebug binds
"map <F10> :VdebugCommandStepOver<CR>
"map <F11> :VdebugCommandStepIn<CR>
"map <C-F11> :VdebugCommandStepOut<CR>
"map <F4> :VdebugCommandRunToCursor<CR>
map <F5> :VdebugStart<CR>
map <leader>b :Breakpoint<CR>

let g:vdebug_keymap = {
\    "run" : "<F5>",
\    "run_to_cursor" : "<F4>",
\    "step_over" : "<F10>",
\    "step_into" : "<F11>",
\    "step_out" : "<C-F11>",
\    "close" : "<F6>",
\    "detach" : "<F7>",
\    "set_breakpoint" : "<F3>",
\    "get_context" : "<F11>",
\    "eval_under_cursor" : "<F12>",
\    "eval_visual" : "<Leader>E",
\}

let g:vdebug_options={
\   "break_on_open" : 1,
\   "ide_key": 'netbeans-xdebug'
\}

"key binds -----------------------------------------------------------------

" auto search var under cursor
:autocmd CursorMoved * silent! exe printf('match Visual /\V\<%s\>/', escape(expand('<cword>'), '/\'))


"buffer shiet
map <leader>n :enew<cr>
map <leader>h :new<cr>
map <leader>v :vnew<cr>
map <leader>d :bd<cr>
map <leader>c :bp<bar>sp<bar>bn<bar>bd<CR>
map <leader>o :only<cr>

" list buffers
:nnoremap <leader>l :buffers<CR>:buffer<Space>

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

"toggle show whitespace
nmap <leader>w :set list!<CR>
:set listchars=eol:¬,tab:>-,trail:~,extends:>,precedes:<

" swap word with buffer
map <leader>s diwh"0p<CR>

" Other win 
" easy edit vimrc
map <leader>? :e $HOME\_vimrc<CR>

