""" PLUGINS:

try
call plug#begin('~/.vim/plugged')
catch
endtry

if exists(':Plug')
    Plug 'https://github.com/luochen1990/rainbow' " rainbow paren
    let g:rainbow_active = 1

    Plug 'https://github.com/itchyny/vim-cursorword' " underline all matches of the word at point

    Plug 'https://github.com/vim-scripts/a.vim' " :A to open corresponding .{c,h,cpp,hpp}

    Plug 'https://github.com/godlygeek/tabular' " :Tabularize (M-x align)

    Plug 'https://github.com/mbbill/undotree' " undo tree
    noremap <C-x>u :UndotreeToggle<CR>
    let g:undotree_SetFocusWhenToggle=1
    let g:undotree_WindowLayout=4
    function! g:Undotree_CustomMap()
        nmap <buffer> U <plug>UndotreeGoNextState
        nmap <buffer> u <plug>UndotreeGoPreviousState
    endfunc

    Plug 'https://github.com/justinmk/vim-syntax-extra' " more syntax highlight definitions

    Plug 'https://github.com/airblade/vim-gitgutteR' " git status in line gutter
    noremap <leader>tg :GitGutterToggle<CR>
    nmap ]h <plug>(GitGutterNextHunk)
    nmap [h <plug>(GitGutterPrevHunk)
    nmap ghs <plug>(GitGutterStageHunk)
    nmap ghS <plug>(GitGutterUndoHunk)

    Plug 'https://github.com/scrooloose/nerdtree' " fs browser
    map <C-n> :NERDTreeToggle %<CR>
    let NERDTreeMinimalUI = 1

    Plug 'https://github.com/scrooloose/nerdcommenter' " (un)comment easily
    let g:NERDSpaceDelims = 1
    let g:NERDCompactSexyComs = 0
    let g:NERDCommentEmptyLines = 1
    map <leader>c <plug>NERDCommenterToggle
    map <leader>a :call NERDComment('n', 'Append')<CR>
    let g:NERDCustomDelimiters = { 'wgsl': { 'left': '//' } }

    Plug 'https://github.com/crusoexia/vim-monokai' " monokai theme

    Plug 'https://github.com/itchyny/lightline.vim' " nice statusline
    " functions for component_function:
    function! PassiveOrActive()
        if exists('g:syntastic_mode_map')
            if g:syntastic_mode_map['mode'] == 'active'
                return 'A'
            else
                return 'p'
            endif
        else
            return ' '
        endif
    endfunction
    " disable lightline.tabline to use vim-tabbar
    let g:lightline = {
                \'colorscheme': 'powerline',
                \'enable': { 'statusline': 1, 'tabline': 0 },
                \'active': {
                \               'left': [ ['mode', 'paste'], ['readonly', 'filename', 'branch', 'modified'] ],
                \               'right': [ ['lineinfo'], ['percent'], ['syntastic', 'fileformat', 'fileencoding', 'filetype'] ]
                \          },
                \'component':   {
                \                'dot': '"%{@.}"',
                \               },
                \'component_function':   {
                \                'syntastic': 'PassiveOrActive',
                \               },
                \'mode_map': {
                \               'n'      : 'NOR',
                \               'i'      : 'INS',
                \               'R'      : 'REP',
                \               'v'      : 'VIS',
                \               'V'      : 'V-L',
                \               "\<C-v>" : 'V-B',
                \               'c'      : 'CMD',
                \               'S'      : 'S-L',
                \               "\<C-s>" : 'S-B',
                \               't'      : 'TER',
                \            },
                \}

    Plug 'https://github.com/ap/vim-buftabline' " nice tabs
    let g:buftabline_show = 1
    let g:buftabline_indicators = 1
    nmap g1 <plug>BufTabLine.Go(1)
    nmap g2 <plug>BufTabLine.Go(2)
    nmap g3 <plug>BufTabLine.Go(3)
    nmap g4 <plug>BufTabLine.Go(4)
    nmap g5 <plug>BufTabLine.Go(5)
    nmap g6 <plug>BufTabLine.Go(6)
    nmap g7 <plug>BufTabLine.Go(7)
    nmap g8 <plug>BufTabLine.Go(8)
    nmap g9 <plug>BufTabLine.Go(9)
    nmap g0 <plug>BufTabLine.Go(10)
    noremap <leader>tt :call buftabline#update(0)<CR>

    Plug 'windwp/nvim-autopairs'

    Plug 'https://github.com/easymotion/vim-easymotion'
    let g:EasyMotion_do_mapping = 0
    let g:EasyMotion_do_shade = 0
    map <C-f> <Plug>(easymotion-bd-f)
    let g:EasyMotion_keys = 'ajsklhdfgweoincvb'

    " Plug 'https://github.com/vim-syntastic/syntastic'
    " let g:syntastic_c_include_dirs = ['./', './include', '../include']
    " let g:syntastic_c_compiler_options = '-std=gnu99 -pedantic -Wall -Wextra -masm=intel'
    " let g:syntastic_c_check_header = 1
"
    " let g:syntastic_cpp_include_dirs = ['./', './include', '../include']
    " let g:syntastic_cpp_compiler_options = "-std=c++11 -pedantic -Wall -Wextra -masm=intel"
    " let g:syntastic_cpp_check_header = 1
"
    " function! SyntasticGcc()
        " let g:syntastic_asm_compiler = 'gcc'
    " endfunction
    " function! SyntasticClang()
        " let g:syntastic_asm_compiler = 'clang'
    " endfunction
"
    " function! SyntasticOsDev() " kernel developpement mode
        " let g:syntastic_cpp_compiler_options = '-pedantic -Wall -Wextra -ffreestanding -nostdlib -masm=intel -fno-exceptions -fno-rtti -fno-builtin -fno-stack-protector -nodefaultlibs'
        " let g:syntastic_c_compiler_options = '-std=gnu99 -pedantic -Wall -Wextra -ffreestanding -nostdlib -masm=intel'
    " endfunction
"
    " let g:syntastic_asm_dialect = 'intel'
    " function! SyntasticNasm()
        " let g:syntastic_asm_compiler = 'nasm'
    " endfunction
    " function! SyntasticAs()
        " let g:syntastic_asm_compiler = 'gcc'
    " endfunction
"
    " let g:syntastic_always_populate_loc_list = 1
    " let g:syntastic_auto_loc_list = 2
    " let g:syntastic_check_on_open = 0
    " let g:syntastic_check_on_wq = 0
    " function! SyntasticCheckHook(errors)
        " if !empty(a:errors)
            " let g:syntastic_loc_list_height = min([len(a:errors), winheight('%') / 6])
        " endif
    " endfunction
    " noremap <leader>ts :SyntasticToggleMode<CR>

    " Plug 'Quramy/tsuquyomi'
    " let g:tsuquyomi_completion_detail = 1

    Plug 'rust-lang/rust.vim'
    let g:rustfmt_autosave = 1

    Plug 'neovim/nvim-lspconfig'

    Plug 'https://github.com/junegunn/fzf.vim'
    set rtp+=~/.fzf
    noremap <leader>b :Buffers<CR>
    noremap <leader>e :GFiles<CR>
    noremap <leader>l :BLines<CR>
    noremap <leader>L :Lines<CR>
    noremap <leader>f :Ag<CR>
    noremap <leader>F :Ag <C-r>"<CR>

    " Plug 'https://github.com/neomake/neomake'
    " " let g:neomake_javascript_enabled_makers = ['eslint']
    " autocmd! BufWritePost,BufEnter * Neomake
    " augroup my_neomake_signs
        " au!
        " autocmd ColorScheme *
            " \ hi NeomakeErrorSign ctermfg=red |
            " \ hi NeomakeWarningSign ctermfg=yellow |
            " \ hi NeomakeInfoSign ctermfg=blue |
            " \ hi NeomakeMessageSign ctermfg=blue
    " augroup END

    Plug 'https://github.com/moll/vim-node'
    Plug 'https://github.com/jelera/vim-javascript-syntax'

    " Plug 'https://github.com/jaxbot/semantic-highlight.vim' " it overrides some keywords :/
    " let g:semanticTermColors = [211, 213, 217, 219, 223, 225, 230, 231]

    Plug 'https://github.com/dhruvasagar/vim-table-mode'

    " Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " nmap <silent> gd <Plug>(coc-definition)
    " nmap <silent> gy <Plug>(coc-type-definition)
    " nmap <silent> gi <Plug>(coc-implementation)
    " nmap <silent> gr <Plug>(coc-references)
    " let g:coc_disable_startup_warning = 1

    Plug 'tikhomirov/vim-glsl'
    Plug 'https://github.com/DingDean/wgsl.vim'

    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

    Plug 'hashivim/vim-terraform'

    Plug 'j-hui/fidget.nvim'

    Plug 'simrat39/rust-tools.nvim'

    Plug 'github/copilot.vim'

    call plug#end()
endif

colorscheme monokai

augroup vimrc " Changes to the colorscheme
    autocmd!
    autocmd ColorScheme *  hi TabLine      cterm=none  ctermfg=130  ctermbg=235
                        \| hi TabLineSel   cterm=none  ctermfg=202  ctermbg=238
                        \| hi TabLineFill  cterm=none  ctermfg=245  ctermbg=235
                        \| hi PmenuSel     cterm=none  ctermfg=166  ctermbg=236
                        \| hi Search       cterm=none  ctermfg=234  ctermbg=214
augroup END

augroup DisableMappings " disable not-yet-loaded plugin mapping
    autocmd! VimEnter *     :unmap <leader>cc
                        \|  :unmap <leader>ca
                        \|  :unmap <leader>cu
                        \|  :unmap <leader>cb
                        \|  :unmap <leader>cl
                        \|  :unmap <leader>cA
                        \|  :unmap <leader>cy
                        \|  :unmap <leader>cs
                        \|  :unmap <leader>ci
                        \|  :unmap <leader>c$
                        \|  :unmap <leader>cn
                        \|  :unmap <leader>cm
augroup END


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

set hidden

set nocursorcolumn
set nocursorline

set nobackup
set noswapfile

set foldmethod=syntax
set foldlevelstart=256

set nostartofline

autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

autocmd FileType javascript set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2

" format json w/ jq
command Json %!jq .

set clipboard=unnamedplus

""" REMAPS:

