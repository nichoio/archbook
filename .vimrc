:colorscheme desert
set updatetime=750
syntax on
:set number
:set colorcolumn=80
:hi ColorColumn ctermbg=darkgreen
" trailing spaces
:highlight ExtraWhitespace ctermbg=darkgreen
:match ExtraWhitespace /\s\+$/

:set expandtab
                :set shiftwidth=4
:set smarttab
:set tabstop=4
:set autoindent

:set hlsearch
:set incsearch
:set ignorecase
:set smartcase
:set encoding=utf-8
:set scrolloff=3
:set noshowmode

nmap <C-w> <C-w>w
nmap <S-Down> :move +1<CR>
nmap <S-Up> :move -2<CR>
nmap 4 $
nmap r <C-r>
imap <S-Tab> <C-d>
vmap <Tab> >gv
vmap <S-Tab> <gv

" requires clipboard+ (gvim in arch)
:set clipboard=unnamedplus

let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_map_keys = 0
highlight clear SignColumn
highlight GitGutterAdd ctermfg=2
highlight GitGutterChange ctermfg=3
highlight GitGutterDelete ctermfg=1
highlight GitGutterChangeDelete ctermfg=4

autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
" Fix visual bug in manjaro
let g:NERDTreeNodeDelimiter = "\u00a0"
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeIgnore=['^.git$', '^.github$', '\.pyc$', '^__pycache__$']

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

" Commentary
autocmd FileType vim setlocal commentstring=\"\ %s
autocmd FileType yaml setlocal commentstring=#\ %s
autocmd FileType python setlocal commentstring=#\ %s
