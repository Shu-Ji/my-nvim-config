" 使用 Python3
let g:python3_host_prog = '/Library/Frameworks/Python.framework/Versions/3.8/bin/python3'
let g:python_host_prog = '/usr/local/Cellar/python@2/2.7.16/bin/python2.7'
" 禁用 Ruby、Perl
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0


" 使用 vim-plug 作为插件管理器
call plug#begin('~/.config/nvim/plugged')

" 缩进指示线
Plug 'Yggdroot/indentLine'

" 主题
Plug 'morhetz/gruvbox'

" nginx
Plug 'chr4/nginx.vim'

" pug jade
Plug 'dNitro/vim-pug-complete', { 'for': ['jade', 'pug'] }
Plug 'digitaltoad/vim-jade'


" ctags
Plug 'majutsushi/tagbar'

Plug 'kchmck/vim-coffee-script'
" 生成新的 tags：
" https://vimawesome.com/plugin/coffeetags
" sudo gem install CoffeeTags
" coffeetags -R -f my.tags
"  追加到已有的 tags：
" coffeetags -R -a my.tags
Plug 'lukaszkorecki/coffeetags'

" 自动补全
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" js
Plug 'carlitux/deoplete-ternjs', { 'do': 'yarn global add tern' }
" 补全 Python
Plug 'deoplete-plugins/deoplete-jedi'
" 自动缩进
Plug 'vim-scripts/indentpython.vim'

" 前端很多的库支持
Plug 'othree/javascript-libraries-syntax.vim'

" 代码高亮
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

" 自动补全括号和引号等
Plug 'jiangmiao/auto-pairs'

" markdown
"Plug 'godlygeek/tabular'
"Plug 'plasticboy/vim-markdown'

" buffer tab
Plug 'ap/vim-buftabline'
" minibuffer
"Plug 'fholgado/minibufexpl.vim'

Plug 'editorconfig/editorconfig-vim'

" vue
"Plug 'posva/vim-vue'
"jsx
Plug 'maxmellon/vim-jsx-pretty'
" Prettier - automatically format file according to rules/editorconfig
"Plug 'prettier/vim-prettier'
"Plug 'othree/xml.vim'
"Plug 'othree/html5.vim'
Plug 'cakebaker/scss-syntax.vim'
" 左左侧显示 git +-等红绿信息
Plug 'airblade/vim-gitgutter'

" 状态栏
Plug 'vim-airline/vim-airline'
" 状态栏主题设置
Plug 'vim-airline/vim-airline-themes'
" 在这里选取一下，记住名字即可 https://github.com/vim-airline/vim-airline/wiki/Screenshots
"  这里我用默认的就好了，省得纠结用哪个
"let g:airline_theme='${theme}'

" 注释
Plug 'scrooloose/nerdcommenter'

" 几乎所有语言的 lint
Plug 'dense-analysis/ale'

" python import sort
Plug 'fisadev/vim-isort'

" ctrlp
Plug 'ctrlpvim/ctrlp.vim'
" 用 python 加速 ctrlp 搜索
Plug 'FelikZ/ctrlp-py-matcher'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" html
Plug 'mattn/emmet-vim'

" 代码自动格式化
Plug 'sbdchd/neoformat'
" 自动格式化
"Plug 'Chiel92/vim-autoformat'

" Python 代码跳转
Plug 'davidhalter/jedi-vim'

call plug#end()


" ctags 中显示 coffeescript 变量
let g:CoffeeAutoTagIncludeVars=1

"  支持 补全的前端库
let g:used_javascript_libs = 'jquery,underscore,angularjs,react,vue'


nmap <F8> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
" 打开文件时自动打开tagbar
"autocmd BufEnter *.* :TagbarOpen


" disable autocompletion, cause we use deoplete for completion
let g:jedi#completions_enabled = 0
" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_stubs_command = "<leader>s"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>u"
let g:jedi#rename_command = "<leader><F6>"


