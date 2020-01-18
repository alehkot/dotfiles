call plug#begin()
"  Plug 'itchyny/lightline.vim'
  Plug 'leafgarland/typescript-vim'
  Plug 'tpope/vim-eunuch'
  Plug 'majutsushi/tagbar'
  Plug 'Quramy/tsuquyomi'
  "Plug 'kaicataldo/material.vim'
  "Plug 'terryma/vim-multiple-cursors'
  Plug 'editorconfig/editorconfig-vim'
  "Plug 'skwp/greplace.vim'
  Plug 'vim-python/python-syntax'
  Plug 'scrooloose/nerdtree'
  Plug 'isRuslan/vim-es6'
  Plug 'StanAngeloff/php.vim'
  Plug 'metalelf0/supertab'
  Plug 'arnaud-lb/vim-php-namespace'
  Plug 'rayburgemeestre/phpfolding.vim'
"  Plug 'jiangmiao/auto-pairs'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'mattn/emmet-vim'
  Plug 'SirVer/ultisnips'
  Plug 'aklt/plantuml-syntax'
  Plug 'jremmen/vim-ripgrep'
  "Plug 'Chun-Yang/vim-action-ag'
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'
  "Plug 'scrooloose/vim-slumlord'
  Plug 'w0rp/ale'
  "Plug 'tenfyzhong/CompleteParameter.vim'
  Plug 'tell-k/vim-autopep8'
  Plug 'tpope/vim-surround'
  Plug 'kshenoy/vim-signature'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'Valloric/YouCompleteMe'
"  Plug 'vim-syntastic/syntastic'
  Plug 'scrooloose/nerdcommenter'
  Plug 'tpope/vim-vinegar'
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'skwp/greplace.vim'
  "Plug 'vim-vdebug/vdebug'
  Plug 'mhartington/nvim-typescript'
  Plug 'mbbill/undotree'
  Plug 'thaerkh/vim-indentguides'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'neomake/neomake'
  "Plug 'godlygeek/tabular'
  "Plug 'plasticboy/vim-markdown'
  "Plug 'plasticboy/vim-markdown'
  "Plug 'vim-pandoc/vim-pandoc-syntax'
  Plug 'mattn/webapi-vim'
  Plug 'christoomey/vim-quicklink'
  Plug 'junegunn/goyo.vim'
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
  Plug 'morhetz/gruvbox'
  Plug 'junegunn/limelight.vim'
  Plug 'elzr/vim-json'
  " Plug 'Shougo/deoplete.nvim'
  " Plug 'roxma/nvim-yarp'
  " Plug 'roxma/vim-hug-neovim-rpc'
call plug#end()

" set backspace=indent,eol,start

"let g:material_theme_style = 'default'
"let g:material_terminal_italics = 1
"let g:airline_theme = 'dracula'
let g:python_highlight_all = 1

" Markdown configuration.
"augroup pandoc_syntax
    "au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
"augroup END
"let g:mkdp_auto_close = 0
au BufRead,BufNewFile *.md setlocal textwidth=80
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

set encoding=utf-8

" Use deoplete.
"let g:deoplete#enable_at_startup = 1

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"set background=dark
colorscheme gruvbox

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

let mapleader=","

nmap <C-e> :NERDTreeToggle<CR>

nmap ; :Files<CR>

let g:lightline = {
  \     'active': {
  \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \     }
  \ }

set hidden
set autoread
set number
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set expandtab
set incsearch
set nocompatible
set ttyfast
set gdefault
set encoding=utf-8 nobomb
" Always show status line
set laststatus=2
" Ignore case of searches
set ignorecase

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

" Centralize backups, swapfiles and undo history
set backupdir=~/.config/nvim/backups
set directory=~/.config/nvim/swaps
if exists("&undodir")
  set undodir=~/.config/nvim/undo
endif


" --- Mappings -- "
nmap <Leader>ev :tabedit $MYVIMRC<cr>
nmap <Leader><space> :nohlsearch<cr>

nmap <C-P> :CtrlP<cr>
nmap <c-R> :CtrlPBufTag<cr>
nmap <D-e> :CtrlPMRUFiles<cr>

" -- Auto-commands -- "
augroup autosourceing
  autocmd!
  autocmd BufWritePost init.vim source %
augroup end

if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

let g:ctrlp_custom_ignore = {
 \ 'dir': '\.git$\|\.yardoc\|bower_components|node_modules|public$|log\|tmp$',
 \ 'file': '\.so$\|\.dat$|\.DS_Store$'
 \ }
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

