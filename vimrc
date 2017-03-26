syntax on

set whichwrap +=<,>,[,],h,l
set backspace +=eol,start,indent

set number
set relativenumber
set numberwidth=1

set wildmenu
set showcmd

set lazyredraw

set showmatch

set incsearch
set hlsearch

colorscheme ron

cmap w!! w !sudo tee % > /dev/null

highlight LineNr ctermfg=DarkGrey
highlight CursorLineNr ctermfg=LightBlue

