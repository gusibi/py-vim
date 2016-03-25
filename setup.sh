cp .vimrc ~/.vimrc

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# install plugininstall
vim +PluginInstall +qall

# Compiling YCM
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