set splitbelow
set splitright

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>


filetype plugin indent on

" let NERDTreeHijackNetrw = 0

function! PhpSyntaxOverride()
  " Put snippet overrides in this function.
  hi! link phpDocTags phpDefine
  hi! link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

if has("autocmd")
  " Drupal *.module and *.install files.
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
    autocmd BufRead,BufNewFile *.inc set filetype=php
    autocmd BufRead,BufNewFile *.profile set filetype=php
    autocmd BufRead,BufNewFile *.view set filetype=php
  augroup END
endif

autocmd FileType php set omnifunc=phpcomplete#CompletePHP

au FileType gitcommit,gitrebase let g:gutentags_enabled=0

com! FormatXML :%!python3 -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml())"

nnoremap = :FormatXML<Cr>

set wildmenu
set wildmode=longest:list,full

set cursorline "Highlight current line.
highlight Cursorline term=none cterm=none

set colorcolumn=120
highlight ColorColumn ctermbg=1

set statusline+=%F

" Smooth scroll
set mouse=a
" Prevent clicks on scroll.
" :map <LeftMouse> <nop>

set autochdir!

inoremap <C-u> <Del>

" Move line up and down.
nnoremap ,<Up>   :<C-u>silent! move-2<CR>==
xnoremap ,<Up>   :<C-u>silent! '<,'>move-2<CR>gv=gv
nnoremap ,<Down> :<C-u>silent! move+<CR>==
xnoremap ,<Down> :<C-u>silent! '<,'>move'>+<CR>gv=gv

" Remove line numbers line background.
highlight LineNr ctermfg=grey ctermbg=white

set grepprg=ag
let g:grep_cmd_opts = '--line-number --noheading'

set noerrorbells visualbell t_vb=

" Switch tabs efficiently.
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt

" Configure gSearch.
set grepprg=ag

let g:grep_cmd_opts = '--line-numbers --noheading'

if has("persistent_undo")
  set undodir=~/.config/nvim/.undodir/
  set undofile
endif

" Use shared clipboard with Mac.
set clipboard=unnamed

" PHP Specific settings.
function! IPhpInsertUse()
  call PhpInsertUse()
  call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

function! IPhpExpandClass()
  call PhpExpandClass()
  call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>e <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>e :call PhpExpandClass()<CR>

autocmd FileType php inoremap <Leader>s <Esc>:call PhpSortUse()<CR>
autocmd FileType php noremap <Leader>s :call PhpSortUse()<CR>

au BufNewFile,BufRead *.py
  \ set tabstop=4 |
  \ set softtabstop=4 |
  \ set shiftwidth=4 |
  \ set textwidth=119 |
  \ set expandtab |
  \ set autoindent |
"  \ set tw=0 |
  \ set fileformat=unix

" Enable folding
set foldmethod=indent
set foldlevel=99

nmap <Leader>cs :let @*=expand("%")<CR>
nmap <Leader>cl :let @*=expand("%:p")<CR>

set complete=.,w,b,u
set autowriteall
set noerrorbells visualbell t_vb=

" Redo
nnoremap U <C-R>

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let NERDTreeShowHidden=1

let g:airline#extensions#ale#enabled = 1

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}

let b:ale_linters = {'python': ['flake8']}

" Use shift+arrays for selection.
" https://stackoverflow.com/questions/9721732/mapping-shift-arrows-to-selecting-characters-lines
set keymodel=startsel

let g:autopep8_max_line_length=119
let g:autopep8_ignore="E501"

" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

"let g:multi_cursor_use_default_mapping=0
"let g:multi_cursor_start_word_key      = '<C-n>'
"let g:multi_cursor_select_all_word_key = '<A-n>'
"let g:multi_cursor_start_key           = 'g<C-n>'
"let g:multi_cursor_select_all_key      = 'g<A-n>'
"let g:multi_cursor_next_key            = '<C-n>'
"let g:multi_cursor_prev_key            = '<C-p>'
"let g:multi_cursor_skip_key            = '<C-x>'
"let g:multi_cursor_quit_key            = '<Esc>'

"inoremap <silent><expr> ( complete_parameter#pre_complete("()")
"smap <c-j> <Plug>(complete_parameter#goto_next_parameter)
"imap <c-j> <Plug>(complete_parameter#goto_next_parameter)
"smap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
"imap <c-k> <Plug>(complete_parameter#goto_previous_parameter)

autocmd VimEnter * nested :TagbarOpen

" Ultisnips configuration.
let g:UltiSnipsExpandTrigger="<c-s>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

