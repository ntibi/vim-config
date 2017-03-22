syntax on

set whichwrap +=<,>,[,],h,l
set backspace +=eol,start,indent

set relativenumber

set wildmenu
set showcmd

set lazyredraw

set showmatch

set incsearch
set hlsearch

colorscheme ron

cmap w!! w !sudo tee % > /dev/null

highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey

