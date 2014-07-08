
let mapleader = ";"

" Plugins -----------------------------------------------------------
filetype off

set rtp+=~/vimfiles/bundle/Vundle.vim/
let path='~/vimfiles/bundle'
call vundle#begin(path)

Plugin 'gmarik/Vundle.vim'

" Editing utils
Plugin 'Align'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'

" Panels / Windows
" Plugin 'tpope/vim-fugitive'
" Plugin 'LustyJuggler'
Plugin 'kien/ctrlp.vim'
" Plugin 'sjl/gundo.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'scrooloose/nerdtree'
" Plugin 'joonty/vdebug'
Plugin 'bling/vim-airline'

" Javascript / JSON / Coffeescript
Plugin 'marijnh/tern_for_vim'
Plugin 'helino/vim-json'
Plugin 'JavaScript-Indent'
Plugin 'jelera/vim-javascript-syntax'

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
syntax enable
colorscheme codeschool

set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set shiftround
set autoindent
set copyindent
set smarttab
set smartindent
 
" dont pop up preview window, ycm is enough
set completeopt-=preview

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

" 2 spaces for my web life
au BufNewFile,BufReadPost *.less,*.hbs,*.coffee,*.js,*.css,*.scss,*.json,*.html setl shiftwidth=2  expandtab

" Markdown files
au Bufread,BufNewFile *.md set filetype=markdown


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
let g:tern_show_signature_in_pum=1
nmap <silent> <F12> :TernDef<CR>
" nmap <silent> <c-s> :TernType<CR>

" ycm completion
let g:ycm_add_preview_to_completeopt=0
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_cache_omnifunc=0

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

"key binds -----------------------------------------------------------------

" auto search var under cursor
:autocmd CursorMoved * silent! exe printf('match Visual /\V\<%s\>/', escape(expand('<cword>'), '/\'))

:nnoremap <F5> :buffers<CR>:buffer<Space>

"buffer shiet
map <leader>n :enew<cr>
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
map <leader>? :e ~/.vimrc<CR>