" minibuffer
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplorerMoreThanOne = 0
let g:miniBufExplModSelTarget = 0
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplVSplit = 15
let g:miniBufExplSplitBelow=0
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let g:bufExplorerSortBy = "name"

" leader 配置
let mapleader = ';'
nnoremap <leader>q :q<CR>
" tab转换为4个空格tab to space
map <leader>t2s :%s/<tab>/    /g<CR>
" 快速保存
nmap <leader>w :w!<cr>
nmap <leader>fd :se ff=dos<cr>
nmap <leader>fu :se ff=unix<cr>
" 快速编辑配置文件
nmap <silent> <leader>ee :e ~/.config/nvim/init.vim<CR>
nmap <silent> <leader>ss :so ~/.config/nvim/init.vim<CR>

" 取消高亮
noremap <silent><leader>/ :nohls<CR>
" 全选
map <Leader>sa ggVG"
" pip install yapf
nmap <Leader>l :Neoformat<cr>
" 新建
map <leader>tn :tabnew<cr>
" 运行
func! Run()
    exec "w"
    if &filetype == 'python'
        exec "!python %"
    elseif &filetype == 'sh'
        exec "!bash %"
    elseif &filetype == 'javascript'
        exec "!node %"
    elseif &filetype == 'javascript.jsx'
        exec "!node %"
    elseif &filetype == 'swift'
        exec "!swift %"
    elseif &filetype == 'ts'
        exec "!tsc %"
    elseif &filetype == 'java'
        exec "!javac % && java %<"
    elseif &filetype == 'c'
        exec "!g++ % -o %<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
    endif
endfunc
map <leader>r :call Run()<CR>
inoremap jj <Esc>
" Ctrl-n切换相对与绝对行号
nnoremap <C-n> :call NumberToggle()<cr>

