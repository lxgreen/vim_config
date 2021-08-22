" Plugins {{{
call plug#begin('~/.local/share/nvim/plugged')
Plug 'nvim-lua/popup.nvim'                                        " lua infra
Plug 'nvim-lua/plenary.nvim'
Plug 'tami5/sql.nvim'
Plug 'lewis6991/gitsigns.nvim'                                    " git essentials
Plug 'tpope/vim-fugitive'
Plug 'iberianpig/tig-explorer.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'tpope/vim-rhubarb'
Plug 'ygm2/rooter.nvim'                                           " autochdir to git repo root
Plug 'hoob3rt/lualine.nvim'                                       " status
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-telescope/telescope.nvim'                              " fuzzy search
Plug 'nvim-telescope/telescope-frecency.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'sudormrfbin/cheatsheet.nvim'
Plug 'tpope/vim-commentary'                                       " comment on gc
Plug 'tpope/vim-surround'                                         " brakets, quotes, etc
Plug 'raimondi/delimitmate'
Plug 'neoclide/coc.nvim', {'branch': 'release'}                   " dev essentials
Plug 'wakatime/vim-wakatime'
Plug 'tpope/vim-abolish'                                          " substitution
Plug 'svermeulen/vim-easyclip'                                    " yank to clipboard, 'd' for delete, 'm' for cut, 's' for substitute
Plug 'tpope/vim-repeat'                                           " plugins '.' operator
Plug 'blueyed/vim-diminactive'                                    " inactive window indication
Plug 'tpope/vim-unimpaired'                                       " lots of key shortcuts
Plug 'chaoren/vim-wordmotion'                                     " navigate inside camelCase, kebab-case, etc
Plug 'phaazon/hop.nvim'                                           " 'f' for quick navigation
Plug 'tmux-plugins/vim-tmux-focus-events'                         " essential for tmux
Plug 'tmux-plugins/vim-tmux'
Plug 'jrudess/vim-foldtext'                                       " fold options
Plug 'karb94/neoscroll.nvim'
Plug 'bogado/file-line'                                           " `vim file:line` opens the file with caret on the line
Plug 'vim-scripts/BufOnly.vim'                                    " kill all buffers except current one
Plug 'vim-scripts/Rename2'                                        " rename current file and open it
Plug 'vim-scripts/AnsiEsc.vim'                                    " color sequesnces in terminal
Plug 'honza/vim-snippets'                                         " snippet libs
Plug 'sirver/ultisnips'
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown'} " md support
Plug 'plasticboy/vim-markdown'
Plug 'kjwon15/vim-transparent'                                    " remove background color
Plug 'neoclide/jsonc.vim'                                         " jsonc
Plug 'uarun/vim-protobuf'                                         " protobuf

if(!has('nvim-0.6'))
  Plug 'PeterRincker/vim-argumentative'                           " manipulating and moving between function arguments
  Plug 'lifepillar/vim-solarized8'                                " theme
endif
if (has('nvim-0.6'))                                              " experimental stuff
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}     " AST parser
  Plug 'mizlan/iswap.nvim'                                        " args swapper
  Plug 'ishan9299/nvim-solarized-lua'                             " theme
  Plug 'p00f/nvim-ts-rainbow'                                     " parens
endif
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

" easyclip settings {{{
" yank/paste with system clipboard by default
set clipboard=unnamed
" yank history @ ~/.easyclip
let g:EasyClipShareYanks=1
" `s` for substitution
let g:EasyClipUseSubstituteDefaults=1
" }}}

" hop {{{
nmap f <cmd>HopChar2<CR>
onoremap <silent> ,l <cmd>HopLine<CR>
onoremap <silent> ,. <cmd>HopWord<CR>
vnoremap <silent> ,l <cmd>HopLine<CR>
vnoremap <silent> ,. <cmd>HopWord<CR>
nnoremap <silent> ,l <cmd>HopLine<CR>
nnoremap <silent> ,. <cmd>HopWord<CR>
lua require'hop'.setup{ tease = true }
" }}}

" delimitmate {{{
let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_inside_quotes = 1
let g:delimitMate_balance_matchpairs = 1
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
noremap <leader>= <C-a>
noremap <leader>- <C-x>
noremap gF :vertical wincmd f<CR> " file commands
let mapleader = "`"
nnoremap <Tab> <C-w><C-w>
nnoremap <S-Tab> gt
" }}}

" telescope {{{
lua << EOF
require('telescope').setup{
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = false, -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
    }
  }
}
require"telescope".load_extension("frecency")
require"telescope".load_extension("fzf")
EOF
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <Leader>e :lua require'telescope'.extensions.frecency.frecency()<cr>
nnoremap <Leader>* :lua require'telescope.builtin'.grep_string{}<cr>
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
  autocmd BufEnter .vimrc setlocal foldmethod=marker
  au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=300, on_visual=true}
augroup END
" }}}

" macros {{{
let @c = "vi):s/, /) => (/\<CR>"                                  " curry
let @t = "yawi(\<right>\<Esc>ea: \<Esc>pi)\<Esc>bvU\<Esc>"   " type
let @r = "ysi}}ireturn \<Esc>ds):w\<CR>"                          " return object literal
" }}}

