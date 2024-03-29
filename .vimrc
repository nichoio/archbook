set background=dark
colorscheme solarized
set updatetime=750
syntax on
set cursorcolumn
set cursorline
:set number
:set colorcolumn=80

" trailing and multi-inlinespaces
:highlight InlineMultiWhitespace ctermbg=darkgreen
:highlight ExtraWhitespace ctermbg=darkgreen
:match InlineMultiWhitespace /\S\zs \{2,}\ze\S/ "after and before any char, only highlight (zs,ze) whitespaces
:2match ExtraWhitespace /\s\+$/

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

" Check if NERDTree is open or active
function IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

function StoreSession() " store session under home dir
    let l:projectroot = substitute(trim(execute('pwd')), '/', '_', 'g')
    let l:sessionpath = '~/.vim/sessions/' . l:projectroot . '.vim'
    :execute 'Obsession' l:sessionpath
endfunction

function SwitchTheme() " switch theme and reset space matching
    if &background=='dark'
        :set background=light
    else
        :set background=dark
    endif

    :highlight InlineMultiWhitespace ctermbg=darkgreen
    :highlight ExtraWhitespace ctermbg=darkgreen
    :match InlineMultiWhitespace /\S\zs \{2,}\ze\S/
    :2match ExtraWhitespace /\s\+$/
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
nnoremap <C-l> :call SwitchTheme()<CR>
nnoremap <C-s> :call StoreSession()<CR>
xnoremap <S-Down> :m'>+<CR>gv
xnoremap <S-Up> :m-2<CR>gv
inoremap <S-Tab> <C-d>
inoremap <c-v> <esc>:set paste<cr>a<c-r>=getreg('+')<cr><esc>:set nopaste<cr>mi`[=`]`ia
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
vnoremap 4 g_
vnoremap x "_d
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
autocmd BufEnter * call SyncTree() "highlyight currently open buffer
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeIgnore=['^.git$', '\.pyc$', '^__pycache__$']
let g:nerdtree_tabs_open_on_console_startup = 1
let g:NERDTreeNodeDelimiter = "\u00a0" " Fix visual bug in manjaro

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_loc_list_height = 5
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers=['eslint']

" Omnifunc
filetype plugin on
:set omnifunc=syntaxcomplete#Complete
