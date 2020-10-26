" Plugins {{{
call plug#begin('~/.local/share/nvim/plugged')
Plug 'zhaocai/goldenview.vim'                                      " autoresize panes
Plug 'mhartington/oceanic-next'                                    " theme
Plug 'lifepillar/vim-solarized8'
Plug 'arthurxavierx/vim-caser'                                     " switch case (kebab, camel, etc)
Plug 'tpope/vim-fugitive'                                          " git essentials
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/vim-emoji'                                          " status
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }  " search
Plug 'junegunn/fzf.vim'
Plug 'tomtom/tcomment_vim'                                         " comment on gc
Plug 'sheerun/vim-polyglot'                                        " syntax highlight
Plug 'tpope/vim-surround'                                          " surround with brakets, tags, etc
Plug 'raimondi/delimitmate'                                        " parens autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}                    " dev essentials
Plug 'wakatime/vim-wakatime'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'tpope/vim-abolish'                                           " substitution
Plug 'tpope/vim-obsession'                                         " session management
Plug 'svermeulen/vim-easyclip'                                     " yank to clipboard, 'd' for delete, 'x' for cut
Plug 'tpope/vim-repeat'                                            " plugins '.' operator
Plug 'vim-scripts/grep.vim'                                        " find in files
Plug 'mhinz/vim-grepper'
Plug 'chrisbra/unicode.vim'
Plug 'blueyed/vim-diminactive'                                     " inactive window indication
Plug 'tpope/vim-dispatch'                                          " compiler run
Plug 'radenling/vim-dispatch-neovim'
Plug 'tpope/vim-unimpaired'                                        " lots of key shortcuts
Plug 'janko/vim-test'                                              " tests
Plug 'craigdallimore/vim-jest-cli', { 'for': 'javascript' }
Plug 'chaoren/vim-wordmotion'                                      " navigate inside camelCase, kebab-case, etc
Plug 'elentok/plaintasks.vim'                                      " todo list: + adds task, = marks it complete
Plug 'freitass/todo.txt-vim'                                       " todo.txt format tasks
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'easymotion/vim-easymotion'                                   " 'f' for quick navigation (cross-window)
Plug 'tmux-plugins/vim-tmux-focus-events'                          " essential for tmux
Plug 'tmux-plugins/vim-tmux'
Plug 'jacquesbh/vim-showmarks'                                     " show marks command
Plug 'mox-mox/vim-localsearch'                                     " search per window mode
Plug 'jrudess/vim-foldtext'
Plug 'francoiscabrol/ranger.vim'                                   " file manager
Plug 'rbgrouleff/bclose.vim'
Plug 'bogado/file-line'                                            " `vim file:line` opens the file with caret on the line
Plug 'vim-scripts/BufOnly.vim'                                     " kill all buffers except current one
Plug 'takac/vim-hardtime'                                          " navigation habits
Plug 'vim-scripts/Rename2'                                         " rename current file
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }  " nvim for firefox
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
set backupdir=$TEMP//
set directory=$TEMP//
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
set inccommand=nosplit
" }}}

" folding and editing mappings {{{
" wrapping mappings based on surround plugin
nmap <space>' ysiw"
nmap <leader>' ysiw'
nmap <space>[ ysiw]
nmap <space>] ysiw]
nmap <space>9 ysiw)
nmap <space>1 ysiw)
nmap <leader>[ ysiw}
nmap <leader>] ysiw}
nmap <space>` ysiw`
nmap <space>. ysiw>
nmap <space>, ysiw>
" editing
nnoremap D kdd
nnoremap C kcc
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
  set conceallevel=2
  let g:vim_markdown_conceal = 0
" }}}

if !exists('g:started_by_firenvim')

" standalone editor settings {{{
  set undodir=$HOME/.local/share/nvim/undo
  set undofile
" }}}

" standalone editor mappings {{{
  noremap gF :vertical wincmd f<CR> " file commands
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
 " }}}

