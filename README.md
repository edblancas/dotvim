Para instalar por primera vez o actualizar los plugins con Vundle:
    
    vim +BundleInstall! +BundleClean +qall

Para compilar por primera vez YouCompleteMe:
    
    Compiling YCM with semantic support for C-family languages:

        cd ~/.vim/bundle/YouCompleteMe
        ./install.sh --clang-completer

    Compiling YCM without semantic support for C-family languages:

        cd ~/.vim/bundle/YouCompleteMe
        ./install.sh
