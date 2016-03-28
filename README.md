py-vim
======

python vim 环境配置

## 配置指南 ##
###安装 Vundle###

    sh setup.sh

如果需要有依赖需要安装 手动安装(ctags cMake...)

### 高亮超出行长度的部分 ###

修改.vimrc  添加

    augroup vimrc_autocmds
        autocmd!
        " highlight characters past column 80
        autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
        autocmd FileType python match Excess /\%80v.*/
        autocmd FileType python set nowrap
    augroup END

### 安装powerline ###

[powerline](https://github.com/Lokaltog/powerline)

修改.vimrc, 添加
    Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

重启vim 输入以下命令
    :BundleInstall

powerline 安装成功

#### 配置powerline ####
修改 .vimrc 添加

    " Powerline setup
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
    set laststatus=2
#### vim powerline 错误解决####

在终端下打开vim 使用powerline 可能会遇到 python 支持问题
解决方式 是重新编译安装vim

    sudo apt-get install libx11-dev libxt-dev python python2.7-dev
    hg clone https://vim.googlecode.com/hg/ vim_source && cd vim_source && \
    ./configure --disable-nls --enable-multibyte --with-tlib=ncurses \
    --enable-pythoninterp --enable-rubyinterp --with-features=huge && \
    make -j 3 && sudo make install

重新安装powerline

### 安装 NerdTree ###
修改 .vimrc 添加
    Bundle 'scrooloose/nerdtree'
重启vim 输入以下命令
    :BundleInstall

绑定F2 
    map <F2> :NERDTreeToggle<CR> 

### 安装 NerdTree ###
修改 .vimrc 添加
    Bundle 'klen/python-mode'
重启vim 输入以下命令
    :BundleInstall

### 安装 Jedi vim ###
修改 .vimrc 添加
    Bundle 'davidhalter/jedi-vim'
重启vim 输入以下命令
    :BundleInstall

### 其他设置 ###

参考vimrc

