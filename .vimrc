set encoding=utf-8
" https://github.com/tpope/vim-pathogen
execute pathogen#infect()

"开启语法高亮
syntax on
"依文件类型设置自动缩进
filetype off
filetype indent plugin on
autocmd FileType html setlocal et sta sw=2 sts=2
autocmd FileType python setlocal et sta sw=4 sts=4

"自动对齐
set autoindent
set cindent

"智能选择对齐方式
set smartindent

set cursorcolumn " 高亮光标列
set cursorline " 高亮光标行

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

map <F5> :w<cr>:!python %<cr>

"启用Modeline（即允许被编辑的文件以注释的形式设置Vim选项
set modeline

"为深色背景调整配色
syntax enable
set background=dark
colorscheme solarized
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"

" window split
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 80
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%80v.*/
    autocmd FileType python set nowrap
augroup END

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'

" golang
Plugin 'fatih/vim-go'

Plugin 'scrooloose/nerdtree'
Plugin 'klen/python-mode'
" 自动补全
Plugin 'Valloric/YouCompleteMe'
" 快速插入代码片段
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
" 自动补全括号
Plugin 'Raimondi/delimitMate'
" zen coding
Plugin 'vim-scripts/Emmet.vim'
" 多语言的实时语法检查插件
" Plugin 'w0rp/ale'
" 检测分支 airline 依赖
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
" solarized 主题
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-scripts/taglist.vim'
Plugin 'kien/rainbow_parentheses.vim'
" 缩进标记
Plugin 'Yggdroot/indentLine'

" set nerdtree
map <F3> :NERDTreeToggle<CR>

let g:indentLine_color_term = 239
" let g:indentLine_char = '¦ ┆ ︙ │'
let g:indentLine_char = '┆'
"
" set pymode
let g:pymode_rope = 0
" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
" " Don't autofold code
let g:pymode_folding = 0

let g:UltiSnipsExpandTrigger = "<c-p>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" 定义存放代码片段的文件夹 .vim/snippets下，使用自定义和默认的，将会的到全局，有冲突的会提示
" let g:UltiSnipsSnippetDirectories=["snippets", "bundle/ultisnips/UltiSnips"]

" zen coding setting
let g:user_emmet_expandabbr_key = '<c-e>'
let g:use_emmet_complete_tag = 1

" 多语言的实时语法检查插件 ale
" let &runtimepath.=',~/.vim/bundle/ale'
" let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
" " run linters only when I save files
" " Write this in your vimrc file
" let g:ale_lint_on_save = 1
" let g:ale_lint_on_text_changed = 0
" " You can disable this option too
" " if you don't want linters to run on opening a file
" let g:ale_lint_on_enter = 0

"vim-airline config
"这个是安装字体后 必须设置此项"
set guifont=Hack:h10
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#syntastic#enabled=1
let g:airline_detect_paste=1
let g:airline_theme='solarized'

" 括号多彩
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 40
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

call vundle#end()
filetype plugin indent on    " required

" 记住上次编辑位置
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" 设置Ctags
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" 设置Ctags
" 按下F3就可以呼出了
map <F4> : Tlist<CR>
" 1为让窗口显示在右边，0为显示在左边
let Tlist_Use_Right_Window=1

" Enable goimports to automatically insert import paths instead of gofmt
let g:go_fmt_command = "goimports"

" syntax-highlighting for Functions, Methods and Structs
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" Go program run & build
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
