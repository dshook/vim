" detect what's going on
let win = 0
let mac = 0
if has("unix")
    let mac = 1
endif
if has("win32")
    let win = 1
endif

if win
    " win shiiet
    set nocompatible
    source $VIMRUNTIME/vimrc_example.vim
    source $VIMRUNTIME/mswin.vim
    behave mswin

    :set guioptions-=T "remove toolbar
endif

let mapleader = ";"

" Plugins -----------------------------------------------------------
filetype off

set rtp+=~/vimfiles/bundle/Vundle.vim/
let path='~/vimfiles/bundle'

call vundle#begin(path)

Plugin 'gmarik/Vundle.vim'

" Editing utils
Plugin 'Align'
if mac
    Plugin 'Valloric/YouCompleteMe'
endif
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
" Plugin 'SirVer/ultisnips'

" Panels / Windows
" Plugin 'LustyJuggler'
Plugin 'kien/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'scrooloose/nerdtree'
Plugin 'joonty/vdebug'
Plugin 'bling/vim-airline'

" Javascript / JSON / Coffeescript
Plugin 'marijnh/tern_for_vim'
Plugin 'elzr/vim-json'
" Plugin 'JavaScript-Indent'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'Chiel92/vim-autoformat'

" Detect indent
Plugin 'ciaranm/detectindent'

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
if win
    set guifont=Consolas:h10:cANSI
endif

if mac
    set guifont=Inconsolata:h14
endif

syntax enable
colorscheme codeschool

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab!
set shiftround
set autoindent
set copyindent
set smarttab
set smartindent

if mac
    " dont pop up preview window, ycm is enough
    set completeopt-=preview
endif

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

if mac
    " 2 spaces for my web life
    au BufNewFile,BufReadPost *.less,*.hbs,*.coffee,*.js,*.css,*.scss,*.json,*.html
		\ setl tabstop=2 |
		\ setl softtabstop=2 |
		\ setl shiftwidth=2 |
        \ setl expandtab

endif

" syntax higlight special things
au Bufread,BufNewFile *.md set filetype=markdown
au Bufread,BufNewFile *.hbs set filetype=html

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

if mac
    " tern
    let g:tern_show_signature_in_pum=1
    nmap <silent> <F12> :TernDef<CR>
    " nmap <silent> <c-s> :TernType<CR>

    " ycm completion
    let g:ycm_add_preview_to_completeopt=0
    let g:ycm_autoclose_preview_window_after_completion=1
    let g:ycm_autoclose_preview_window_after_insertion=1
    let g:ycm_cache_omnifunc=0
endif

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

if win
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
endif

" detect indent
":autocmd BufReadPost * :DetectIndent 
:let g:detectindent_preferred_expandtab = 0
:let g:detectindent_preferred_indent = 4
:let g:detectindent_max_lines_to_analyse = 256

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

" autoformat (npm install -g js-beautify)
map <C-f> :Autoformat<cr>

"toggle show whitespace
nmap <leader>w :set list!<CR>
:set listchars=eol:¬,tab:>-,trail:~,extends:>,precedes:<

" swap word with buffer
map <leader>s diwh"0p<CR>

" Search for word under cursor in current dir & subdirs 
map <F2> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

" easy edit vimrc
map <leader>? :e ~/.vimrc<CR>

if win
	"remap autocomplete to ctrl space
	inoremap <C-space> <C-n>
	inoremap <expr> <Tab> pumvisible() ? "\<C-Y>" : "\<Tab>"
	inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
	inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-p>"
endif