" 行首、行尾行尾
noremap H ^
noremap L $
" 0 到最第一个字符
map 0 ^
" 加速翻页
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>
" 移除缩进线
nnoremap <F3> :IndentLinesToggle<CR>
nnoremap <F4> :set wrap! wrap?<CR>
" ;v 选中块
nnoremap <leader>v V`}

" U redo
nnoremap U <C-r>

" 上下添加空行
nmap t o<ESC>k
nmap T O<ESC>j

" 方向键控制 buffer
noremap <left> :bp<CR>
noremap <right> :bn<CR>

" > <符号缩进
vnoremap < <gv
vnoremap > >gv

au FocusLost * :set number
au FocusGained * :set relativenumber
" 插入模式下用绝对行号, 普通模式下用相对
autocmd InsertEnter * :set norelativenumber | set number
autocmd InsertLeave * :set relativenumber
function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set nonumber
        set relativenumber
    endif
endfunc

"  设置主题
colorscheme gruvbox


map <leader>n :NERDTreeToggle<CR>
" 最后一个窗口的时候关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" nerdtree 会自己 focus 自己所在窗口，这里到文件
augroup NERD
    au!
    " 打开文件时自动打开NERDTree
    "autocmd VimEnter * NERDTree
    "autocmd VimEnter * wincmd p
augroup END

" 注释
" 注释符后面自动添加空格
let g:NERDSpaceDelims = 1
" 取消注释后删除注释符后的空格
let g:NERDTrimTrailingWhitespace = 1
" 启用NERDCommenterToggle以检查所有选定的行是否已注释
let g:NERDToggleCheckAllLines = 1
" 允许注释和倒空行（在注释区域时很有用）
let g:NERDCommentEmptyLines = 1

" deoplete-jedi Python 补全
" 自启动
let g:deoplete#enable_at_startup = 1
" 自动补全提示默认 ctrl-n 下翻页， 添加劫持 tab
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" 自动补全提示默认 ctrl-p 下翻页，添加劫持 s-tab
inoremap <expr><S-tab> pumvisible() ? "\<c-p>" : "\<tab>"
" 函数方法 Preview 的窗口自动关闭
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" Preview 窗口设为在当前窗口下面打开
set splitbelow

" ale lint
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'
let g:airline#extensions#ale#enabled = 1
" 格式显示的文字
let g:ale_echo_msg_format = '[%linter%][%severity%] %s'
" 跳转到下/上 一个问题点
nmap <silent> <leader>k <Plug>(ale_previous_wrap)
nmap <silent> <leader>j <Plug>(ale_next_wrap)
" 指定修复 pep8 错误的 fixer
let g:ale_fixers = {'python': ['remove_trailing_lines', 'trim_whitespace', 'yapf', 'isort']}
" 修复语法和格式错误 ctr + shift + l"
nnoremap <C-S-l> :ALEFix<CR>

" 关闭与vi的兼容模式
set nocompatible


" 显示绝对行号
set number

" 显示相对行号
set rnu

" 不自动折行
set wrap

" 显示匹配的括号
set showmatch

" 距离顶部和底部3行
set scrolloff=3

" 通用的 utf8 编码，避免乱码
set fenc=utf-8

" 启用鼠标(可以用鼠标点击之类的，但是就不能复制了)
"set mouse=a
" 则点击光标不会换,用于复制
set mousemodel=popup
set selection=exclusive
set selectmode=mouse,key

" 搜索时忽略大小写
set ignorecase
" 有一个或以上大写字母时仍大小写敏感
set smartcase

"Smart indent
set smartindent

" 标尺线
set cc=80

" 代码折叠
set foldmethod=indent
" 设置折叠区域的宽度
set foldcolumn=0
" 设置折叠层数为
setlocal foldlevel=99
" 打开文件是默认不折叠代码
set foldlevelstart=99
" 设置快捷键为空格
noremap <space> za

" 语法高亮
syntax on

" 开启自动识别文件类型，并根据文件类型加载不同的插件和缩进规则
filetype plugin indent on

" yy直接复制到系统剪切板（For macvim）
set clipboard=unnamed

" w!!写入只读文件
cmap w!! w !sudo tee >/dev/null %

"ctr + j 每次移动4行
"nnoremap <C-j> 4j
"nnoremap <C-k> 4k
"
" 分屏窗口移动
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Spaces & Tabs {{{
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " tabs are space
set autoindent
set copyindent      " copy indent from the previous line
" 显示TAB字符为<+++
set list
set list listchars=tab:<+
" }}} Spaces & Tabs

set wildignore=*.swp,*.bak,*.pyc,*.class,*.obj,*.o,*.map,*~

" 如遇Unicode值大于255的文本，不必等到空格再折行。
set formatoptions+=m
" 合并两行中文时，不在中间加空格：
set formatoptions+=B


" ctrlp
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\.(git|hg|svn)$|.rvm$\|\.wsgic$\|\.gif$\|\.png$\|\.jpg$\|\.bmp$\|\.pyc$\|\.pyo$|\vnode_modules$|\.map$'
set wildignore+=node_modules
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

" 用 python 加速 ctrlp 搜索
" 需要插件 Plug 'FelikZ/ctrlp-py-matcher'
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" 备份,到另一个位置. 防止误删
set backup
set backupext=.bak
set backupdir=~/.backup-vim-edited-files
set noswapfile

" 突出显示当前行列 不喜欢这种定位可注解
set cursorcolumn
" 突出显示当前行
set cursorline

"设置 退出vim后，内容显示在终端屏幕, 可以用于查看和复制
"好处：误删什么的，如果以前屏幕打开，可以找回
"nvim 拒绝劫持！！！！！
" set t_ti= t_te=

" create undo file
set undolevels=10000         " How many undos
set undoreload=10000        " number of lines to save for undo
set undofile                " keep a persistent backup file
set undodir=~/.backup-vim-undo/

"删除多余空格
" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite * :call DeleteTrailingWS()

" For regular expressions turn magic on
set magic

" 记住上次离开的光标位置
autocmd BufReadPost *
            \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
            \ |   exe "normal! g`\""
            \ | endif


autocmd BufWritePost * GitGutter