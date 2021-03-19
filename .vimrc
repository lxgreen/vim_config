" Plugins {{{
call plug#begin('~/.local/share/nvim/plugged')
Plug 'zhaocai/goldenview.vim'                                     " autoresize panes
Plug 'mhartington/oceanic-next'                                   " theme
Plug 'lifepillar/vim-solarized8'
Plug 'arthurxavierx/vim-caser'                                    " switch case (kebab, camel, etc)
Plug 'tpope/vim-fugitive'                                         " git essentials
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/vim-emoji'                                         " status
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " search
Plug 'junegunn/fzf.vim'
Plug 'tomtom/tcomment_vim'                                        " comment on gc
Plug 'pangloss/vim-javascript'                                    " highlight
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'tpope/vim-surround'                                         " surround with brakets, tags, etc
Plug 'raimondi/delimitmate'                                       " parens autocomplete
" Plug 'neoclide/coc.nvim', {'branch': 'release'}                   " dev essentials
Plug 'dense-analysis/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'wakatime/vim-wakatime'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'tpope/vim-abolish'                                          " substitution
Plug 'tpope/vim-obsession'                                        " session management
Plug 'svermeulen/vim-easyclip'                                    " yank to clipboard, 'd' for delete, 'x' for cut
Plug 'tpope/vim-repeat'                                           " plugins '.' operator
Plug 'vim-scripts/grep.vim'                                       " find in files
Plug 'mhinz/vim-grepper'
Plug 'chrisbra/unicode.vim'
Plug 'blueyed/vim-diminactive'                                    " inactive window indication
Plug 'tpope/vim-dispatch'                                         " compiler run
Plug 'radenling/vim-dispatch-neovim'
Plug 'tpope/vim-unimpaired'                                       " lots of key shortcuts
Plug 'janko/vim-test'                                             " tests
Plug 'craigdallimore/vim-jest-cli', { 'for': 'javascript' }
Plug 'chaoren/vim-wordmotion'                                     " navigate inside camelCase, kebab-case, etc
Plug 'elentok/plaintasks.vim'                                     " todo list: + adds task, = marks it complete
Plug 'freitass/todo.txt-vim'                                      " todo.txt format tasks
Plug 'godlygeek/tabular'                                          " auto-align columns
Plug 'plasticboy/vim-markdown'
Plug 'easymotion/vim-easymotion'                                  " 'f' for quick navigation (cross-window)
Plug 'tmux-plugins/vim-tmux-focus-events'                         " essential for tmux
Plug 'tmux-plugins/vim-tmux'
Plug 'jacquesbh/vim-showmarks'                                    " show marks command
Plug 'mox-mox/vim-localsearch'                                    " search per window mode
Plug 'jrudess/vim-foldtext'
Plug 'francoiscabrol/ranger.vim'                                  " file manager
Plug 'rbgrouleff/bclose.vim'
Plug 'bogado/file-line'                                           " `vim file:line` opens the file with caret on the line
Plug 'vim-scripts/BufOnly.vim'                                    " kill all buffers except current one
Plug 'vim-scripts/Rename2'                                        " rename current file
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } } " nvim for firefox
Plug 'vim-scripts/AnsiEsc.vim'                                    " color sequesnces in terminal
Plug 'honza/vim-snippets'                                         " snippet libs
Plug 'sirver/ultisnips'
Plug 'isruslan/vim-es6'
Plug 'junegunn/goyo.vim'                                          " presentation mode
Plug 'junegunn/limelight.vim'
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown'}
call plug#end()
" }}}

" Basic options {{{
set nocompatible                                  " don't care about vi
filetype plugin indent on                         " file type detection, plugin for type, indent for type
set nu rnu                                        " relative line numbers
set ruler                                         " color column
set colorcolumn=120
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
let g:solarized_termcolors=16
colorscheme solarized8_high " theme
syntax enable
set ignorecase
set smartcase
set inccommand=nosplit                            " search/replace preview
set conceallevel=1
" }}}

" folding and editing mappings {{{
" editing
nnoremap D kdd
nnoremap C kcc
" folding
nnoremap + zo
nnoremap - zc
" }}}

" Airline plugin settings {{{
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#localsearch#enabled=1
let g:airline_theme='solarized'
let g:airline_section_x=' %{ObsessionStatus(">","||")}'
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
  let g:EasyClipAlwaysMoveCursorToEndOfPaste=1
  " yank/paste with system clipboard by default
  set clipboard=unnamed
  " yank history @ ~/.easyclip
  let g:EasyClipShareYanks=1
  let g:EasyClipShareYanksFile='.easyclip'
  let g:EasyClipShareYanksDirectory='$HOME'
  " `d` now deletes text completely, `x` -- cuts
  let g:EasyClipUseCutDefaults = 0
  nmap x <Plug>MoveMotionPlug
  xmap x <Plug>MoveMotionXPlug
  nmap xx <Plug>MoveMotionLinePlug
  " `s` for substitution
  let g:EasyClipUseSubstituteDefaults=1
  let g:EasyClipUsePasteToggleDefaults = 0
  nmap <c-f> <plug>EasyClipSwapPasteForward
  nmap <c-d> <plug>EasyClipSwapPasteBackwards
" }}}

" easymotion {{{
  nmap f <Plug>(easymotion-overwin-f2)
" }}}

" markdown settings {{{
  let g:vim_markdown_folding_disabled = 1
  " set conceallevel=2
  let g:vim_markdown_conceal = 0
" }}}

if !exists('g:started_by_firenvim')

