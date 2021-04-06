set background=dark
colorscheme solarized
set updatetime=750
syntax on
set cursorcolumn
set cursorline
:set number
:set colorcolumn=80
:hi ColorColumn ctermbg=white
" trailing spaces
:highlight ExtraWhitespace ctermbg=darkgreen
:match ExtraWhitespace /\s\+$/

:set expandtab
:set smarttab
:set autoindent

:set hlsearch
:set incsearch
:set ignorecase
:set smartcase
:set encoding=utf-8
:set scrolloff=3
:set noshowmode

nmap <C-w> <C-w>w
nmap <S-Down> :m+1<CR>
nmap <S-Up> :m-2<CR>
nmap 4 $
nmap r <C-r>
nmap <expr> <C-s> &background=='dark'  ? ':set background=light<CR>' : ':set background=dark<CR>'
xnoremap <S-Down> :m'>+<CR>gv
xnoremap <S-Up> :m-2<CR>gv
imap <S-Tab> <C-d>
vmap <Tab> >gv
vmap <S-Tab> <gv
map <C-b> <plug>NERDTreeTabsToggle<CR>

" requires clipboard+ (gvim in arch)
:set clipboard=unnamedplus

let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_map_keys = 0
highlight clear SignColumn
highlight GitGutterAdd ctermfg=2
highlight GitGutterChange ctermfg=3
highlight GitGutterDelete ctermfg=1
highlight GitGutterChangeDelete ctermfg=4

" NERDtree + NERDtree-tabs
autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeIgnore=['^.git$', '\.pyc$', '^__pycache__$']
let g:nerdtree_tabs_open_on_console_startup = 1
" Fix visual bug in manjaro
let g:NERDTreeNodeDelimiter = "\u00a0"

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers=['eslint']

autocmd BufNewFile,BufRead *Dockerfile* set syntax=dockerfile
autocmd BufNewFile,BufRead *eslintrc* set syntax=json

" Commentary
autocmd FileType vim setlocal commentstring=\"\ %s
autocmd FileType yaml setlocal commentstring=#\ %s
autocmd FileType python setlocal commentstring=#\ %s

" Shift widths
:set shiftwidth=4
:set tabstop=4
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType json       setlocal shiftwidth=2 tabstop=2
autocmd FileType html       setlocal shiftwidth=2 tabstop=2
autocmd FileType vue        setlocal shiftwidth=2 tabstop=2

" Omnifunc
filetype plugin on
:set omnifunc=syntaxcomplete#Complete
autocmd FileType vue setlocal omnifunc=htmlcomplete#CompleteTags