" Dynamic theme and platofrm dependent stuff {{{
  if (has("termguicolors"))
    set termguicolors
  endif

  " colors
  let g:diminactive_use_syntax = 1
  let g:diminactive_enable_focus = 1
  let g:diminactive_use_colorcolumn = 0

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
    autocmd InsertEnter * set norelativenumber
    autocmd InsertLeave * set relativenumber
    autocmd BufWritePre /tmp/* setlocal noundofile
    " auto-close preview window
    autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
    autocmd InsertLeave * if pumvisible() == 0|pclose|endif
    autocmd BufRead,BufNewFile *.json set filetype=json
    autocmd BufRead,BufNewFile *.md set filetype=markdown
    " auto save session on exit
    autocmd VimLeave * call SaveCurrentSession()
    autocmd FileType vim setlocal foldmethod=marker
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
" }}}

" macros {{{
  " append date
  let @d = ':s/$/\=strftime(''%b %d, %Y'')_�kb/'
" }}}

" commands {{{
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

" coc.nvim plugin settings {{{
  let g:coc_global_extensions = ['coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-eslint', 'coc-snippets', 'coc-tslint', 'coc-stylelint', 'coc-cssmodules', 'coc-marketplace']


  " Use tab for trigger completion with characters ahead and navigate.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <c-x> to trigger completion.
  inoremap <silent><expr> <c-x> coc#refresh()

  " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
  " position. Coc only does snippet and additional edit on confirm.
  " <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
  if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
  else
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
  endif

  " Use `[w` and `]w` to navigate diagnostics
  nmap <silent> [w <Plug>(coc-diagnostic-prev)
  nmap <silent> ]w <Plug>(coc-diagnostic-next)

  " GoTo code navigation.
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

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

  " Formatting selected code.
  xmap <leader>f  <Plug>(coc-format-selected)
  nmap <leader>f  <Plug>(coc-format-selected)

  augroup mygroup
    autocmd!
    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  " Applying codeAction to the selected region.
  " Example: `<leader>aap` for current paragraph
  xmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap keys for applying codeAction to the current line.
  nmap <leader>ac  <Plug>(coc-codeaction)
  " Apply AutoFix to problem on the current line.
  nmap <leader>qf  <Plug>(coc-fix-current)

  " Map function and class text objects
  " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
  xmap if <Plug>(coc-funcobj-i)
  omap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap af <Plug>(coc-funcobj-a)
  xmap ic <Plug>(coc-classobj-i)
  omap ic <Plug>(coc-classobj-i)
  xmap ac <Plug>(coc-classobj-a)
  omap ac <Plug>(coc-classobj-a)

  " Use CTRL-S for selections ranges.
  " Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
  nmap <silent> <C-s> <Plug>(coc-range-select)
  xmap <silent> <C-s> <Plug>(coc-range-select)

  " Add `:Format` command to format current buffer.
  command! -nargs=0 Format :call CocAction('format')

  " Add `:Fold` command to fold current buffer.
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " Add `:OR` command for organize imports of the current buffer.
  command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

  " Add (Neo)Vim's native statusline support.
  " NOTE: Please see `:h coc-status` for integrations with external plugins that
  " provide custom statusline: lightline.vim, vim-airline.
  " set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

  " Mappings using CoCList:
  " Show all diagnostics.
  nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
  " Manage extensions.
  nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
  " Show commands.
  nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
  " Find symbol of current document.
  nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
  " Search workspace symbols.
  nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
  " Do default action for next item.
  nnoremap <silent> <space>j  :<C-u>CocNext<CR>
  " Do default action for previous item.
  nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
  " Resume latest coc list.
  nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
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

" hardtime settings {{{
  let g:hardtime_default_on = 1
  let g:list_of_normal_keys = ["h", "j", "k", "l"]
" }}}

" ranger settings {{{
  let g:ranger_map_keys = 0
  noremap <silent> <leader>o :Ranger<CR>
  let g:ranger_replace_netrw = 1
  let g:ranger_command_override = 'ranger --cmd "set show_hidden=true"'
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
