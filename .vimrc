
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'othree/yajs.vim'
Plug 'mxw/vim-jsx'
Plug 'mhartington/oceanic-next'
Plug 'dense-analysis/ale'
Plug 'arthurxavierx/vim-caser'
Plug 'freitass/todo.txt-vim'
Plug 'epilande/vim-es2015-snippets'
Plug 'epilande/vim-react-snippets'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'tomtom/tcomment_vim'
Plug 'othree/es.next.syntax.vim'
Plug 'tpope/vim-surround'
Plug 'valloric/youcompleteme', { 'do': './install.py --ts-completer'}
Plug 'wakatime/vim-wakatime'
Plug 'luochen1990/rainbow'
Plug 'skwp/greplace.vim'
Plug 'mattn/emmet-vim'
" Plug 'ryanoasis/vim-devicons'
" Shorthand notation; fetches https://github.com/jungunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed

" Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()

" General configuration -------------------------------------------------------
set number
set ruler

filetype plugin indent on
" show existing tab with 2 spaces width
set tabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" Sets the number of columns for a TAB.
set softtabstop=2
" On pressing tab, insert 2 spaces
set expandtab

set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

" Autocompletion
" set wildmenu
" set wildmode=list:longest

" Search
set hlsearch
set incsearch

"set paste
set ttyfast

set autoindent
set smartindent
set showcmd
set backupdir=./.backup
set directory=.,./.swap//
set nobackup
set nowritebackup
" Fugitive (Diff for resolve conflicts) ---------------------------------------
set diffopt+=vertical

set guifont=Droid\ Sans\ Mono\ for\ Powerline:h13
set linespace=5
set encoding=UTF-8
" set fileencoding=utf-8
" set fileencodings=ucs-bom,utf8,prc
set ic
" let g:webdevicons_enable_nerdtree=1
" let g:webdevicons_conceal_nerdtree_brackets=0

let NERDTreeShowIgnoredStatus = 1
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
" ALE
let g:ale_linters = {
\   'javascript': ['eslint'],
\}

let g:ale_fixers = {
\    'javascript': ['prettier', 'eslint'],
\    'scss': ['prettier']
\}
let g:ale_fix_on_save = 1
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']

" emmet
" =======
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}

" airline
set laststatus=2

" Use 256 colors
set t_Co=256

call airline#parts#define_function('ALE', 'ALEGetStatusLine')
call airline#parts#define_condition('ALE', 'exists("*ALEGetStatusLine")')
let g:airline_section_error = airline#section#create_right(['ALE'])
" let g:airline_theme='durant'
" let g:airline_theme='powerlineish'
" let g:airline_theme='simple'
" let g:airline_theme='term'
let g:airline_theme='jellybeans'
" let g:webdevicons_enable_airline_tabline = 1
" let g:webdevicons_enable_airline_statusline = 1
let g:airline_powerline_fonts = 1

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"FZF Configuration -----------------------------------------------------------
nnoremap <F2> :FZF<CR>
nnoremap ,e :call fzf#vim#gitfiles('', fzf#vim#with_preview('right'))<CR>

" CtrlP Configuration
" ---------------------------------------------------------
"
" to search in the current open buffers
nnoremap ,b :CtrlPBuffer<CR>
" to search listing all tags
nnoremap ,t :CtrlPBufTag<CR>
" to search through the current file's lines
nnoremap ,l :CtrlPLine<CR>
" to search listing all Most-Recently-Used file.
nnoremap ,r :CtrlPMRUFiles<CR>

" to be able to call CtrlP with default search text
function! CtrlPWithSearchText(search_text, ctrlp_command_end)
    execute ':CtrlP' . a:ctrlp_command_end
    call feedkeys(a:search_text)
endfunction

" CtrlP with default text
nnoremap ,wg :call CtrlPWithSearchText(expand('<cword>'),'BufTag')<CR>
nnoremap ,wf :call CtrlPWithSearchText(expand('<cword>'),'Line')<CR>
nnoremap ,d ,wg
nnoremap ,we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
nnoremap ,pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>

" Don't change working directory
let g:ctrlp_working_path_mode = 0

" Ignore this files/dirs
let g:ctrlp_custom_ignore = {
                   \ 'dir': '\v[\/](\.git|\.hg|\.svn|node_modules|.history)$',
                   \ 'file': '\.pyc$\|\.pyo$',
                   \ }

" Update the search once the user ends typing.
let g:ctrlp_lazy_update = 2
" The Silver Searcher
if executable('ag')
  " Use ag in CtrlP for listing files, lightning fast.
  let ignores = '--ignore ".git/" --ignore ".hg/" --ignore ".svn/" --ignore "node_modules/" --ignore ".history/"' "  dirs
  let ignores .= '--ignore "*.pyc" --ignore "*.pyo"' " files
  let g:ctrlp_user_command = 'ag %s -l --skip-vcs-ignores --nocolor -g "" ' . ignores

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
  nnoremap <leader>ag :Ag
endif

set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'
" TagBar Configuration
" --------------------------------------------------------

" autofocus on Tagbar open
let g:tagbar_autofocus = 1

" toggle Tagbar display
map <F4> :TagbarToggle<CR>

" Set default width
let g:tagbar_width = 30

" theme
syntax enable
if (has("termguicolors"))
  set termguicolors
 endif


let g:UltiSnipsExpandTrigger="<C-l>"

colorscheme OceanicNext

" mappings
map <F3> :NERDTreeToggle<CR>
nmap <silent> <leader>cp :PlugStatus<cr>
nnoremap <silent> <leader>cv :vsplit ~/.vimrc<cr>
" Source my .vimrc file (This reloads the configuration)
nnoremap <silent> <leader>sv :source $MYVIMRC<cr>
" Move lines
nnoremap <leader>f :m .+1<CR>==
nnoremap <leader>F :m .-2<CR>==
inoremap <leader>f <Esc>:m .+1<CR>==gi
vnoremap <leader>f :m '>+1<CR>gv=gv
inoremap <leader>F <Esc>:m .-2<CR>==gi
vnoremap <leader>F :m '<-2<CR>gv=gv

" todo
map <leader>todo :vsplit ~/todo.txt<cr>
" windows
nnoremap <Right> <C-w>l
nnoremap <Left> <C-w>h
nnoremap <Up> <C-w>k
nnoremap <Down> <C-w>j
nnoremap <silent> <leader><Up> :vertical resize +20<cr>
nnoremap <silent> <leader><Down> :vertical resize -20<cr>
" code
" log expression under cursor
nmap <Leader>cl yiwoconsole.log('<c-r>":', <c-r>");<Esc>^

" C-x C-f from current dir
:autocmd InsertEnter * let save_cwd = getcwd() | set autochdir
autocmd InsertLeave * set noautochdir | execute 'cd' fnameescape(save_cwd)