" functions {{{
"
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
call SetupCommandAlias("W", "w")
call SetupCommandAlias("Wq", "wq")
call SetupCommandAlias("Q", "q")
call SetupCommandAlias("Qa", "qa")
call SetupCommandAlias("vterm", "VTerm")
call SetupCommandAlias("tterm", "TTerm")
call SetupCommandAlias("sterm", "STerm")
call SetupCommandAlias("gco", "Git checkout")
call SetupCommandAlias("gcb", "Git checkout -b")
call SetupCommandAlias("gcm", "Git checkout master")
call SetupCommandAlias("gup", "Git pull --rebase")
call SetupCommandAlias("gp", "Git push")
call SetupCommandAlias("gpsup", ":Git -c push.default=current push")
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

" gitsigns {{{
lua require('gitsigns').setup({ current_line_blame = true })
" }}}

" fugitive mappings {{{
nnoremap dgh :diffget //2<CR>
nnoremap dgl :diffget //3<CR>
nnoremap gbr :GBrowse<CR>
vnoremap gbr :GBrowse<CR>
" }}}

" tig-explorer {{{
nnoremap <Leader>T :TigOpenCurrentFile<CR>
nnoremap <Leader>t :TigOpenProjectRootDir<CR>
" }}}

" coc {{{
let g:coc_global_extensions = ['coc-prettier', 'coc-tsserver', 'coc-json', 'coc-eslint', 'coc-marketplace', 'coc-vimlsp']

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Use `[w` and `]w` to navigate diagnostics
nmap <silent> [w <Plug>(coc-diagnostic-prev)
nmap <silent> ]w <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <leader>p <cmd>Prettier<CR>
nmap <silent> <leader>q <cmd>CocAction<CR>
nmap <silent> <F3> <cmd>CocRestart<CR>
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" }}}

" Dynamic theme {{{
if (has("termguicolors"))
  set termguicolors
endif
" colors
let g:diminactive_use_syntax = 1
let g:diminactive_enable_focus = 1
let g:diminactive_use_colorcolumn = 0

if(!has('nvim-0.6'))
  colorscheme solarized8_flat
else
  colorscheme solarized-flat
  let g:solarized_italics = 1
  let g:solarized_diffmode = 'normal'
  let g:solarized_visibility = 'normal'
  let g:solarized_statusline = 'normal'
endif

function! SetColorScheme()
  " relies on COLOR_SCHEME var set by zsh
  let scheme = system("cat $HOME/.config/current_theme")
  if matchstr(scheme, 'dark') == 'dark'
    set background=dark
    lua require("plenary.reload").reload_module("lualine", true)
    lua require'lualine'.setup{ options = { theme = 'solarized_dark' }, sections = { lualine_b = {'branch', 'b:gitsigns_status', 'g:coc_status'}, lualine_c = {{ 'filename', path = 1 }}, lualine_x = {'encoding', 'filetype'}, lualine_y = {{'diagnostics', sources = {'coc'}, color_error='#ff0000', color_warn='#ffff00', color_info = '#0000ff', color_hint = '#00ff00' } } }, extensions={'fugitive'} }
  else
    set background=light
    lua require("plenary.reload").reload_module("lualine", true)
    lua require'lualine'.setup{ options = { theme = 'solarized_light' }, sections = { lualine_b = {'branch', 'b:gitsigns_status', 'g:coc_status'}, lualine_c = {{ 'filename', path = 1 }}, lualine_x = {'encoding', 'filetype'}, lualine_y = {{'diagnostics', sources = {'coc'}, color_error='#ff0000', color_warn='#ffff00', color_info = '#0000ff', color_hint = '#00ff00' } } }, extensions={'fugitive', 'quickfix'} }
  endif
endfunction

call SetColorScheme()
" }}}

" devicons {{{
lua require'nvim-web-devicons'.setup{}
" }}}

" ultisnips {{{
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsEditSplit="vertical"
nmap <silent> <F2> <cmd>UltiSnipsEdit<CR>
" }}}

" Case sensitive asterisk search {{{
nnoremap <silent>  * :let @/='\C\<' . expand('<cword>') . '\>'<CR>:let v:searchforward=1<CR>n
nnoremap <silent>  # :let @/='\C\<' . expand('<cword>') . '\>'<CR>:let v:searchforward=0<CR>n
nnoremap <silent> g* :let @/='\C'   . expand('<cword>')       <CR>:let v:searchforward=1<CR>n
nnoremap <silent> g# :let @/='\C'   . expand('<cword>')       <CR>:let v:searchforward=0<CR>n
" }}}

" BufOnly mappings {{{
nnoremap <silent> <C-w>b <cmd>BufOnly<cr>
" }}}

" neoscroll {{{
lua require('neoscroll').setup()
" }}}

" iswap {{{
if(has('nvim-0.6'))
  nnoremap <silent> ,, <cmd>ISwap<CR>
  nnoremap <silent> << <cmd>ISwapWith<CR>
endif
" }}}

" rainbow {{{
lua << EOF
require'nvim-treesitter.configs'.setup {
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    colors = {}, -- table of hex strings
    termcolors = {} -- table of colour name strings
  }
}
EOF
" }}}

" Abbreviations {{{
ab cosnt const
abbrev hrlp help
" }}}

" local settings - keep this last {{{
silent! so .vimlocal
" }}}
