" ========================================
" ================= Dein =================
" ========================================
if &compatible
  set nocompatible
endif

" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  let g:deoplete#enable_at_startup = 1
  
" ================= Plugins =================
  " Dev Icons
  call dein#add('ryanoasis/vim-devicons')

  " ALE language server
  call dein#add('dense-analysis/ale')

  " vinegar
  call dein#add('tpope/vim-vinegar')

  call dein#add('morhetz/gruvbox')

  call dein#add('tpope/vim-commentary')

  call dein#add('tpope/vim-fugitive')

  " This requires the local install of fzf!
  " Make dependent on fugitive to ensure fugitive is loaded on :Commits (to
  " allow commit inspection)
  call dein#add('~/.fzf')
  call dein#add('junegunn/fzf.vim',
    \{'on_cmd': [
    \    'Buffers',
    \    'GFiles',
    \    'Files',
    \    'Commits',
    \    'Commands',
    \    'History',
    \    'Lines',
    \    'BLines',
    \    'Ag',
    \    'Maps',
    \],
    \ 'depends': ['.fzf']})

  call dein#add('tpope/vim-surround')

  call dein#add('Yggdroot/indentLine')

  call dein#add('freitass/todo.txt-vim',
    \{'on_ft': 'todo'})

  " required for markdown table formatting
  call dein#add('godlygeek/tabular',
    \{'on_cmd': 'TableFormat'})

  " Language support (should be lazy by default)
  call dein#add('sheerun/vim-polyglot')

  " polyglot does not come with a java syntax highlightling
  call dein#add('uiiaoo/java-syntax.vim',
    \{'on_ft': 'java'})

  " rainbow parentheses
  call dein#add('luochen1990/rainbow')

  " better targets
  call dein#add('wellle/targets.vim')
  call dein#add('michaeljsmith/vim-indent-object')

  " marks in gutter
  call dein#add('kshenoy/vim-signature')

  " support <localleader>p and <localleader>P to cycle through yanks
  call dein#add('maxbrunsfeld/vim-yankstack')

  " highlight yanks
  call dein#add('machakann/vim-highlightedyank')

  " easy motion jumps (load after yankstack for mapping to work)
  call dein#add('haya14busa/incsearch.vim')
  call dein#add('haya14busa/incsearch-easymotion.vim')
  call dein#add('easymotion/vim-easymotion')

  " golden ratio
  call dein#add('roman/golden-ratio',
    \{'on_cmd': 'GoldenRatioToggle'})

  call dein#add('sjl/gundo.vim',
    \{'on_cmd': 'GundoToggle'})

  call dein#add('andrewradev/splitjoin.vim',
    \{'on_ft': [
    \ 'c',
    \ 'cpp',
    \ 'elixir',
    \ 'python',
    \ 'rust',
    \ 'tex',
    \ 'vim',
    \ 'yaml',
    \ 'lua',
    \ 'perl',
    \ 'go',
    \]})

  call dein#add('vim-scripts/a.vim',
    \{'on_ft': ['c', 'cpp']})

  call dein#add('embear/vim-localvimrc')

  call dein#add('tpope/vim-abolish')

  call dein#add('tpope/vim-endwise',
    \{'on_ft': [
    \ 'c',
    \ 'cpp',
    \ 'bash',
    \ 'elixir',
    \ 'vim',
    \ 'lua',
    \ 'make',
    \ 'crystal',
    \]})

  call dein#add('bling/vim-airline')

  call dein#add('bkad/camelcasemotion')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" ================= Load Custom Plugins =================

" ================= Bindings =================
" <Esc> remaps
nnoremap fd <Esc>
inoremap fd <Esc>
vnoremap fd <Esc>
cnoremap fd <Esc>

" fold fast
nnoremap <c-d> zA

" Fast scrolling
nnoremap <c-j> 10j
nnoremap <c-k> 10k
vnoremap <c-j> 10j
vnoremap <c-k> 10k
" Fast front back line movement
nnoremap <c-h> _
nnoremap <c-l> $
vnoremap <c-h> _
vnoremap <c-l> $
onoremap <c-h> _
onoremap <c-l> $

" Leader update
let maplocalleader = '\'
nnoremap <Space> <Nop>
let mapleader = "\<Space>"

" ==> General
" (q)uit
nnoremap <leader>qq :qa<enter>
" (q)uit and (s)ave
nnoremap <leader>qs :wqa<enter>
" hard (Q)uit
nnoremap <leader>qQ :qa!<enter>

" ==> Search
" (s)earch (c)lear (highlighting)
nnoremap <leader>sc :noh<enter>
" > see ALE configuration
" (ss) search symbol
" (sd) search definition
" (sr) search references
" > see FZF configuration
" (sl) search lines in buffer
" (sL) search lines in all buffers
" (sg) search git commits
" (sC) search commands
" (sS) search search history
" (sh) search command history
" (sk) search keymapping
" (s)earch (c)lear (highlighting)

" ==> Errors
" (e)rrors (s)how
nnoremap <leader>es :messages<enter>
" (en) search next error
" (eN) search previous error

" ==> Terminal (System)
" open (t)erminal
nnoremap <leader>tt :tabnew<enter>:terminal<enter>a
" open (t)erminal on (s)split
nnoremap <leader>ts :split<enter>:terminal<enter>a
" open (t)erminal on (v)ertical split
nnoremap <leader>tv :vsplit<enter>:terminal<enter>a

" ==> Toggle
" (t)oggle colorcolumn (l)ine 
nnoremap <leader>tl :set colorcolumn=100<enter>

" ==> Git
" (g)it (s)tatus
nnoremap <leader>gs :Gstatus<enter>
" (g)it (p)tatus
nnoremap <leader>gp :Gpush<enter>
" (g)it (f)etch
nnoremap <leader>gf :Gfetch<enter>
" (g)it pul(l)
nnoremap <leader>gl :Gpull<enter>
" (g)it (c)ommit
nnoremap <leader>gc :Gcommit<enter>a
" (g)it (a)dd
nnoremap <leader>ga :Gwrite<enter>
" (g)it (A)mend
nnoremap <leader>gA :Git commit --amend<enter>
" (g)it (m)ove
nnoremap <leader>gm :Gmove 
" (g)it (d)iff (exit via <leader>wd (or <c-w>q)
nnoremap <leader>gd :Gdiffsplit<enter>

" ==> Files
" (f)ile (s)ave
nnoremap <leader>fs :update<enter>
" (f)ile (n)ew (in buffer's dir)
nnoremap <leader>fn :e %:p:h/
" (f)ile (N)ew in project root
nnoremap <leader>fN :e 
" > see FZF configuration
" (ff)
" (fp)
" (fc)
" (fh)

" ==> Tabs 
" nagivation
nnoremap <leader>t1 1gt
nnoremap <leader>t2 2gt
nnoremap <leader>t3 3gt
nnoremap <leader>t4 4gt
nnoremap <leader>t5 5gt
" (t)ab (n)ew
nnoremap <leader>tn :tabnew<enter>

" ==> Windows
" (w)indow (d)elete
nnoremap <leader>wd :q<enter>
" (w)indow (v)ertical split
nnoremap <leader>wv :vsplit<enter>
" (w)indow (s)plit
nnoremap <leader>ws :split<enter>
" (w)indow focus l
nnoremap <leader>wl <c-w>l
" (w)indow focus h
nnoremap <leader>wh <c-w>h
" (w)indow focus j
nnoremap <leader>wj <c-w>j
" (w)indow focus k
nnoremap <leader>wk <c-w>k

" ==> Buffer
" Close buffer without closing window command
command! Bd :bp | :sp | :bn | :bd
" (b)uffer (d)elete
nnoremap <leader>bd :Bd<enter>
" fast switch buffer
nnoremap <leader><tab> :b#<enter>
" > see FZF configuration
" (bb)


" ==> Language specific
function s:MapMarkdown()
  " (l)anguage (t)oc
  nnoremap <leader>lt :Toc<enter>
  " (l)anguage (f)ormat table
  nnoremap <leader>lf :TableFormat<enter>
  " (l)angauge conceal (e)nable
  nnoremap <leader>le :set conceallevel=2<enter>
  " (l)angauge conceal (d)isable
  nnoremap <leader>ld :set conceallevel=0<enter>
endfunction
command! MapMarkdownKBShortCuts call s:MapMarkdown()
augroup MarkdownFileGroup
  autocmd Filetype markdown MapMarkdownKBShortCuts
  autocmd Filetype markdown IndentLinesDisable
augroup END
" > See A.vim for more

" ==> Insert mode
" Simple pasting from default register
inoremap <c-r> <c-r>"


" ================= Scrolling =================
" Start scrolling when 8 lines away from margin
set scrolloff=8
" Start side scrolling when 5 columns away from side
set sidescrolloff=5

"Allow folding
set foldenable
set foldmethod=indent
augroup PerlFileGroup
  autocmd Filetype perl set foldmethod=syntax
augroup END

" ================= Visualisation =================
syntax on
set background=dark
colorscheme gruvbox
" Use true colours -- disable on remote vim if connecting over SSH
" Remote connection detection done via `screen`.
if $STY ==# ''
  set termguicolors
endif

" Enable 256bit colors - also: override gnome-terminal's settings
set t_Co=256
 
" Enable UTF-8 encoding
set encoding=UTF-8

" Add column indication on column 100
set colorcolumn=+1
highlight ColorColumn ctermbg=darkgrey

" Show whitespace
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set list

" Enable todo tags terminated by colons
syn match   myTodo   contained   "\<\(TODO\|FIXME\):"
hi def link myTodo Todo

" ================= Indentation =================
set autoindent
set smartindent
set shiftwidth=2
set tabstop=2
set smarttab
set expandtab

" ================= Number column =================
" Numbers
set number
set relativenumber

" Toggle relative numbering, and set to absolute on loss of focus or insert mode
augroup LineNumberGroup
  autocmd InsertEnter * :set nornu
  autocmd InsertLeave * :set rnu
augroup END

" ================= Searching =================
" Ignorecase when searching
set ignorecase

" Incremental search - Vim starts searching when we start typing
set incsearch

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Macros should not wrap
set nowrapscan

" ================= Misc =================
" Highlight matching braces
set showmatch

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

" How many tenths of a second to blink when matching brackets
set matchtime=0

" When the last window will have a status line (2 = always)
set laststatus=2

" Disable wrapping of long lines into multiple lines
set nowrap

" History
set history=1000

" Persistent undo
set undofile

" enable wildmenu support for tab completion on file commands
set wildmenu
set wildmode=list:longest,full

" Enable spell checking and thesaurus completion.
" set spell

" Allow to change buffer if current is unsaved
set hidden

" ========================================================
" ================= Plugin Configuration =================
" ========================================================
" 
" ================= Airline =================
if !exists('g:airline_symbols')
	let g:airline_symbols= {}
endif
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline_theme= 'gruvbox'
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_powerline_fonts = 1
" 
" ================= Pomodoro =================
let g:tomato#interval = 60 * 25
let g:tomato#rest_time = 60 * 5
" let g:tomato#remind = ''
" let g:tomato#restinfo = ''
let g:tomato#show_clock = 1
let g:tomato#show_count_down = 1
let g:tomato#auto_reset_num = 4
" 
" ================= FZF =================
" Options
let g:fzf_buffers_jump = 1
let g:fzf_commits_log_options = '--color --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
" Bindings 
" control-p link
nnoremap <c-p> :GFiles<enter>
" (f)iles in (p)roject
nnoremap <leader>fp :GFiles<enter>
" (f)iles in all files in (P)roject
nnoremap <leader>fP :Files<enter>
" (f)iles in (c)urrent working directory (not same as project)
nnoremap <leader>fc :Files<enter>
" (f)ind (f)ile (in buffer's dir)
nnoremap <leader>ff :Files %:p:h<enter>
" (f)iles in (h)ome
nnoremap <leader>fh :Files ~/<enter>
" (s)earch (g)it commit
nnoremap <leader>sg :Commits<enter>
" (s)earch (C)ommand
nnoremap <leader>sC :Commands<enter>
" (s)earch using (a)g (silver searcher)
nnoremap <leader>sa :Ag<enter>
" (s)earch (k)eymapping
nnoremap <leader>sk :Maps<enter>
" (s)earch (s)earch history
nnoremap <leader>sS :History /<enter>
" (s)earch command (h)istory
nnoremap <leader>sh :History :<enter>
" (s)earch (l)ines
nnoremap <leader>sl :BLines<enter>
" (s)earch all (L)ines (across all buffers)
nnoremap <leader>sL :Lines<enter>
" (b)uffer fuzzy search
nnoremap <leader>bb :Buffers<enter>
" Completions
" imap <c-x><c-k> <plug>(fzf-complete-word)
" imap <c-x><c-f> <plug>(fzf-complete-path)
" imap <c-x><c-j> <plug>(fzf-complete-file-ag)
" imap <c-x><c-l> <plug>(fzf-complete-line)
" 
" ================= IndentLines =================
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" customize conceal colour
" let g:indentLine_color_term = 239
let g:indentLine_concealcursor = 'inc'
" needs to be 1 or 2 to work
let g:indentLine_conceallevel = 2
"
" ================= Todo.txt =================
nnoremap <leader>td :e todo.txt<enter>
"
" ================= EasyMotion =================
" perform overwindow easymotion search on space after search
function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<space>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))
" (t)ouch {char}{char} to move to {char}{char}
nmap t <Plug>(easymotion-overwin-f2)
"
" ================= Rainbow =================
let g:rainbow_conf = {
\    'guifgs': ['darkorange3', 'seagreen3', 'firebrick', 'royalblue3'],
\    'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\    'guis': [''],
\    'cterms': [''],
\    'operators': '_,_',
\    'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\    'separately': {
\        '*': {},
\        'markdown': {
\            'parentheses_options': 'containedin=markdownCode contained',
\        },
\        'lisp': {
\            'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\        },
\        'haskell': {
\            'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/\v\{\ze[^-]/ end=/}/ fold'],
\        },
\        'vim': {
\            'parentheses_options': 'containedin=vimFuncBody',
\        },
\        'perl': {
\            'syn_name_prefix': 'perlBlockFoldRainbow',
\        },
\        'stylus': {
\            'parentheses': ['start=/{/ end=/}/ fold contains=@colorableGroup'],
\        },
\        'css': 0,
\    }
\}
" enable by default
augroup RainbowGroup
  autocmd BufRead * RainbowToggleOn
  " disable for text files
  autocmd BufRead *.txt RainbowToggleOff
augroup END
"
" ================= Markdown (polyglot) =================
" indent nested lists only with 2 spaces insted of 4
let g:vim_markdown_new_list_item_indent = 2
" shrink toc is possible
let g:vim_markdown_toc_autofit = 1
"
" ================= C++11 (polyglot) =================
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
"
" ================= Python (polyglot) =================
let g:python_highlight_all = 1
"
" ================= ALE =================
" use ale as completion backend for deoplete
call deoplete#custom#option('sources', {
  \ '_': ['ale'],
  \})
" airline support
let g:airline#extensions#ale#enabled = 1
" set error message format
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" lint only on insert leave
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_enter = 1
" (s)earch (d)definition
nnoremap <leader>sd :ALEGoToDefinition<enter>
" (s)earch (r)eferences
nnoremap <leader>sr :ALEFindReferences<enter>
" (s)earch (s)ymbol
nnoremap <leader>ss :ALESymbolSearch 
" (e)rror (n)ext
nnoremap <silent> <leader>en :ALENextWrap<enter>
" (e)rror (N)previous
nnoremap <silent> <leader>eN :ALEPreviousWrap<enter>
" fix everything
nnoremap <leader>== :ALEFix<enter>
" disable some linters 
let g:ale_linters = {
  \ 'python': ['pyls'],  
  \}
let g:ale_fixers = {
  \ 'python': ['black'],
  \}
if executable('pyls')
  augroup PythonLanguageServer
    autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
  augroup END
endif
let g:ale_java_javalsp_executable='/home/jakob/.config/nvim/lsps/java-language-server/dist/lang_server_linux.sh'
"
" ================= Yank Highlight =================
let g:highlightedyank_highlight_duration = 200
"
" ================= Yank Stack =================
let g:yankstack_map_keys = 0
nmap <localleader>p <Plug>yankstack_substitute_older_paste
nmap <localleader>P <Plug>yankstack_substitute_newer_paste
"
" ================= Golden Ratio =================
" (t)oggle (g)olden ratio
nnoremap <leader>tg :GoldenRatioToggle<enter>
"
" ================= Gundo =================
" (t)oggle (u)ndo tree
nnoremap <leader>tu :GundoToggle<enter>
"
" ================= Deoplete =================
" use ale as completion backend for deoplete
call deoplete#custom#option('sources', {
  \ '_': ['ale'],
  \})
call deoplete#custom#option({
  \ 'auto_complete_delay': 200,
  \ 'smart_case': v:true,
  \})
"
" ================= A.vim =================
function s:MapCAndCpp()
  " (l)anguage (h)eader toggle
  nnoremap <leader>lh :A<enter>
endfunction
command! MapCAndCppBShortCuts call s:MapCAndCpp()
augroup CAndCppFileGroup
  autocmd Filetype c,cpp MapCAndCppBShortCuts
augroup END
"
" ================= CameelCaseMotion =================
map <silent> W <Plug>CamelCaseMotion_w
map <silent> B <Plug>CamelCaseMotion_b
map <silent> E <Plug>CamelCaseMotion_e
map <silent> gE <Plug>CamelCaseMotion_ge
sunmap W
sunmap B
sunmap E
sunmap gE
" ============================================
" ============================================
" ================= Security =================
" ============================================
" ============================================
set secure

