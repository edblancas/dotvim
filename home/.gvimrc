set guioptions=agi
set lines=999 columns=9999
set guioptions+=e   " For tabs GUI
if has('unix') && !has('macunix') && !has('win32unix')
    set guifont=Menlo\ for\ Powerline\ 10
elseif has("macunix")
    set guifont=Menlo\ for\ Powerline:h14
    set transparency=0
endif
