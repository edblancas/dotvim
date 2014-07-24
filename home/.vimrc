" vim: nowrap fdm=marker
source ~/.vim/utils/bundles.vim
source ~/.vim/utils/watch_for_changes.vim

" Personal preferences not set by sensible.vim
set hidden

set foldmethod=syntax

filetype on
filetype plugin on
filetype indent on
syntax enable

set smartindent

set expandtab
set shiftwidth=4
set softtabstop=4

set wildmode=list:longest,full

set mouse=a

set number

set ignorecase
set smartcase

set hlsearch

set showmatch

set nobackup
set noswapfile

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

set pastetoggle=<F2>

set shell=zsh

" Look and feel
set t_Co=256

set encoding=utf-8

set colorcolumn=100

set cul

let &showbreak = "↳"

set breakindent
set breakindentopt=shift:4,sbr

if has("gui_running")
    set guioptions=agi
    set lines=999 columns=9999
    if has('unix') && !has('macunix') && !has('win32unix')
        set guifont=Menlo\ for\ Powerline\ 10
        compiler gcc
    elseif has("macunix")
        set guifont=Menlo\ for\ Powerline:h14
        set transparency=0
    endif
else
    if has('unix') && !has('macunix') && !has('win32unix')
        set guifont=Menlo\ for\ Powerline\ 10
    elseif has("macunix")
        set guifont=Menlo\ for\ Powerline:h14
    endif
endif

colorscheme solarized
set background=dark

" Tweak colorscheme for a preattier tomorrow in command line
"highlight LineNr cterm=bold
"highlight CursorLineNr cterm=bold
"highlight Folded cterm=bold
"highlight Constant cterm=underline
"highlight Statement cterm=bold
"highlight MarkdownH1 cterm=bold
"highlight Error ctermfg=255
"highlight ErrorMsg ctermfg=255

" Mappings {{{1
" Override defaults {{{2
let mapleader = ","

nnoremap Q <Nop>

nnoremap <space> za

nnoremap j gj
nnoremap k gk

" File opening {{{2
cnoremap <expr> %%  getcmdtype() == ':' ? fnameescape(expand('%:h')).'/' : '%%'

map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

map <Leader><Tab> :b#<CR>
map <Leader>n :new<CR>
map <Leader>d :bd<CR>
map <Leader>D :bd!<CR>
map <Leader>W :w \| bd<CR>
map <Leader>h :hide<CR>

