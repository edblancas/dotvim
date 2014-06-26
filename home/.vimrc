set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-eunuch'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'junegunn/vim-easy-align'

Plugin 'Shougo/vimshell.vim'

Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

Plugin 'airblade/vim-gitgutter'
Plugin 'Raimondi/delimitMate'
Plugin 'Yggdroot/indentLine'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'mbbill/undotree'
Plugin 'mileszs/ack.vim'
Plugin 'wikitopian/hardmode'
Plugin 'plasticboy/vim-markdown'
Plugin 'rizzatti/funcoo.vim'
Plugin 'rizzatti/dash.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-indent'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" END VUNDLE DEFAULTS ---------------------------------------------------------

" NEOCOMPLETE
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1

" AUTOCOMANDS -----------------------------------------------------------------
" Remove any trailing whitespace that is in the file
"autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Automatically cd into the directory that the file is in
"autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')
" Note: Cause conflicts when using tabs for the working dir
"set autochdir

" MISC SETTINGS ---------------------------------------------------------------
" Hides buffers instead of closing them. This means that you can have
" unwritten changes to a file and open a new file using :e, without being
" forced to write or undo your changes first. Also, undo buffers and marks are
" preserved while the buffer is open.
set hidden


" This shows what you are typing as a command.  I love this!
set showcmd

" Use syntax for folds
set foldmethod=syntax

" Needed for Syntax Highlighting and stuff
filetype on 
filetype plugin on
filetype indent on
syntax enable

" Who doesn't like autoindent?
set autoindent          " set the cursor at same indent as line above
set smartindent         " try to be smart about indenting (C-style)

" Spaces are better than a tab character
set expandtab           " expand <Tab>s with spaces; death to tabs!
set smarttab            " smart tab insert and delete, when <BS> delete a shiftwidth

" Who wants an 8 character tab?  Not me!
set shiftwidth=4        " spaces for each step of (auto)indent
set softtabstop=4       " set virtual tab stop (compat for 8-wide tabs)

" Cool tab completion stuff
set wildmenu                " turn on wild menu :e <Tab>
set wildmode=list:longest,full      " set wildmenu to list choice

" Enable mouse support in console
set mouse=a

" For problems with backspace and for delete line breaks, inserted
" indentation, or the place where insert mode started (>= vim 7.3),
" for erlier versions: set backspace=2
" set backspace=indent,eol,startaut

" Got backspace?
set backspace=2                     " equiv to :set backspace=indent,eol,start

" Line Numbers PWN!
set number

" Ignoring case is a fun trick, ignore case while searching
set ignorecase

" And so is Artificial Intellegence! Ignore case if search pattern is all in
" lowercase, case sensitive otherwise
set smartcase

" Incremental searching is sexy
set incsearch

" Highlight things that we find with the search
set hlsearch

" show matching brackets
set showmatch

" BACKUP ----------------------------------------------------------------------
" You will have to create these directories first, vim will not create them for you.
set nobackup
"set backupdir=~/.vim/backup
"set directory=~/.vim/tmp
set noswapfile


" LOOK AN FEEL ----------------------------------------------------------------
" Status line gnarliness, siempre muestra el status line
set laststatus=2
" Status line modificada, cuando no esta activado el plugin de vim-powerline
"set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]

" This highlights the background in a subtle red for text that goes over the 80 column limit, for vim <= 7.2, in vim 7.3 is colorcolumn=80
"highlight OverLength ctermbg=darkred ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/
set colorcolumn=100

 " highlight current line
set cul

" Use UTF-8 everywhere
set encoding=utf-8

colorscheme Tomorrow-Night-Eighties

if has("gui_running")
    let g:airline_powerline_fonts = 1
    "set guioptions=aegim
    set guioptions=agi
    highlight LineNr guibg=#141414                          " Highlight background of the line number gutter the tomorrow-night
    if has('unix') && !has('macunix') && !has('win32unix')
        set guifont=Menlo\ for\ Powerline\ 10
        set lines=40 columns=100                            " Window dimensions
        compiler gcc
    elseif has("macunix")
        " Put first mac because otherwise enter in the unix option
        set guifont=Menlo\ for\ Powerline:h14
        set lines=80 columns=150                            " Window dimensions
    endif
else
    "* the separator used on the left side
    let g:airline_left_sep=''
    "* the separator used on the right side
    let g:airline_right_sep=''
    " highlight LineNr ctermfg=darkcyan
    " hi CursorLine term=none cterm=none ctermbg=3          " adjust color for terminal
endif

" Show invisible characters
"set list
"set list listchars=tab:▸–,trail:·,nbsp:¬

" History of the command line, def 20 
set history=200

" CtrlP -----------------------------------------------------------------------
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$',
    \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
    \ 'link': 'some_bad_symbolic_links',
    \ }
"let g:ctrlp_extensions = [
"   \ 'ctrlp-filetpe',
"   \ ]
let g:ctrlp_map = ''
let g:ctrlp_follow_symlinks = 1

" MAPPINGS --------------------------------------------------------------------
" Mapleader
let mapleader = ","

" Space will toggle folds!
nnoremap <space> za

" Swap ; and :  Convenient.
"nnoremap ; :
"nnoremap : ;

" Re-hardwrap paragraph of text
nnoremap <leader>q gqip

"This last mapping lets me quickly open up my ~/.vimrc file in a vertically split window so I can add new things to it on the fly.
nnoremap <leader>se <C-w><C-v><C-l>:e $MYVIMRC<CR>

" Quickly reload the vimrc file
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" CtrlP Config --------------------------------------------------
" CtrlP familiar to Command-T - replace  Command-T map
silent! nnoremap <unique> <silent> <Leader>p :CtrlP<CR>
" CtrlP for buffers - replace Command-T map
silent! nnoremap <unique> <silent> <Leader>b :CtrlPBuffer<CR>
" CtrlP for tags
silent! nnoremap <unique> <silent> <Leader>T :CtrlPTag<CR>
" CntrlP for mru
silent! nnoremap <unique> <silent> <Leader>m :CtrlPMRUFiles<CR>
" CtrlP for filetype, se nececita el plugin!
" silent! nnoremap <unique> <silent> <Leader>f :CtrlPFiletype<CR>

" remove whitespaces before writing a file
function! <SID>RemoveWhitespaces()
  let l = line(".")
  let c = col(".")
  execute '%s/\s\+$//e'
  call cursor(l, c)
endfunction

" mapping to remove whitespaces
" nnoremap <silent> <S-Space> :call <SID>RemoveWhitespaces()<CR>

" mapping to generate tags file
function! FlushEnvironment()
  silent! exe ":!ctags -R"
endfunction
silent! nnoremap <silent> TT :call FlushEnvironment()<CR>

"
" Custom key mapping
" ------------------
"
map <C-p> <nop>

" BUFFERS MAPPING ----------------------------------------
" Leader + Tab: Switching to the previously edited buffer
map <Leader><Tab> :b#<CR>
" Leader + n: New buffer
map <Leader>n :new<CR>
" NOTE: Se utiliza tpope/unimpared [b y ]b
"map <C-B>p :bprev<CR>
"map <C-b>n :bnext<CR>
" Close current buffer
map <Leader>d :bd<CR>
" map <Leader>d :q<CR>
" Close current buffer without saving
map <Leader>D :bd!<CR>
" Close and save current buffer
map <Leader>W :w \| bd<CR>
" Hide current buffer
map <Leader>h :hide<CR>

" Hide search highlight
if exists(":nohls")
  nmap <silent><C-h> :nohls<CR>  
  "map <silent><Leader>h :nohls<CR>
endif

" New line down and up the cursor
nnoremap <C-J> mao<Esc>`a
nnoremap <C-K> maO<Esc>`a

" NerdTree {
    map <C-e> <plug>NERDTreeTabsToggle<CR>
    " Open NERDTree
    map <Leader>L :NERDTree<CR>
    map <leader>e :NERDTreeFind<CR>
    nmap <leader>nt :NERDTreeFind<CR>

    let NERDTreeShowBookmarks=1
    let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
    let NERDTreeChDirMode=2
    let NERDTreeQuitOnOpen=1
    let NERDTreeMouseMode=2
    let NERDTreeShowHidden=1
    let NERDTreeKeepTreeInNewTab=1
    let g:nerdtree_tabs_open_on_gui_startup=0
" }
" 

" Force yourself to stop using arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Override the read-only permissions
cmap w!! %!sudo tee > /dev/null %

" Airline config---------------------------------------- 
" the ✹ trailing[99] is part of the whitespace extension. you can disable it with
let g:airline_section_warning=''
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" Show the buffer number
let g:airline#extensions#tabline#buffer_nr_show = 1

" Markdown fixes---------------------------------------- 
" Para detectar los md como markdown y no como modula2 que es el default
"autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.md set filetype=mkd

" Add the following line to your .vimrc to disable folding
let g:vim_markdown_folding_disabled=1

" sirver/utilsnips---------------------------------------- 
let g:UltiSnipsExpandTrigger="<c-j>"
"let g:UltiSnipsJumpForwardTrigger="<c-j>"
"let g:UltiSnipsJumpBackwardTrigger="<c-k>"
"let g:UltiSnipsListSnippets = '<c-tab>'

" delimitMate
let delimitMate_expand_cr = 1

" Pasting large amounts of text into Vim 
" Another great trick I read in a reddit comment is to use <C-r>+ to paste right from the OS paste board. Of course, this only works when running Vim locally (i.e. not over an SSH connection).
set pastetoggle=<F2> 

" Core Vim Course (04-dot-formula-with-range)
xnoremap . :normal .<CR>
