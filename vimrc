""" PLUGINS:

try
call plug#begin('~/.vim/plugged')

Plug 'https://github.com/luochen1990/rainbow' " rainbow paren
    let g:rainbow_active = 1
Plug 'https://github.com/itchyny/vim-cursorword' " underline all matches of the word at point
Plug 'https://github.com/vim-scripts/a.vim' " :A to open corresponding .{c,h,cpp,hpp}
Plug 'https://github.com/godlygeek/tabular' " :Tabularize (M-x align)

Plug 'https://github.com/mbbill/undotree' " undo tree
    noremap <C-x>u :UndotreeToggle<CR>
    let g:undotree_SetFocusWhenToggle=1
    let g:undotree_WindowLayout=4
    function g:Undotree_CustomMap()
        nmap <buffer> U <plug>UndotreeGoNextState
        nmap <buffer> u <plug>UndotreeGoPreviousState
    endfunc

Plug 'https://github.com/justinmk/vim-syntax-extra' " more syntax highlight definitions

Plug 'https://github.com/airblade/vim-gitgutteR' " git status in line gutter
    noremap gl :GitGutterToggle<CR>
    nmap ]h <Plug>GitGutterNextHunk
    nmap [h <Plug>GitGutterPrevHunk
    nmap ghs <Plug>GitGutterStageHunk
    nmap ghS <Plug>GitGutterUndoHunk

Plug 'https://github.com/scrooloose/nerdtree' " fs browser
    map <C-n> :NERDTreeToggle<CR>

Plug 'https://github.com/crusoexia/vim-monokai' " monokai theme

call plug#end()

colorscheme monokai

catch
endtry


""" OPTIONS:

syntax on

set whichwrap +=<,>,[,],h,l
set backspace +=eol,start,indent

set number
set relativenumber
set numberwidth=1

set wildmenu
set wildmode=list:longest,full
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

set scrolloff=7

set t_Co=256


""" REMAPS:

noremap ; :

" scroll half-screen
nnoremap <C-j> <C-d>
nnoremap <C-k> <C-u>

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
inoremap {} {}<Left>

" hjkl in cmd mode
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>

vnoremap <Tab> >
vnoremap <S-Tab> <

nnoremap + <C-a>
nnoremap - <C-x>

nnoremap U <C-r>
inoremap <C-r> <C-o>u

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

" colorscheme ron
" 
" hi LineNr ctermfg=DarkGrey
" hi CursorLineNr ctermfg=LightBlue
" 
" hi StatusLine   cterm=none ctermbg=236 ctermfg=51
" hi StatusLineNC cterm=none ctermbg=235 ctermfg=238
" 
" hi VertSplit ctermfg=DarkGrey ctermfg=DarkGrey

set laststatus=2
set statusline=\ 
set statusline+=%{&modified?\"+\":\"\ \"}\ 
set statusline+=%f
set statusline+=\ 
set statusline+=%y
set statusline+=\ 
set statusline+=%r
set statusline+=\ 
set statusline+=%=
set statusline+=[%{&fenc},%{&ff}]
set statusline+=\ 
set statusline+=[%l,%v]
set statusline+=[%p%%]

