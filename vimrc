""" OPTIONS:

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

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set noeol

set nowrap


""" REMAPS:

noremap ; :

"clear highlight on redraw
noremap <C-l> <C-l>:nohlsearch<CR>

" C-[ae] for beginning/end of line
nnoremap <C-a> 0
nnoremap <C-e> $
inoremap <C-a> <C-o>0
inoremap <C-e> <C-o>$

" move text faster
nnoremap <M-up> :move -2<CR>
nnoremap <M-down> :move +1<CR>
vnoremap <M-up> :move '<-2<CR>gv
vnoremap <M-down> :move '>+1<CR>gv

" better next/prev buffer
nnoremap J :bprevious<CR>
nnoremap K :bnext<CR>

vnoremap <C-n> :normal

" autopair
inoremap '' ''<Left>
inoremap "" ""<Left>
inoremap () ()<Left>
inoremap [] []<Left>
inoremap <> <><Left>

" hjkl in cmd mode
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>

vnoremap <Tab> >
vnoremap <S-Tab> <

nnoremap + <C-a>
nnoremap - <C-x>

" write file opened in non-root
cnoremap w!! w !sudo tee % > /dev/null

let s:comment_map = {
    \   "c": '\/\/',
    \   "cpp": '\/\/',
    \   "python": '#',
    \   "conf": '#',
    \   "lisp": ';',
    \   "zsh": '#',
    \   "vim": '"',
    \   "sh": '#',
    \ }

let s:default_comment = "#"

function! ToggleComment()
    if has_key(s:comment_map, &filetype)
        let comment_leader = s:comment_map[&filetype]
    else
        if strlen(&filetype) != 0
            echo "set a comment type for filetype" &filetype
        end
        let comment_leader = s:default_comment
    end
    if getline('.') =~ "^\\s*" . comment_leader . " "
        " Uncomment the line
        execute "silent s/^\\(\\s*\\)" . comment_leader . " /\\1/"
    else
        if getline('.') =~ "^\\s*" . comment_leader
            " Uncomment the line
            execute "silent s/^\\(\\s*\\)" . comment_leader . "/\\1/"
        else
            " Comment the line
            execute "silent s/^\\(\\s*\\)/\\1" . comment_leader . " /"
        end
    end
endfunction

nnoremap , :call ToggleComment()<cr>
vnoremap , :call ToggleComment()<cr>


""" VISUALS:

colorscheme ron

highlight LineNr ctermfg=DarkGrey
highlight CursorLineNr ctermfg=LightBlue
