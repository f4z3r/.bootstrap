" ===========================================================================
" ======================= Minimal Vim Configuration =========================
" ===========================================================================

function Grep_operator(type)
  let saved_unnamed_register = @@

  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'char'
    normal! `[v`]y
  else
    return
  endif

  silent execute 'vimgrep! |\<' . @@ . '\>| %'
  copen

  let @@ = saved_unnamed_register
endfunction

function Get_project_root()
  return fnamemodify(finddir('.git', '.;'), ':h')
endfunction

function Toggle_background()
  if &background ==# 'dark'
    execute 'set background=light' 
  else
    execute 'set background=dark'
  endif
endfunction

function Copy_to_clipboard()
  let @+=@"
  echom 'Vim default register (>' . @" . '<) copied to system clipbard.'
endfunction

function Get_tmp_file()
  let name = '/tmp/vim_tmp_' . localtime()
  return name
endfunction

" ===========================================================================
" ==================== General Bindings Multi-Language ======================

" ==== Leader ============================================================{{{
" Leader update
let maplocalleader = '\'
nnoremap <Space> <Nop>
let mapleader = "\<Space>"
" }}}


" ==== ESC remaps ========================================================{{{
" <Esc> remaps
nnoremap fd <esc>
inoremap fd <esc>
vnoremap fd <esc>
cnoremap fd <esc>
tnoremap <esc> <c-\><c-N>
" }}}


" ==== Folding ==========================================================={{{
" reduce foldlevel
nnoremap <c-s> za
" increase foldlevel
nnoremap <c-d> zA
" unmap s in normal mode
nmap s <nop>
" }}}


