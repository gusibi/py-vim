cp .vimrc ~/.vimrc

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# https://github.com/tpope/vim-pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# install plugininstall
vim +PluginInstall +qall

# Compiling YCM
# https://github.com/Valloric/YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