" scroll half-screen
nnoremap <C-j> <C-d>
nnoremap <C-k> <C-u>
vnoremap <C-j> <C-d>
vnoremap <C-k> <C-u>

"clear highlight on redraw
noremap <silent> <C-l> zz<C-l>:nohlsearch<CR>

" C-[ae] for beginning/end of line
noremap <C-a> 0
noremap <C-e> $
inoremap <C-a> <C-o>0
inoremap <C-e> <C-o>$
cnoremap <C-a> <Home>
cnoremap <C-e> <End>


" move text faster
nnoremap <M-up> :move -2<CR>
nnoremap <M-down> :move +1<CR>
vnoremap <M-up> :move '<-2<CR>gv
vnoremap <M-down> :move '>+1<CR>gv

" better next/prev buffer
nnoremap J :bprevious<CR>
nnoremap K :bnext<CR>

vnoremap @ :normal @

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
nnoremap <leader>tn :set number!<CR>
nnoremap <leader>tr :set relativenumber!<CR>

noremap <leader>p :set invpaste paste?<CR>

noremap Y y$

noremap _ "_

noremap g{ O{<Esc>jo}<Esc>=%j

noremap gj J

noremap <leader>w :w<CR>
noremap <leader>W :wa<CR>
noremap <leader>q :qa!<CR>
noremap <leader>d :bd<CR>
" replaced by fzf
" noremap <leader>b :buffers<CR>:buffer
" noremap <leader>e :edit
noremap <leader>r :registers<CR>

noremap <leader>s :s///g<left><left><left>

noremap <leader>o o<Esc>
noremap <leader>O O<Esc>

noremap <leader>; :buffer#<CR>
noremap <leader>1 :buffer 1<CR>
noremap <leader>2 :buffer 2<CR>
noremap <leader>3 :buffer 3<CR>
noremap <leader>4 :buffer 4<CR>
noremap <leader>5 :buffer 5<CR>
noremap <leader>6 :buffer 6<CR>
noremap <leader>7 :buffer 7<CR>
noremap <leader>8 :buffer 8<CR>
noremap <leader>9 :buffer 9<CR>
noremap <leader>0 :buffer 10<CR>

function! ToggleFoldAll() " toggles folding
    if &foldlevel
        normal zM
    else
        normal zR
    endif
endfunction
noremap <silent> <leader>z :call ToggleFoldAll()<CR>
map L zo
map H za

" replace ; and , by ;w and ;b
noremap ;w ;
noremap ;b ,

noremap ;; :
noremap <leader>\ :

noremap <silent> gb :execute "!git blame -L" . line(".") . ",+1 %"<CR>

noremap <leader>R :source ~/.vimrc<CR>

noremap <leader>x "+y
noremap <leader>X "+p


""" TMUX STUFF:

if exists('$TMUX')
    let g:in_tmux = 1
else
    let g:in_tmux = 0
endif

let g:tmux_command = {
            \'h': 'select-pane -L',
            \'j': 'select-pane -D',
            \'k': 'select-pane -U',
            \'l': 'select-pane -L',
            \'p': 'last-pane',
            \'w': 'select-pane -l',
            \}

function! TmuxCmd(direction)
    silent execute '!' . 'tmux ' . g:tmux_command[a:direction]
endfunction

function! WinCmd(direction)
    silent execute 'wincmd ' . a:direction
endfunction

function! TmuxAwareWinCmd(direction)
    if !g:in_tmux
        call WinCmd(a:direction)
    else
        let current_win = winnr()
        call WinCmd(a:direction)
        if current_win == winnr()
            call TmuxCmd(a:direction)
        endif
    endif
endfunction

noremap <silent> <C-w>h :call TmuxAwareWinCmd('h')<CR>
noremap <silent> <C-w>j :call TmuxAwareWinCmd('j')<CR>
noremap <silent> <C-w>k :call TmuxAwareWinCmd('k')<CR>
noremap <silent> <C-w>l :call TmuxAwareWinCmd('l')<CR>

noremap <silent> <C-w>; :call TmuxAwareWinCmd('p')<CR>
noremap <silent> <C-w><C-w> :call TmuxAwareWinCmd('w')<CR>

set completeopt+=menuone,noselect,noinsert " don't insert text automatically
set pumheight=5 " keep the autocomplete suggestion menu small
set shortmess+=c " don't give ins-completion-menu messages

" use tab for navigating the autocomplete menu
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? "\<C-n>" : "\<C-x>\<C-o>"

set mouse=

lua << EOF

require("nvim-autopairs").setup {}

vim.api.nvim_set_keymap('i', '<S-tab>', 'copilot#AcceptWord("<CR>")', {expr=true, silent=true})
vim.api.nvim_set_keymap('i', '<M-\\>', 'copilot#Suggest()', {expr=true, silent=true})

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '[<space>', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']<space>', vim.diagnostic.goto_next, opts)

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }

  -- to keep
  vim.keymap.set('n', '<leader><space>', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<leader>h', vim.lsp.buf.signature_help, bufopts)

  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)

  vim.keymap.set('n', 'gn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, bufopts)
end

local servers = { 'pyright', 'rust_analyzer', 'tsserver' }
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    }
  }
end
EOF

