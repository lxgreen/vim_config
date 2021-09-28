" Plugins {{{
call plug#begin('~/.local/share/nvim/plugged')
Plug 'nvim-lua/popup.nvim'                                        " lua infra
Plug 'nvim-lua/plenary.nvim'
Plug 'tami5/sql.nvim'
Plug 'lewis6991/gitsigns.nvim'                                    " git essentials
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'ahmedkhalf/project.nvim'                                    " autochdir to git repo root
Plug 'hoob3rt/lualine.nvim'                                       " status
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-telescope/telescope.nvim'                              " fuzzy search
Plug 'nvim-telescope/telescope-frecency.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'sudormrfbin/cheatsheet.nvim'                                " command hints in telescope
Plug 'tpope/vim-commentary'                                       " comment on gc
Plug 'tpope/vim-surround'                                         " brackets, quotes, etc
Plug 'raimondi/delimitmate'                                       " parens + auto expansion on space, new line
Plug 'neovim/nvim-lspconfig'                                      " dev essentials
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
Plug 'folke/lsp-colors.nvim'                                      " color-groups for lsp
Plug 'folke/trouble.nvim'                                         " pretty lists
Plug 'wakatime/vim-wakatime'
Plug 'tpope/vim-abolish'                                          " substitution
Plug 'svermeulen/vim-easyclip'                                    " yank to clipboard, 'd' for delete, 'm' for cut, 's' for substitute
Plug 'tpope/vim-repeat'                                           " plugins '.' operator
Plug 'tpope/vim-unimpaired'                                       " lots of key shortcuts
Plug 'chaoren/vim-wordmotion'                                     " navigate inside camelCase, kebab-case, etc
Plug 'phaazon/hop.nvim'                                           " 'f' for quick navigation
Plug 'tmux-plugins/vim-tmux-focus-events'                         " essential for tmux
Plug 'tmux-plugins/vim-tmux'
Plug 'christoomey/vim-tmux-navigator'                             " CTRL+HJKL pane navigationn
Plug 'jrudess/vim-foldtext'                                       " fold options
Plug 'karb94/neoscroll.nvim'                                      " smooth scroll
Plug 'bogado/file-line'                                           " `vim file:line` opens the file with caret on the line
Plug 'vim-scripts/BufOnly.vim'                                    " kill all buffers except current one
Plug 'famiu/bufdelete.nvim'
Plug 'jghauser/mkdir.nvim'                                        " mkdir -p while saving files
Plug 'vim-scripts/AnsiEsc.vim'                                    " color sequences in terminal
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown'} " md support
Plug 'plasticboy/vim-markdown'
Plug 'neoclide/jsonc.vim'                                         " jsonc
Plug 'uarun/vim-protobuf'                                         " protobuf
Plug 'tpope/vim-speeddating'                                      " date inc/dec
if(!has('nvim-0.6'))
  Plug 'PeterRincker/vim-argumentative'                           " manipulating and moving between function arguments
  Plug 'lifepillar/vim-solarized8'                                " theme
endif
if (has('nvim-0.6'))                                              " experimental stuff
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}     " AST parser
  Plug 'nvim-treesitter/nvim-treesitter-textobjects'
  Plug 'mizlan/iswap.nvim'                                        " args swapper
  Plug 'ishan9299/nvim-solarized-lua'                             " theme
  Plug 'p00f/nvim-ts-rainbow'                                     " parens
  Plug 'xiyaowong/nvim-transparent'                               " vim transparent bg
  Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}                       " autocomplete + snippets
  Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
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
set hidden
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

" project.nvim {{{
lua << EOF
require("project_nvim").setup {}
EOF
"}}}

" coq {{{
let g:coq_settings = { 'keymap.eval_snips': '<leader>j', 'keymap.jump_to_mark': 'c-q', 'auto_start': 'shut-up' }
nnoremap <F4> <cmd>COQsnip edit<cr>
" }}}

" trouble {{{
lua require("trouble").setup {}
nnoremap <leader>w <cmd>TroubleToggle lsp_workspace_diagnostics<cr>
" }}}

