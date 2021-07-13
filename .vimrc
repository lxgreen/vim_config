" Plugins {{{
call plug#begin('~/.local/share/nvim/plugged')
Plug 'lifepillar/vim-solarized8'                                  " theme
Plug 'tpope/vim-fugitive'                                         " git essentials
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " search
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'                                       " comment on gc
Plug 'pangloss/vim-javascript'                                    " highlight
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'tpope/vim-surround'                                         " surround with brakets, tags, etc
Plug 'jiangmiao/auto-pairs'                                       " parens autocomplete
" Plug 'neoclide/coc.nvim', {'branch': 'release'}                   " dev essentials
Plug 'dense-analysis/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'wakatime/vim-wakatime'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'tpope/vim-abolish'                                          " substitution
Plug 'svermeulen/vim-easyclip'                                    " yank to clipboard, 'd' for delete, 'x' for cut
Plug 'tpope/vim-repeat'                                           " plugins '.' operator
Plug 'vim-scripts/grep.vim'                                       " find in files
Plug 'mhinz/vim-grepper'
Plug 'chrisbra/unicode.vim'
Plug 'blueyed/vim-diminactive'                                    " inactive window indication
Plug 'tpope/vim-unimpaired'                                       " lots of key shortcuts
Plug 'chaoren/vim-wordmotion'                                     " navigate inside camelCase, kebab-case, etc
Plug 'plasticboy/vim-markdown'
Plug 'easymotion/vim-easymotion'                                  " 'f' for quick navigation (cross-window)
Plug 'tmux-plugins/vim-tmux-focus-events'                         " essential for tmux
Plug 'tmux-plugins/vim-tmux'
Plug 'jrudess/vim-foldtext'
Plug 'bogado/file-line'                                           " `vim file:line` opens the file with caret on the line
Plug 'vim-scripts/BufOnly.vim'                                    " kill all buffers except current one
Plug 'vim-scripts/Rename2'                                        " rename current file
Plug 'vim-scripts/AnsiEsc.vim'                                    " color sequesnces in terminal
Plug 'honza/vim-snippets'                                         " snippet libs
Plug 'sirver/ultisnips'
Plug 'isruslan/vim-es6'
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown'}
Plug 'kjwon15/vim-transparent'                                    " remove background color
Plug 'PeterRincker/vim-argumentative'                             " manipulating and moving between function arguments
Plug 'neoclide/jsonc.vim'                                         " jsonc
call plug#end()
" }}}

" Basic options {{{
set nocompatible                                  " don't care about vi
filetype plugin indent on                         " file type detection, plugin for type, indent for type
set nu rnu                                        " relative line numbers
set ruler                                         " color column
set colorcolumn=120
set cursorline
set cursorcolumn
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab                                     " insert space on tab
set list                                          " display invisible chars
set listchars=tab:>-,trail:~,extends:>,precedes:<
set hlsearch
set incsearch
set autoindent
set smartindent
set showcmd                                       " command line visible
set backupdir=$HOME/.local/share/nvim/backup//
set directory=$HOME/.local/share/nvim/swap//
set undodir=$HOME/.local/share/nvim/undo//
set undofile
set nobackup
set nowritebackup
set guifont=Fira\ Code:h13
set linespace=5
set encoding=UTF-8
set ic
set diffopt+=vertical                             " diff open vertically
set laststatus=2
set t_Co=256
set nofoldenable                                  " folding
set fdm=syntax
set foldnestmax=10
set hidden                                        " coc.nvim alignments
set signcolumn=yes
set cmdheight=2
set updatetime=300
let g:solarized_termcolors=256
syntax enable
set ignorecase
set smartcase
set inccommand=nosplit                            " search/replace preview
set conceallevel=1
set switchbuf+=usetab,newtab
" }}}

" Airline plugin settings {{{
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#localsearch#enabled=1
let g:airline_theme='solarized'
let g:airline_section_y=''
let g:airline_inactive_collapse=1
let g:airline_skip_empty_sections = 1
let g:airline_powerline_fonts = 1
" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
" }}}

" easyclip settings {{{
" yank/paste with system clipboard by default
set clipboard=unnamed
" yank history @ ~/.easyclip
let g:EasyClipShareYanks=1
" `s` for substitution
let g:EasyClipUseSubstituteDefaults=1
" }}}

" easymotion {{{
nmap f <Plug>(easymotion-overwin-f2)
" }}}

" auto-pairs {{{
let g:AutoPairsFlyMode = 1
" }}}
" markdown settings {{{
let g:vim_markdown_folding_disabled = 1
" set conceallevel=2
let g:vim_markdown_conceal = 0
" }}}

" editor settings {{{
set undodir=$HOME/.local/share/nvim/undo
set undofile
" }}}

" editor mappings {{{
noremap gF :vertical wincmd f<CR> " file commands
let mapleader = "`"
" }}}

" FZF plugin settings {{{
let g:fzf_colors =
  \ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
nnoremap <leader>e :call fzf#vim#gitfiles('', fzf#vim#with_preview('right'))<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>l :BLines<CR>
nnoremap <leader>w :Windows<CR>
" }}}

" Dynamic theme and platofrm dependent stuff {{{
if (has("termguicolors"))
  set termguicolors
endif

" colors
let g:diminactive_use_syntax = 1
let g:diminactive_enable_focus = 1
let g:diminactive_use_colorcolumn = 0

colorscheme solarized8_flat

function! SetColorScheme()
  " relies on COLOR_SCHEME var set by zsh
  let scheme = system("cat $HOME/.config/current_theme")
  if matchstr(scheme, 'dark') == 'dark'
    set background=dark
  else
    set background=light
  endif
endfunction

call SetColorScheme()
" }}}

