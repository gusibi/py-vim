"开启语法高亮
syntax on
"依文件类型设置自动缩进
filetype indent plugin on
autocmd FileType python setlocal et sta sw=4 sts=4

" 使用Backspace
set nocompatible
set backspace=indent,eol,start

" 高亮搜索结果
set hlsearch
 
"显示当前的行号列号：
set ruler
"在状态栏显示正在输入的命令
set showcmd
 
"显示行号：
set number
"为方便复制，用<F2>开启/关闭行号显示:
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>

"启用Modeline（即允许被编辑的文件以注释的形式设置Vim选项
set modeline

"为深色背景调整配色
syntax enable
set background=dark
set t_Co=256
let g:solarized_termcolors=256
"colorscheme solarized

" window Split
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

augroup vimrc_autocmds
	autocmd!
	" highlight characters past column 80
	autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
	autocmd FileType python match Excess /\%80v.*/
	autocmd FileType python set nowrap
augroup END

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'davidhalter/jedi-vim'
Bundle 'klen/python-mode'

" zen coding
Bundle 'vim-scripts/Emmet.vim'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'altercation/vim-colors-solarized'

" Powerline setup
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
set laststatus=2
let g:Powerline_symbols='fancy' 

" set nerdtree
map <F3> :NERDTreeToggle<CR>

let g:pymode_rope = 0
" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
" Don't autofold code
let g:pymode_folding = 0

" 记住上次编辑位置
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
