echo '--> Symlinking...' < `tty` > `tty`
homesick link dotvim-castle < `tty` > `tty`

if [ ! -d $HOME/.vim/bundle/Vundle.vim/.git/ ]
then
	echo '--> Cloning Vundle.vin into ~/vim/bundle...' < `tty` > `tty`
	git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim < `tty` > `tty`
fi

echo '--> Installing vim plugins with vundle...' < `tty` > `tty`
vim +PluginInstall! +PluginClean +qall < `tty` > `tty`

echo '--> Done! Happy Vimming! :x' < `tty` > `tty`
