" VIM configuration file
" ======================

" Install vim-plug
" ----------------

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Functions
" ---------

function! InsertTabWrapper(direction)
	let col = col('.') - 1
	if !col || getline('.')[col - 1] !~ '\k'
		return "\<tab>"
	elseif "backward" == a:direction
		return "\<c-p>"
	else
		return "\<c-n>"
	endif
endfunction

" Configure VIM
" -------------

" Automatically reload .vimrc

autocmd! bufwritepost .vimrc source %

" Colorscheme

if has("gui_running")
    colorscheme desert
endif

hi Normal ctermbg=NONE
hi CursorLineNr ctermfg=white
hi SignColumn ctermbg=NONE

" For pasting large blocks of text

set pastetoggle=<F2>
set clipboard=unnamed

" Set <Leader> key

let mapleader = "\\"

" Disable phrase highlight with Ctrl+n

noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" Fast file close with Ctrl+e or entire VIM with Ctrl+E (without prompt!)

noremap <Leader>e :quit<CR>
noremap <Leader>E :qa!<CR>

" Easier window switching using Ctrl+h/j/k/l

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Move over tabs

map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" Other mappings
map! <S-Insert> <MiddleMouse>

" Code block movement

vnoremap < <gv
vnoremap > >gv

" Enable syntax highlighting

filetype off
filetype plugin indent off
syntax on

" Various editor options

set mouse=a
set backspace=indent,eol,start
set number
set history=700
set undolevels=700
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set hlsearch
set incsearch
set ai
set background=dark
set autoindent
set ruler
set termencoding=utf-8
set window=53
set fileencodings=ucs-bom,utf-8,default,latin1
set helplang=pl
set history=50
set printoptions=paper:a4
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set nu
set nowrap
set modeline

hi Pmenu	ctermbg=DarkGreen ctermfg=Green guibg=DarkGreen guifg=Green
hi PmenuSel     ctermfg=Yellow ctermbg=Green guibg=Green guifg=DarkGreen
hi PmenuSbar	ctermbg=Green guibg=DarkGreen
hi PmenuThumb	ctermfg=Green guifg=Green

" Disable backup files (Git is used anyway ;-)

set nobackup
set nowritebackup
set noswapfile

" Custom bindings
" ---------------

" Supplement words with Tab

inoremap	<Tab>				<C-R>=InsertTabWrapper("backward")<CR>
inoremap	<S-Tab>				<C-R>=InsertTabWrapper("forward")<CR>

" Remove white characters from line ends

map         <Leader>e           <Esc>:%s/\s\s*$//c<CR>

" Plugin configuration
" --------------------

so ~/.vim/plugins.vim

" lightline
set laststatus=2
let g:lightline = {
  \     'active': {
  \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \     }
  \ }

" fzf (file search)
map <C-p> :Files <CR>

" git-gutter

highlight GitGutterAdd ctermfg=green ctermbg=NONE
highlight GitGutterChange ctermfg=yellow ctermbg=NONE
highlight GitGutterDelete ctermfg=red ctermbg=NONE
highlight GitGutterChangeDelete ctermfg=yellow ctermbg=NONE

" ctrlp (file search)

" let g:ctrlp_max_height = 30
" set wildignore+=*.pyc
" set wildignore+=*build/*
" set wildignore+=*dist/*
" set wildignore+=*.egg-info/*
" set wildignore+=*/coverage/*

" python-mode (Python intelliJ and other stuff)

map <leader>g :call ropegotodefinition()<cr>
let ropevim_enable_shortcuts = 1
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_extended_complete = 1
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
let g:pymode_virtualenv = 1

" nerdtree (file manager)

let NERDTreeIgnore = ['\.pyc$', '__pycache__$']
nmap <F3> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" ack (grep for programmers)

nmap <C-F> :Ack <space>
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif
