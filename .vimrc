
call plug#begin('~/.local/share/nvim/plugged')

Plug 'zhaocai/goldenview.vim'
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
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'ervandew/supertab'
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
Plug 'mattn/emmet-vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/grep.vim'
Plug 'mhinz/vim-grepper'
Plug 'tomarrell/vim-npr'
Plug 'chrisbra/unicode.vim'
Plug 'blueyed/vim-diminactive'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-projectionist'
Plug 'radenling/vim-dispatch-neovim'
Plug 'tpope/vim-unimpaired'
Plug 'janko/vim-test'
Plug 'craigdallimore/vim-jest-cli', { 'for': 'javascript' }
Plug 'dhruvasagar/vim-prosession'
Plug 'chaoren/vim-wordmotion'
Plug 'elentok/plaintasks.vim'
Plug 'tmux-plugins/vim-tmux'
call plug#end()

" General configuration -------------------------------------------------------
" set shell=zsh\ -i
set nocompatible
filetype plugin indent on
set nu rnu
set ruler
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list
set listchars=tab:>-,trail:~,extends:>,precedes:<
" set spell
" set spelllang=en_us
set hlsearch
set incsearch
set autoindent
set smartindent
set showcmd
set backupdir=./.backup
set directory=.,./.swap//
set nobackup
set nowritebackup
set guifont=Fira\ Code:h13
set linespace=5
set encoding=UTF-8
set ic

" Fugitive (Diff for resolve conflicts) ---------------------------------------
set diffopt+=vertical

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
\    'javascript': ['eslint'],
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
let g:airline_theme='jellybeans'

let g:airline_section_x=''
let g:airline_section_y=''
let g:airline_inactive_collapse=1
let g:airline_skip_empty_sections = 1

let g:airline_powerline_fonts = 1
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

" colors
let g:rainbow_active = 1
let g:diminactive_use_syntax = 1
let g:diminactive_use_colorcolumn = 0
colorscheme OceanicNext

" sessions
let g:prosession_on_startup=1
let g:prosession_default_session=1

" mappings
map <F3> :NERDTreeToggle %<CR>
map <leader><F3> :NERDTreeFind %<CR>
nmap <silent> <leader>cp :PlugInstall<cr>
nnoremap <silent> <leader>cv :vsplit ~/.vimrc<cr>
" Source my .vimrc file (This reloads the configuration)
nnoremap <silent> <leader>sv :source $MYVIMRC<cr>

" todo
map <leader>todo :vsplit ~/todo.txt<cr>
" windows
nnoremap <Right> <C-w>l
nnoremap <Left> <C-w>h
nnoremap <Up> <C-w>k
nnoremap <Down> <C-w>j
nnoremap <silent><C-Up> :resize +5<cr>
nnoremap <silent> <C-Down> :resize -5<cr>
nnoremap <silent> <C-Left> :vertical resize -20<cr>
nnoremap <silent> <C-Right> :vertical resize +20<cr>
" code
" log expression under cursor
nmap <Leader>cl yiwoconsole.log('<c-r>":', <c-r>");<Esc>^
"
" grep the word under cursor
let grepper ={}
let grepper.tools = ['rg', 'git', 'grep']
nnoremap <leader>* :Grepper -tool git -open -switch -cword -noprompt<cr>

set grepprg=rg\ -H\ --no-heading\ --vimgrep
set grepformat=$f:$l:%c:%m

" youcompleteme
let g:ycm_filetype_blacklist = {}

" ultisnips
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsSnippetsDir="~/.vim/snips/"
let g:UltiSnipsSnippetDirectories=['UltiSnips', 'snips']
let g:UltiSnipsEditSplit = 'vertical'
map <F5> :UltiSnipsEdit<CR>

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

function! SetupCommandAlias(input, output)
  exec 'cabbrev <expr> '.a:input
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:input.'")'
        \ .'? ("'.a:output.'") : ("'.a:input.'"))'
endfunction

" command abbreviations
call SetupCommandAlias("grep", "GrepperRg")
call SetupCommandAlias("G", "Git")
call SetupCommandAlias("npm", "Dispatch npm run")
call SetupCommandAlias("yarn", "Dispatch yarn")
call SetupCommandAlias("W", "w")
call SetupCommandAlias("Q", "q")

if !exists(":VTerm")
  command VTerm :silent :vsplit | :terminal
  command STerm :silent :split | :terminal
  command TTerm :silent :tabe | :terminal

  call SetupCommandAlias("term", "terminal")
  call SetupCommandAlias("vterm", "VTerm")
  call SetupCommandAlias("tterm", "TTerm")
  call SetupCommandAlias("sterm", "STerm")
endif

let test#strategy = "dispatch"
let g:dispatch_compilers = { 'jest': 'jest-cli' }

" terminal
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc>
  tnoremap <C-c> <C-\><C-n>i<C-c>
  highlight! link TermCursor Cursor
  highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
  if executable('nvr')
    let $VISUAL="nvr -cc vsplit --remote-wait + 'set bufhidden=wipe'"
  endif
endif

set undodir=$HOME/.local/share/nvim/undo
set undofile

augroup vimrc
  autocmd!
  autocmd BufWritePre /tmp/* setlocal noundofile
augroup END

" auto-close preview window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