" dotfile and todo access mappings {{{
nnoremap <silent> <leader>cv :vsplit ~/.vimrc <bar> :lcd ~/vim_config<cr>
nnoremap <silent> <leader>sv :source $MYVIMRC<cr>
nnoremap <silent> <F5> :source $MYVIMRC<cr>
nnoremap <silent> <leader>tt :tabe ~/.tmux.conf<cr>
" }}}

" window management mappings {{{
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
nnoremap <silent><C-Up> :resize +5<cr>
nnoremap <silent> <C-Down> :resize -5<cr>
nnoremap <silent> <C-Left> :vertical resize -20<cr>
nnoremap <silent> <C-Right> :vertical resize +20<cr>
" }}}

" autocommands {{{
augroup auto_commands
  autocmd!
  autocmd BufWritePre /tmp/* setlocal noundofile
  " auto-close preview window
  autocmd InsertLeave * if pumvisible() == 0|pclose|endif
  autocmd BufRead,BufNewFile *.json set filetype=json
  autocmd BufNewFile,BufRead rush.json setlocal filetype=jsonc
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  " auto save session on exit
  autocmd VimLeave * call SaveCurrentSession()
  autocmd FileType vim setlocal foldmethod=marker
  autocmd FileType vim setlocal fileencoding=UTF-8
  autocmd BufWritePre *todo.txt :normal \s+
  autocmd BufWritePre *.js,*.jsx,*.json,*.ts,*.tsx Prettier
  " jsonc
augroup END
" }}}

" grepper settings {{{
let grepper ={}
let grepper.tools = ['rg', 'git', 'grep']
nnoremap <leader>* :Grepper -tool git -open -switch -cword -noprompt<cr>
" }}}

" functions {{{

function! CopyMatches(reg)
  let hits = []
  %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/gne
  let reg = empty(a:reg) ? '+' : a:reg
  execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction

function! SaveCurrentSession()
  if v:this_session != ""
    exe "mksession! " . v:this_session
  endif
endfunction

function! SetupCommandAlias(input, output)
  exec 'cabbrev <expr> '.a:input
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:input.'")'
        \ .'? ("'.a:output.'") : ("'.a:input.'"))'
endfunction

function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(values(buffer_numbers))
endfunction
" }}}

" commands {{{
command! -nargs=0 -bar Qargs execute 'args ' . QuickfixFilenames()
command! -register CopyMatches call CopyMatches(<q-reg>)
command! -nargs=1 Ren execute "!mv %:p %:p:h/<args>" <bar> execute "e <args>"
command! VTerm :silent :vsplit | :terminal
command! STerm :silent :split | :terminal
command! TTerm :silent :tabe | :terminal

" command abbreviations
call SetupCommandAlias("grep", "GrepperRg")
call SetupCommandAlias("??", "GrepperRg")
call SetupCommandAlias("G", "Git")
call SetupCommandAlias("W", "w")
call SetupCommandAlias("Q", "q")
call SetupCommandAlias("blame", "Gblame")
call SetupCommandAlias("revert", "Git checkout %")
call SetupCommandAlias("gcm", "Git checkout  master")
call SetupCommandAlias("term", "terminal")
call SetupCommandAlias("vterm", "VTerm")
call SetupCommandAlias("tterm", "TTerm")
call SetupCommandAlias("sterm", "STerm")
" }}}

" terminal settings {{{
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
" }}}

" fugitive mappings {{{
nnoremap dgh :diffget //2<CR>
nnoremap dgl :diffget //3<CR>
" }}}

" deoplete {{{
 let g:deoplete#enable_at_startup = 1
" }}}

" ALE {{{
nmap <silent> ]w :ALENext<cr>
nmap <silent> [w :ALEPrevious<cr>
nnoremap <leader>h :ALEHover<CR>
nnoremap <silent> gr :ALEFindReferences<CR>
nnoremap <leader>rn :ALERename<CR>
nnoremap <leader>qf :ALECodeAction<CR>
vnoremap <leader>qf :ALECodeAction<CR>
autocmd FileType javascript map <buffer> gd :ALEGoToDefinition<CR>
autocmd FileType typescript map <buffer> gd :ALEGoToDefinition<CR>
autocmd FileType typescriptreact map <buffer> gd :ALEGoToDefinition<CR>

let js_fixers = ['prettier', 'eslint']
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': js_fixers,
\   'javascript.jsx': js_fixers,
\   'typescript': js_fixers,
\   'typescriptreact': js_fixers,
\   'css': ['prettier'],
\   'json': ['prettier'],
\   'jsonc': ['prettier'],
\}
let g:ale_sign_error = "🐛"
let g:ale_sign_warning = "⚠️"
let g:ale_sign_info = "ℹ"
let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_prefix = "🔥 "
" }}}

" prettier {{{
let g:prettier#autoformatconfig_present = 1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#autoformat_config_files = ['prettier.json', 'prettier.config.js', 'prettierrc.js']
" }}}

" Asterisk search override {{{
nnoremap <silent>  * :let @/='\C\<' . expand('<cword>') . '\>'<CR>:let v:searchforward=1<CR>n
nnoremap <silent>  # :let @/='\C\<' . expand('<cword>') . '\>'<CR>:let v:searchforward=0<CR>n
nnoremap <silent> g* :let @/='\C'   . expand('<cword>')       <CR>:let v:searchforward=1<CR>n
nnoremap <silent> g# :let @/='\C'   . expand('<cword>')       <CR>:let v:searchforward=0<CR>n
" }}}

" BufOnly mappings {{{
nnoremap <silent> <C-w>b :BufOnly<cr>
" }}}

" Abbreviations {{{
abbrev cosnt const
abbrev hrlp help
" }}}

" local settings - keep this last {{{
silent! so .vimlocal
" }}}
