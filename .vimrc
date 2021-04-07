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

function StoreSession() " store session under home dir
    let l:projectroot = substitute(trim(execute('pwd')), '/', '_', 'g')
    let l:sessionpath = '~/.vim/sessions/' . l:projectroot . '.vim'
    :execute 'Obsession' l:sessionpath
endfunction

nnoremap <silent> <S-Down> :m+1<CR>
nnoremap <silent> <S-Up> :m-2<CR>
nnoremap <silent> <A-PageUp> :tabprevious<CR>
nnoremap <silent> <A-PageDown> :tabnext<CR>
nnoremap <silent> <A-Left> :wincmd h<CR>
nnoremap <silent> <A-Right> :wincmd l<CR>
nnoremap <silent> <A-Up> :wincmd k<CR>
nnoremap <silent> <A-Down> :wincmd j<CR>
nnoremap 4 $
nnoremap r <C-r>
nnoremap <expr> <C-l> &background=='dark'  ? ':set background=light<CR>' : ':set background=dark<CR>'
nnoremap <C-s> :call StoreSession()<CR>
xnoremap <S-Down> :m'>+<CR>gv
xnoremap <S-Up> :m-2<CR>gv
inoremap <S-Tab> <C-d>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
noremap <C-b> <plug>NERDTreeTabsToggle<CR>

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