" standalone editor settings {{{
  set undodir=$HOME/.local/share/nvim/undo
  set undofile
" }}}

" standalone editor mappings {{{
  noremap gF :vertical wincmd f<CR> " file commands
  inoremap jj <ESC>
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
  nnoremap <F2> :FZF<CR>
  nnoremap ,e :call fzf#vim#gitfiles('', fzf#vim#with_preview('right'))<CR>
  nnoremap ,b :Buffers<CR>
  nnoremap ,f :Files<CR>
  nnoremap ,l :BLines<CR>
  nnoremap ,w :Windows<CR>
 " }}}

" Dynamic theme and platofrm dependent stuff {{{
  if (has("termguicolors"))
    set termguicolors
  endif

  " colors
  let g:diminactive_use_syntax = 1
  let g:diminactive_enable_focus = 1
  let g:diminactive_use_colorcolumn = 1

  function! SetColorScheme()
    " requires macos, works in catalina -- use env var instead
    let @z = system("defaults read -g AppleInterfaceStyle | grep Dark")
    if matchstr(@z, 'Dark') == 'Dark'
      set background=dark
    else
      set background=light
    endif
  endfunction

  if (executable('defaults'))
    call SetColorScheme()
  endif
" }}}

" dotfile and todo access mappings {{{
  nnoremap <silent> <leader>zz :tabe ~/.zshrc <bar> :lcd ~/.zsh<cr>
  nnoremap <silent> <leader>cp :PlugInstall<cr>
  nnoremap <silent> <leader>cv :vsplit ~/.vimrc <bar> :lcd ~/vim_config<cr>
  nnoremap <silent> <leader>sv :source $MYVIMRC<cr>
  nnoremap <silent> <F5> :source $MYVIMRC<cr>
  nnoremap <silent> <leader>tt :tabe ~/.tmux.conf<cr>
  nnoremap <silent> <leader>ww :tabe ~/.yabairc <bar> :vsplit ~/.skhdrc<cr>
  nnoremap <silent> <leader>xx :tabe ~/IDrive-Sync/done.txt <bar> :vs ~/IDrive-Sync/todo.txt<cr>
" }}}

" window management mappings {{{
  nnoremap <Right> <C-w>l
  nnoremap <Left> <C-w>h
  nnoremap <Up> <C-w>k
  nnoremap <Down> <C-w>j
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
    autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
    autocmd InsertLeave * if pumvisible() == 0|pclose|endif
    autocmd BufRead,BufNewFile *.json set filetype=json
    autocmd BufRead,BufNewFile *.md set filetype=markdown
    " auto save session on exit
    autocmd VimLeave * call SaveCurrentSession()
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim setlocal fileencoding=UTF-8
    autocmd BufWritePre *todo.txt :normal \s+
    autocmd BufWritePre *.js,*.jsx,*.json,*.ts,*.tsx Prettier
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

" macros {{{
  " append date
  let @d = ':s/$/\=strftime(''%b %d, %Y'')_kb/'
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
  call SetupCommandAlias("npm", "Dispatch npm run")
  call SetupCommandAlias("yarn", "Dispatch yarn")
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

" Dispatch settings {{{
  let test#strategy = "dispatch"
  let g:dispatch_compilers = { 'jest': 'jest-cli' }
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

" gitgutter settings {{{
  let g:gitgutter_sign_added = emoji#for('heavy_plus_sign')
  let g:gitgutter_sign_modified = emoji#for('heavy_division_sign')
  let g:gitgutter_sign_removed_first_line = emoji#for('heavy_minus_sign')
  let g:gitgutter_sign_removed = emoji#for('heavy_minus_sign')
  let g:gitgutter_sign_modified_removed = emoji#for('heavy_dollar_sign')
  let g:gitgutter_diff_args = '-w'
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
  nnoremap <c-space> :ALEHover<CR>
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

" localsearch mappings {{{
  nmap <leader>/ <Plug>localsearch_toggle
" }}}

" BufOnly mappings {{{
  nnoremap <silent> <leader>b :BufOnly<cr>
" }}}

" ranger settings {{{
  let g:ranger_map_keys = 0
  noremap <silent> <leader>o :Ranger<CR>
  let g:ranger_replace_netrw = 1
  let g:ranger_command_override = 'ranger --cmd "set show_hidden=true"'
" }}}

" Mappings to make Vim more friendly towards presenting slides {{{
  autocmd BufNewFile,BufRead *.vpm call SetVimPresentationMode()
  function SetVimPresentationMode()
    nnoremap <buffer> <Right> :n<CR>
    nnoremap <buffer> <Left> :N<CR>

    if !exists('#goyo')
      Goyo
    endif
  endfunction
" }}}

" local settings - keep this last {{{
  silent! so .vimlocal
" }}}

else
" file types by url {{{
  augroup firenvim
    autocmd!
    au BufEnter github.com_*.txt set filetype=markdown
  augroup END
" }}}

" config {{{
  let g:firenvim_config = {
        \ 'globalSettings': {
        \ 'alt': 'all',
        \  },
        \ 'localSettings': {
        \ '.*': {
        \ 'cmdline': 'neovim',
        \ 'priority': 0,
        \ 'selector': 'textarea',
        \ 'takeover': 'always',
        \ },
        \ }
        \ }
" }}}

" URL specific overrides {{{
  let fc = g:firenvim_config['localSettings']
  let fc['https?://.*asana\.com'] = { 'takeover': 'never', 'priority': 1 }
  let fc['https?://.*mail\.google\.com'] = { 'takeover': 'never', 'priority': 1 }
" }}}
endif