" ==== Quickfix =========================================================={{{
" (q)uickfix (n)ext
nnoremap ]q :cnext<cr>
" (q)uickfix (p)revious
nnoremap [q :cprevious<cr>
" (q)uickfix (o)pen
nnoremap <leader>qo :copen<cr>
" (q)uickfix (c)lose
nnoremap <leader>qc :cclose<cr>
" }}}


" ==== Locations ========================================================={{{
" (l)ocation list (n)ext
nnoremap ]l :lnext<cr>
" (l)ocation list (o)pen
nnoremap [l :lprevious<cr>
" (l)ocation list (o)open
nnoremap <leader>lo :lopen<cr>
" (l)ocation list (c)lose
nnoremap <leader>lc :lclose<cr>
" }}}


" ==== Movement =========================================================={{{
" Fast scrolling
nnoremap <c-j> 10j
nnoremap <c-k> 10k
vnoremap <c-j> 10j
vnoremap <c-k> 10k
" Fast front back line movement
nnoremap <c-h> zH_
nnoremap <c-l> $
vnoremap <c-h> zH_
vnoremap <c-l> $
onoremap <c-h> _
onoremap <c-l> $

" Easy movement in insert mode
" delete word and char already default <c-w> and <c-h> respectively
" <c-a> pastes default register
" move to end of line
inoremap <c-e> <c-o>A
" move to beginning of line
inoremap <c-b> <c-o>I
" }}}


" ==== Search ============================================================{{{
" (s)earch (c)lear (highlighting)
nnoremap <leader>sc :noh<cr>
nnoremap ss :set operatorfunc=Grep_perator<cr>g@
vnoremap ss :<c-u>call Grep_operator(visualmode())<cr>
" search for visual selection using //
vnoremap // y/\V<c-r>=escape(@",'/\')<cr><cr>
" }}}


" ==== Machine (System) =================================================={{{
" machine escape terminal mode
tnoremap <leader>tt <c-\><c-N>
" (m)achine open terminal in (t)ab
nnoremap <leader>mt :tabnew<cr>:terminal<cr>a
" (m)achine open terminal on (s)split
nnoremap <leader>ms :split<cr>:terminal<cr>a
" (m)achine open terminal on (v)ertical split
nnoremap <leader>mv :vsplit<cr>:terminal<cr>a
" (m)achine vim (q)uit
nnoremap <leader>mq :qa<cr>
" (m)achine vim suspend (sleep zzz)
nnoremap <leader>mz <c-z>
" (m)achine vim hard (Q)uit
nnoremap <leader>mQ :qa!<cr>
" (m)achine (c)hange (d)irectory to directory of local file (only for tab)
nnoremap <leader>mcd :tcd %:p:h<cr>
" (m)achine (u)ndo change directory (only for tab)
nnoremap <leader>mu :execute 'tcd' . Get_project_root()<cr>
" }}}


" ==== Toggles ==========================================================={{{
nnoremap <leader>tl :set colorcolumn=100<cr>
" (t)oggle (b)ackground
nnoremap <leader>tb :call Toggle_background()<cr>
" (t)oggle (s)yntax
nnoremap <expr> <leader>ts exists('g:syntax_on') ? ':syntax off<cr>' : ':syntax enable<cr>'
" }}}


" ==== Files ============================================================={{{
" (f)ile (s)ave
nnoremap <leader>fs :update<cr>
" (f)ile (n)ew (in buffer's dir)
nnoremap <leader>fn :e %:p:h/
" (f)ile (N)ew in project root
nnoremap <leader>fN :e
" (f)ile (r)efresh
nnoremap <leader>fr :checktime %<cr>
" (f)ile new (t)emp
nnoremap <leader>ft :execute "e " . Get_tmp_file()<cr>
" vinegar simulation
nnoremap - :e .<cr>
" }}}


" ==== Windows ==========================================================={{{
" (w)indow (d)elete
nnoremap <leader>wd :q<cr>
" (w)indow (v)ertical split
nnoremap <leader>wv :vsplit<cr>
" (w)indow (s)plit
nnoremap <leader>ws :split<cr>
" (w)indow (r)esize (balances all windows)
nnoremap <leader>wr <c-w>=
" (w)indow focus l
nnoremap <leader>wl <c-w>lzH
tnoremap <leader>wl <c-\><c-N><c-w>lzH
" (w)indow focus h
nnoremap <leader>wh <c-w>hzH
tnoremap <leader>wh <c-\><c-N><c-w>hzH
" (w)indow focus j
nnoremap <leader>wj <c-w>jzH
tnoremap <leader>wj <c-\><c-N><c-w>jzH
" (w)indow focus k
nnoremap <leader>wk <c-w>kzH
tnoremap <leader>wk <c-\><c-N><c-w>kzH
" (w)indow (t)ab new
nnoremap <leader>wt :$tabnew<cr>
" }}}


" ==== Buffer ============================================================{{{
" close buffer without closing window command
command! Bd :bp | :sp | :bn | :bd
" (b)uffer (d)elete
nnoremap <leader>bd :Bd<cr>
" fast switch buffer
nnoremap <leader><tab> :b#<cr>
" close all buffers except current
command! Bk execute '%bdelete|edit #|normal `"'
" (b)uffer only (k)eep current
nnoremap <leader>bk :Bk<cr>
" }}}


" ==== Organisation ======================================================{{{
" (j)ump to next todo/fixme tag in file
nnoremap <silent> ]o /\C\<\(TODO\\|FIXME\\|XXX\\|OPTIMIZE\\|NOTE\)\><cr>:noh<cr>
" (J)ump to previous todo/fixme tag in file
nnoremap <silent> [o ?\C\<\(TODO\\|FIXME\\|XXX\\|OPTIMIZE\\|NOTE\)\><cr>:noh<cr>
" (o)rganisation generate (t)odo quickfix for current file
nnoremap <leader>ot :vimgrep /\C\<\(TODO\\|FIXME\\|XXX\\|OPTIMIZE\\|NOTE\)\>/g %<cr>:copen<cr>
" (o)rganisation (s)ession (c)reate
nnoremap <leader>osc :mksession ~/.vim/sessions/
" (o)rganisation (s)ession (l)oad
nnoremap <leader>osl :source ~/.vim/sessions/
" (o)rganisation (s)ession (m)anage
nnoremap <leader>osm :e ~/.vim/sessions/<cr>
" }}}


" ==== Preferences ======================================================={{{
" (p)references (v)im
nnoremap <leader>pv :e ~/.config/nvim/<cr>
" }}}


" ==== Misc =============================================================={{{
" Simple pasting from default register
inoremap <c-r> <c-r>"
" Do not store the deleted text in default register when pasting in visual
" mode.
xnoremap <silent> p p:let @"=@0<cr>
" Copy default register contents to system copy clipboard
nnoremap <silent> <leader>yy :call Copy_to_clipboard()<cr>
" change last written word to UPPER_CASE
imap <a-l> <esc>bcruA
" }}}


" ==== Conceal ==========================================================={{{
" conceal (e)nable
nnoremap <buffer> <localleader>e :set conceallevel=2<cr>
" conceal (d)isable
nnoremap <buffer> <localleader>d :set conceallevel=0<cr>
" }}}


" ===========================================================================
" =========================== Visualisation =================================

" ==== Colors ============================================================{{{
if $STY ==# ''
  set termguicolors
endif
set t_Co=256
" }}}


" ==== Theme ============================================================={{{
set background=dark
colorscheme desert
" }}}


" ==== Encodings ========================================================={{{
set encoding=UTF-8
" }}}


" ==== Column Indicators ================================================={{{
set colorcolumn=+1
highlight ColorColumn ctermbg=darkgrey
" }}}


" ==== Whitespace ========================================================{{{
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set list
" }}}


" ==== Indentation ======================================================={{{
set autoindent
set smartindent
set shiftwidth=2
set tabstop=2
set smarttab
set expandtab
" }}}


" ==== Liner Ruler ======================================================={{{
set number
set relativenumber
" toggle relative and absolute numbering based on mode
augroup LineNumberGroup
  autocmd!
  autocmd InsertEnter * :set nornu
  autocmd InsertLeave * :set rnu
augroup END
" }}}


" ==== Conceal ==========================================================={{{
setlocal conceallevel=2
setlocal concealcursor=n
" }}}


" ===========================================================================
" ============================= Searching ===================================

set ignorecase
set incsearch
set smartcase
set hlsearch
set wrapscan



" ===========================================================================
" ============================= Abbreviations ===============================

" todo abbreviations
iabbrev todo TODO(@jakob):
iabbrev fixme FIXME(@jakob):
iabbrev optim OPTIMIZE(@jakob):
iabbrev tnote NOTE(@jakob):
iabbrev xxx XXX(@jakob):

" copyright abbreviations
iabbrev cprg Copyright <company> (c) 2020<cr><cr>Author: Jakob Beckmann <email>
" deepcode
iabbrev cprd Copyright DeepCode (c) 2020<cr><cr>Author: Jakob Beckmann <jakob@deepcode.ai>


" ===========================================================================
" ============================= Scrolling ===================================

" ==== Scroll Offsets ===================================================={{{
set scrolloff=8
set sidescrolloff=5
" }}}


" ==== Allow Folding ====================================================={{{
set foldcolumn=1
set foldenable
set foldlevel=1
set foldlevelstart=1
set foldmethod=indent
" }}}


" ===========================================================================
" ================================ Misc =====================================

" ==== Bracket Matching =================================================={{{
set showmatch
set matchtime=0
" }}}


" ==== Splits ============================================================{{{
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.
" }}}


" ==== Status Line ======================================================={{{
set laststatus=2
" }}}


" ==== Wrapping =========================================================={{{
set nowrap
set formatoptions+=q
set nojoinspaces
" }}}


" ==== Persistency ======================================================={{{
set history=1000
set undofile
" }}}


" ==== Sessions =========================================================={{{
if ! isdirectory(expand('~/.vim/sessions/'))
  call mkdir(expand('~/.vim/sessions/'), 'p')
endif
set sessionoptions-=options    " do not store global and local values in a session
set sessionoptions-=folds      " do not store folds
" }}}


" ==== Wild Menu ========================================================={{{
set wildmenu
set wildmode=list:longest,full
" }}}


" ==== Hidden Files ======================================================{{{
set hidden                   " use hidden files for unsaved buffer switches
set autoread                 " read changed files into buffers if needed
" }}}


" ==== Tags =============================================================={{{
set autochdir
set tags=tags;/              " check every directory up for tags
" }}}


" ===========================================================================
" ================================ Final ====================================

" Syntax enable
filetype plugin indent on
syntax enable

" Security
set secure
