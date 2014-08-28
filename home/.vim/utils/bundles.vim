" vim: nowrap fdm=marker
set nocompatible              
filetype off                 

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" INDISPENSABLE STUFF {{{1
"Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Raimondi/delimitMate'
Plugin 'svermeulen/vim-easyclip'
Plugin 'godlygeek/tabular'
Plugin 'chrisbra/NrrwRgn'

Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-indent'

Plugin 'mileszs/ack.vim'
"Plugin 'rking/ag.vim'

" }}}

" AUTOCOMPLETE STUFF {{{1
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'honza/vim-snippets'

" }}}

" COLOR SCHEMES {{{1
Plugin 'chriskempson/base16-vim'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'noahfrederick/vim-hemisu'
Plugin 'tomasr/molokai'
Plugin 'altercation/vim-colors-solarized'

" }}}

" MARKDOWN STUFF {{{1
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'suan/vim-instant-markdown'
Plugin 'tpope/vim-markdown'
Plugin 'elzr/vim-json'

" }}}

" OTHER STUFF {{{1
Plugin 'tpope/vim-abolish'  "unix only stuff
Plugin 'tpope/vim-eunuch'   "search and stuff
Plugin 'bling/vim-airline'
"Plugin 'vim-scripts/ShowMarks'

Plugin 'rizzatti/funcoo.vim'
Plugin 'rizzatti/dash.vim'

Plugin 'gregsexton/gitv'
"Plugin 'airblade/vim-gitgutter'

Plugin 'terryma/vim-multiple-cursors'
Plugin 'wikitopian/hardmode'
Plugin 'majutsushi/tagbar'
"Plugin 'mbbill/undotree'
"Plugin 'myusuf3/numbers.vim'
"Plugin 'Yggdroot/indentLine'
"Plugin 'Lokaltog/vim-easymotion'

" }}}

call vundle#end()            
filetype plugin indent on   
