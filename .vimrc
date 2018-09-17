" Specify a directory for plugins 
call plug#begin('~/.vim/plugged')

"以安装ycm插件为例
" 文件树
Plug 'scrooloose/nerdtree'
" 文件树 git
Plug 'Xuyuanp/nerdtree-git-plugin'
" 文件搜索
Plug 'kien/ctrlp.vim'
" vim 命令行
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" 文件搜素
Plug 'rking/ag.vim'
" 智能提示
Plug 'Valloric/YouCompleteMe'
" vim 主题
Plug 'tomasr/molokai'
" 代码class list
Plug 'majutsushi/tagbar'
" vim git
Plug 'airblade/vim-gitgutter'
Plug 'ybian/smartim'
" 代码对其
Plug 'Chiel92/vim-autoformat'


" Initialize plugin system
call plug#end()

" Switch syntax highlighting on, when the terminal has colors
" if (t_Co > 2 || has("gui_running")) && !exists("syntax_on")
"  syntax on
" endif

" Javascript syntax hightlight
syntax enable

" Set syntax highlighting for specific file types
autocmd BufRead,BufNewFile Appraisals set filetype=ruby
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd Syntax javascript set syntax=jquery

" Color scheme
colorscheme molokai
highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0

" NERD tree
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

" Tagbar
let g:tagbar_width=35
let g:tagbar_autofocus=1
nmap <F6> :TagbarToggle<CR>
let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'

" ctrap
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

let g:gitgutter_terminal_reports_focus=0
"custom keys
let mapleader=","
let maplocalleader=","

set iskeyword -=.
set helplang=en
"I don't like swap files
set noswapfile

"turn on numbering
set background=dark
set number
set relativenumber
"set mouse=a
set autoindent
set hlsearch incsearch
set shiftwidth=4
set tabstop=4
set expandtab
set ruler
colorscheme molokai

"设置显示结尾符号
"set list
"设置不折行
"set nowrap

"突出显示行和列
set cursorline
set cursorcolumn
set backupcopy=yes

set showtabline=1
set nofoldenable

"搜索是忽略大小写,禁止从头开始搜索
set ignorecase smartcase
"set nowrapscan
" }}}
"ag 搜索
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files.
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " Ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
"代码对其"
noremap <F3> :Autoformat<CR>
