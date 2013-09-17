"开启语法高亮
syntax on
"依文件类型设置自动缩进
filetype on
filetype indent plugin on
autocmd FileType html setlocal et sta sw=2 sts=2
autocmd FileType python setlocal et sta sw=4 sts=4

"自动对齐      
set autoindent  
set cindent

"智能选择对齐方式      
set smartindent 

"tab为4个空格      
set tabstop=4  
  
"当前行之间交错时使用4个空格      
set shiftwidth=4 

" 使用Backspace
set nocompatible
set backspace=indent,eol,start

" 高亮搜索结果
set hlsearch

"快速匹配      
set incsearch  
 
"显示当前的行号列号：
set ruler
"在状态栏显示正在输入的命令
set showcmd

" 粘贴模式
set pastetoggle=<F12>
 
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

" window split
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
Bundle 'honza/vim-snippets'
Bundle 'msanders/snipmate.vim'
Bundle 'ervandew/supertab'
Bundle 'vim-scripts/taglist.vim'

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

let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['ruby'] = 'ruby,ruby-rails,ruby-1.9'

" 记住上次编辑位置
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" zen coding setting
let g:user_emmet_expandabbr_key = '<c-e>'
let g:use_emmet_complete_tag = 1

" 设置SuperTab
let g:SuperTabRetainCompletionType="context"

" 设置Ctags
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>  

" 设置Ctags
" 按下F3就可以呼出了
map <F4> : Tlist<CR> 
" 1为让窗口显示在右边，0为显示在左边 
let Tlist_Use_Right_Window=1
