
"""""""""""""""""""""""""""""""""""""""""""""""
" => Vim插件管理
"""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'             " 文件树
Plug 'Xuyuanp/nerdtree-git-plugin'     " 文件树 git
Plug 'kien/ctrlp.vim'                  " 文件搜索
Plug 'vim-airline/vim-airline'         " vim 命令行 
Plug 'vim-airline/vim-airline-themes'
Plug 'rking/ag.vim'                    " 文件搜素 
Plug 'Valloric/YouCompleteMe'          " 智能提示
Plug 'tomasr/molokai'                  " vim 主题
Plug 'majutsushi/tagbar'               " 代码class list
Plug 'airblade/vim-gitgutter'          " vim git
Plug 'ybian/smartim'
Plug 'Chiel92/vim-autoformat'          " 代码对其
Plug 'pangloss/vim-javascript'
Plug 'crusoexia/vim-javascript-lib'
Plug 'ybian/smartim'

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>常规
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable                  " 设置语法高亮
set ruler                      " 打开状态栏标尺
set autoread                   " 当文件被改动时自动加载
set number                     " 设置行号
set helplang=en                " 设置帮助语言
set tabstop=2                  " tab宽度
set shiftwidth=2               " tab自动缩进宽度
set autoindent                 " 设置自动缩进
set hlsearch                   " 高亮搜索项
set incsearch                  " 当输入时就搜索
set expandtab                  " 使用spcae代替tab
set relativenumber             " 相对行号
"set mouse=a
set nowrap                     " 设置不折行
set list                       " 设置显示结尾符号
set cursorline                 " 突出显示行
set cursorcolumn               " 突出显示列
set ignorecase                 " 搜索是忽略大小写
set smartcase                  " 禁止从头开始搜索
set background=dark            "  
set noswapfile
set backupcopy=yes
set showtabline=1
set nofoldenable
"set nowrapscan
set backspace=indent,eol,start " 退格

set foldmethod=syntax
set iskeyword -=.

let mapleader=","              " 设置主键为,
let maplocalleader=","


""""""""""""""""""""""""""""""""""""""""""""""""
" => custom keys
""""""""""""""""""""""""""""""""""""""""""""""""


" 剪切复制
vmap <C-x> :!pbcopy<CR>  
vmap <C-c> :w !pbcopy<CR><CR> 

nmap w= :resize +3<CR>
nmap w- :resize -3<CR>
nmap w, :vertical resize -3<CR>
nmap w. :vertical resize +3<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""
" =>  Color scheme
"""""""""""""""""""""""""""""""""""""""""""""""""

colorscheme molokai
highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0





"""""""""""""""""""""""""""""""""""""""""""""""""
" =>  ag 搜索
"""""""""""""""""""""""""""""""""""""""""""""""""
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files.
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " Ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

"""""""""""""""""""""""""""""""""""""""""""""""""
" =>  "代码对其"
"""""""""""""""""""""""""""""""""""""""""""""""""
noremap <F3> :Autoformat<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""
" =>   NERD tree
"""""""""""""""""""""""""""""""""""""""""""""""""
let NERDChristmasTree=0
let NERDTreeWinSize=35
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
" Automatically open a NERDTree if no files where specified
autocmd vimenter * if !argc() | NERDTree | endif
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Open a NERDTree
nmap <F5> :NERDTreeToggle<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""
" =>   Tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""
let g:tagbar_width=35
let g:tagbar_autofocus=1
nmap <F6> :TagbarToggle<CR>
let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'

"""""""""""""""""""""""""""""""""""""""""""""""""
" =>   ctrap
"""""""""""""""""""""""""""""""""""""""""""""""""
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }


""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent

au FileType javascript imap <c-t> AJS.log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi

au FileType javascript inoremap <buffer> $r return
au FileType javascript inoremap <buffer> $f //--- PH ----------------------------------------------<esc>FP2xi

let g:SimpleJsIndenter_BriefMode=1

function! JavaScriptFold()
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
    return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction


" Set syntax highlighting for specific file types
autocmd BufRead,BufNewFile Appraisals set filetype=ruby
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd Syntax javascript set syntax=jquery



let g:gitgutter_terminal_reports_focus=0


let g:smartim_default = 'com.apple.keylayout.ABC'