nnoremap <leader>se <C-w><C-v><C-l>:e $MYVIMRC<CR>
nnoremap <Leader>sb <C-w><C-v><C-l>:e ~/.vim/utils/bundles.vim<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Fix the & command in normal+visual modes {{{2
nnoremap & :&&<Enter>
xnoremap & :&&<Enter>

" Strip trailing whitespace and text operations {{{2
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

nmap <silent> <S-Space> :call Preserve("%s/\\s\\+$//e")<CR>

nnoremap <leader>q gqip

" Visual line repeat {{{2
xnoremap . :normal .<CR>
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" Ctags {{{2
silent! nnoremap <silent> TT :!~/.vim/utils/ctags-proj.sh<CR>

" Smash Escape {{{2
"inoremap <esc> <nop>
inoremap jk <Esc>
inoremap kj <Esc>
inoremap JK <Esc>
inoremap KJ <Esc>

" Custom mappings and functions {{{2
" Delete a word to the right
imap <C-d> <C-o>diw

" Override the read-only permissions
cmap w!! %!sudo tee > /dev/null %

" Copy the path of the actual file
function! MeGetFilePath()
    let @+ = expand("%:p")
    let @* = expand("%:p")
endfunction

" Force yourself to stop using arrow keys
"noremap   <Up>     <Nop>
"noremap   <Down>   <Nop>
"noremap   <Left>   <Nop>
"noremap   <Right>  <Nop>
"inoremap  <Up>     <Nop>
"inoremap  <Down>   <Nop>
"inoremap  <Left>   <Nop>
"inoremap  <Right>  <Nop>

" Experimental mappings {{{2
nnoremap g" /\v<<C-r>"><CR>

command! Path :call EchoPath()
function! EchoPath()
  echo join(split(&path, ","), "\n")
endfunction

command! TagFiles :call EchoTags()
function! EchoTags()
  echo join(split(&tags, ","), "\n")
endfunction

let g:EasyClipUseSubstituteDefaults = 1
nmap <silent> gs <plug>SubstituteOverMotionMap
nmap gss <plug>SubstituteLine
xmap gs p

let g:EasyClipUseCutDefaults = 0
nmap x <Plug>MoveMotionPlug
xmap x <Plug>MoveMotionXPlug
nmap xx <Plug>MoveMotionLinePlug

nmap cp <Plug>TransposeCharacters
nnoremap  <Plug>TransposeCharacters xp
\:call repeat#set("\<Plug>TransposeCharacters")<CR>

" Plugin configuration {{{1
" Markdown {{{2
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
    autocmd FileType markdown,vim let b:loaded_delimitMate=1
augroup END
let g:vim_markdown_folding_disabled=1

let g:instant_markdown_autostart = 0

" NerdTree {{{2
    "map <Leader>l :NERDTreeToggle<CR>
    "map <Leader>L :NERDTree<CR>
    "map <leader>nt :NERDTreeFind<CR>

    "let NERDTreeShowBookmarks=1
    "let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
    "let NERDTreeChDirMode=2
    "let NERDTreeQuitOnOpen=1
    "let NERDTreeMouseMode=2
    "let NERDTreeShowHidden=1
    "let NERDTreeKeepTreeInNewTab=1
    "let g:nerdtree_tabs_open_on_gui_startup=0

" CtrlP {{{2
silent! nnoremap <unique> <silent> <Leader>p :CtrlP<CR>
silent! nnoremap <unique> <silent> <Leader>b :CtrlPBuffer<CR>
silent! nnoremap <unique> <silent> <Leader>T :CtrlPTag<CR>
silent! nnoremap <unique> <silent> <Leader>t :CtrlPBufTag<CR>
silent! nnoremap <unique> <silent> <Leader>m :CtrlPMRUFiles<CR>
silent! nnoremap <unique> <silent> <Leader>o :CtrlPBookmarkDir<CR>

let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$',
    \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
    \ 'link': 'some_bad_symbolic_links',
    \ }
let g:ctrlp_map = ''
let g:ctrlp_follow_symlinks = 1

let g:ctrlp_extensions = ['buffertag', 'bookmarkdir']

let g:ctrlp_working_path_mode = 0

" Airline {{{2
let g:airline_powerline_fonts = 1
let g:airline_section_warning=''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_inactive_collapse=0

let g:airline_theme_patch_func = 'AirlineThemePatch'
function! AirlineThemePatch(palette)
  if g:airline_theme == 'tomorrow'
    for colors in values(a:palette.inactive)
      let colors[2] = 102
    endfor
  endif
endfunction

" neocomplete {{{2
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_auto_delimiter = 1
let g:neocomplete#max_list = 30
let g:neocomplete#enable_auto_select = 1

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
            \ 'default' : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'

" Tabularize {{{2
nmap <Leader>a& :Tabularize /&<CR>
vmap <Leader>a& :Tabularize /&<CR>
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>
nmap <Leader>a:: :Tabularize /:\zs<CR>
vmap <Leader>a:: :Tabularize /:\zs<CR>
nmap <Leader>a, :Tabularize /,<CR>
vmap <Leader>a, :Tabularize /,<CR>
nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
vmap <Leader>a<Bar> :Tabularize /<Bar><CR>

" Gundo {{{2
nnoremap <F5> :GundoToggle<CR>

" Tagbar {{{2
nmap <F8> :TagbarToggle<CR>
