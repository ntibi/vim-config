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
    noremap glg :GitGutterToggle<CR>
    nmap ]h <plug>GitGutterNextHunk
    nmap [h <plug>GitGutterPrevHunk
    nmap ghs <plug>GitGutterStageHunk
    nmap ghS <plug>GitGutterUndoHunk

Plug 'https://github.com/scrooloose/nerdtree' " fs browser
    map <C-n> :NERDTreeToggle<CR>

Plug 'https://github.com/scrooloose/nerdcommenter' " (un)comment easily
    let g:NERDSpaceDelims = 1
    let g:NERDCompactSexyComs = 1
    let g:NERDCommentEmptyLines = 1
    map , <plug>NERDCommenterToggle
    map g; :call NERDComment('n', 'Append')<CR>

Plug 'https://github.com/crusoexia/vim-monokai' " monokai theme

Plug 'https://github.com/itchyny/lightline.vim' " nice statusline
" disable lightline.tabline to use vim-tabbar
    let g:lightline = {
                \'enable': { 'tabline': 0 },
                \'mode_map': {
                    \'n'      : 'NOR',
                    \'i'      : 'INS',
                    \'R'      : 'REP',
                    \'v'      : 'VIS',
                    \'V'      : 'V-L',
                    \"\<C-v>" : 'V-B',
                    \'c'      : 'CMD',
                    \'S'      : 'S-L',
                    \"\<C-s>" : 'S-B',
                    \'t'      : 'TER'},
                \}

Plug 'https://github.com/drmingdrmer/vim-tabbar' " opened files in tabs
    let g:vimtabbar_pattern=' {path}  '

" Plug 'https://github.com/jaxbot/semantic-highlight.vim' " it overrides some keywords :/
    " let g:semanticTermColors = [211, 213, 217, 219, 223, 225, 230, 231]

call plug#end()

colorscheme monokai

augroup vimrc " Changes to the colorscheme
    autocmd!
    autocmd ColorScheme *  hi TabLine      cterm=none  ctermfg=130  ctermbg=235
                        \| hi TabLineSel   cterm=none  ctermfg=202  ctermbg=238
                        \| hi TabLineFill  cterm=none  ctermfg=245  ctermbg=235
augroup END

catch
    echo v:exception
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

set laststatus=2


""" REMAPS:

noremap ; :

" scroll half-screen
nnoremap <C-j> <C-d>
nnoremap <C-k> <C-u>
vnoremap <C-j> <C-d>
vnoremap <C-k> <C-u>

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

" write file opened in non-root
cnoremap w!! w !sudo tee % > /dev/null


nnoremap gll :set number!<CR>
nnoremap glr :set relativenumber!<CR>

cnoremap <C-a> <Home>
cnoremap <C-e> <End>


""" VISUALS:

"colorscheme ron

"hi LineNr ctermfg=DarkGrey
"hi CursorLineNr ctermfg=LightBlue

"hi StatusLine   cterm=none ctermbg=236 ctermfg=51
"hi StatusLineNC cterm=none ctermbg=235 ctermfg=238

"hi VertSplit ctermfg=DarkGrey ctermfg=DarkGrey

"set statusline=\ 
"set statusline+=%{&modified?\"+\":\"\ \"}\ 
"set statusline+=%f
"set statusline+=\ 
"set statusline+=%y
"set statusline+=\ 
"set statusline+=%r
"set statusline+=\ 
"set statusline+=%=
"set statusline+=[%{&fenc},%{&ff}]
"set statusline+=\ 
"set statusline+=[%l,%v]
"set statusline+=[%p%%]