" lsp-colors {{{
lua require("lsp-colors").setup({ Error = "#db4b4b", Warning = "#e0af68", Information = "#0db9d7", Hint = "#10B981" })
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
lua require('hop').setup({ tease = true })
nmap f <cmd>HopChar2<CR>
onoremap <silent> ,l <cmd>HopLine<CR>
onoremap <silent> ,. <cmd>HopWord<CR>
vnoremap <silent> ,l <cmd>HopLine<CR>
vnoremap <silent> ,. <cmd>HopWord<CR>
nnoremap <silent> ,l <cmd>HopLine<CR>
nnoremap <silent> ,. <cmd>HopWord<CR>
" }}}

" delimitmate {{{
let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_inside_quotes = 1
let g:delimitMate_balance_matchpairs = 1
" }}}

" speeddating {{{
nmap <C-S> <Plug>SpeedDatingUp
nmap <C-X> <Plug>SpeedDatingDown
nnoremap <Plug>SpeedDatingFallbackUp <C-S>
nnoremap <Plug>SpeedDatingFallbackDown <C-X>
" }}}

" markdown settings {{{
let g:vim_markdown_folding_disabled = 1
" set conceallevel=2
let g:vim_markdown_conceal = 0
" }}}

" undo settings {{{
set undodir=$HOME/.local/share/nvim/undo
set undofile
" }}}

" basic mappings {{{
let mapleader = "`"
" nnoremap <leader>= <C-a>
" nnoremap <leader>- <C-x>
noremap gF :vertical wincmd f<CR> " file commands
nnoremap <Tab> <C-w><C-w>
nnoremap <S-Tab> <C-w><C-p>
nnoremap <M-Tab> gt
nnoremap Q <cmd>q<CR>
nnoremap <leader>d "=strftime("%b %d, %Y")<CR>P

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
require"telescope".load_extension("projects")
EOF
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <Leader>e :lua require'telescope'.extensions.frecency.frecency()<cr>
nnoremap <Leader>* :lua require'telescope.builtin'.grep_string{}<cr>

" }}}

" dotfile and todo access mappings {{{
nnoremap <silent> <leader>cv :vsplit ~/.vimrc <bar> :lcd ~/vim_config<cr>
nnoremap <silent> <F1> :vsplit ~/.vimrc <bar> :lcd ~/vim_config<cr>
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
  autocmd TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=300, on_visual=true}
  autocmd BufLeave * set nocursorcolumn | set nocursorline | set colorcolumn=0
  autocmd BufEnter * set cursorcolumn | set cursorline | set colorcolumn=120
augroup END
" }}}

" macros {{{
let @c = "vi):s/, /) => (/\<CR>"                                  " curry
let @t = "yawi(\<right>\<Esc>ea: \<Esc>pi)\<Esc>bvU\<Esc>"   " type
let @r = "ysi}}ireturn \<Esc>ds):w\<CR>"                          " return object literal
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

" lsp {{{
lua require("./lsp-config")
" }}}

" Dynamic theme {{{
if (has("termguicolors"))
  set termguicolors
endif
" colors
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

" treesitter {{{
if(has('nvim-0.6'))
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
lua << EOF
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.typescript.used_by = "typescriptreact"
require'nvim-treesitter.configs'.setup {
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = 1000
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "vv",
      node_incremental = "w",
      scope_incremental = "ss",
      node_decremental = "n",
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner"
      }
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>s"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>S"] = "@parameter.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]n"] = "@parameter.inner",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[n"] = "@parameter.inner",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
    lsp_interop = {
      enable = true,
      border = 'single',
      peek_definition_code = {
        ["df"] = "@function.outer",
        ["dF"] = "@class.outer",
      },
    },
  }
}
EOF
endif
" }}}

" iswap {{{
if(has('nvim-0.6'))
  nnoremap <silent> ,, <cmd>ISwap<CR>
  nnoremap <silent> << <cmd>ISwapWith<CR>
endif
" }}}

" transparent {{{
if(has('nvim-0.6'))
  lua require("transparent").setup({ enable = true })
endif
" }}}

" mkdir {{{
lua require('mkdir')
"}}}

" Abbreviations {{{
abbrev cosnt const
abbrev hrlp help
" }}}

" local settings - keep this last {{{
silent! so .vimlocal
" }}}
