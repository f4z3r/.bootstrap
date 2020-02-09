" ===========================================================================
" ==================== General Bindings Multi-Language ======================
" ===========================================================================

" ==== Leader ============================================================{{{
" Leader update
let maplocalleader = '\'
nnoremap <Space> <Nop>
let mapleader = "\<Space>"
" }}}


" ==== ESC remaps ========================================================{{{
" <Esc> remaps
nnoremap fd <Esc>
inoremap fd <Esc>
vnoremap fd <Esc>
cnoremap fd <Esc>
" }}}


" ==== Folding ==========================================================={{{
" reduce foldlevel
nnoremap <c-s> za
" increase foldlevel
nnoremap <c-d> zA
" unmap s in normal mode
nmap s <nop>
" Split downwards
nmap sj :SplitjoinSplit<cr>
" Join upwards
nmap sk :SplitjoinJoin<cr>
" }}}


" ==== Refactoring ======================================================={{{
" (r)efactor (r)ename
nmap <leader>rr <Plug>(coc-rename)
" (r)efactor (f)ix
nnoremap <leader>rf :ALEFix<cr>
" (r)efactor (s)uggest fixes
nnoremap <leader>rs :ALEFixSuggest<cr>
" (r)efactor (l)int
nnoremap <leader>rl :ALELint<cr>
" (r)efactor (c)oc (d)isable
nnoremap <leader>rcd :CocDisable<cr>
" (r)efactor (c)oc (e)nable
nnoremap <leader>rce :CocEnable<cr>
" (r)efactor (a)le (d)isable
nnoremap <leader>rad :ALEDisable<cr>
" (r)efactor (a)le (e)nable
nnoremap <leader>rae :ALEEnable<cr>
" coc goto overrides
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" }}}


" ==== Quickfix =========================================================={{{
" (q)uickfix (n)ext
nnoremap <leader>qn :cnext<cr>
" (q)uickfix (p)revious
nnoremap <leader>qp :cprevious<cr>
" (q)uickfix (o)pen
nnoremap <leader>qo :copen<cr>
" (q)uickfix (c)lose
nnoremap <leader>qc :cclose<cr>
" }}}


" ==== Locations ========================================================={{{
" (l)ocation list (n)ext
nnoremap <leader>ln :lnext<cr>
" (l)ocation list (o)pen
nnoremap <leader>lp :lprevious<cr>
" (l)ocation list (o)open
nnoremap <leader>lo :lopen<cr>
" (l)ocation list (c)lose
nnoremap <leader>lc :lclose<cr>
" }}}


" ==== AutoComplete ======================================================{{{
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" see plugin/coc.vim for documentation showing
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <c-j> <Plug>(coc-snippets-expand-jump)
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
" Enable camelCase inner word motion with WORD
map <silent> W <Plug>CamelCaseMotion_w
map <silent> B <Plug>CamelCaseMotion_b
map <silent> E <Plug>CamelCaseMotion_e
map <silent> gE <Plug>CamelCaseMotion_ge
sunmap W
sunmap B
sunmap E
sunmap gE
" }}}


" ==== Text Objects ======================================================{{{
" Create mappings for function text objects
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
" }}}


" ==== Search ============================================================{{{
" (s)earch (c)lear (highlighting)
nnoremap <leader>sc :noh<cr>
" (s)earch (g)it commit
nnoremap <leader>sg :Commits<cr>
" (s)earch (C)ommand
nnoremap <leader>sC :Commands<cr>
" (s)earch using (a)g (silver searcher)
nnoremap <leader>sa :Ag<cr>
" (s)earch (k)eymapping
nnoremap <leader>sk :Maps<cr>
" (s)earch (s)earch history
nnoremap <leader>sS :History /<cr>
" (s)earch command (h)istory
nnoremap <leader>sh :History :<cr>
" (s)earch (l)ines
nnoremap <leader>sl :BLines<cr>
" (s)earch all (L)ines (across all buffers)
nnoremap <leader>sL :Lines<cr>
" see plugin/grep-operator.vim (ss)
" }}}


" ==== Machine (System) =================================================={{{
" (m)achine open terminal in (t)ab
nnoremap <leader>mt :$tabnew<cr>:terminal<cr>a
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
" }}}


" ==== Toggles ==========================================================={{{
" (t)oggle colorcolumn (L)ine
nnoremap <leader>tL :set colorcolumn=100<cr>
" (t)oggle (g)olden ratio
nnoremap <leader>tg :GoldenRatioToggle<cr>
" (t)oggle (u)ndo tree
nnoremap <leader>tu :GundoToggle<cr>
" }}}


" ==== Git ==============================================================={{{
" (g)it (s)tatus
nnoremap <leader>gs :Gstatus<cr>
" (g)it (p)tatus
nnoremap <leader>gp :Gpush<cr>
" (g)it (f)etch
nnoremap <leader>gf :Gfetch<cr>
" (g)it pul(l)
nnoremap <leader>gl :Gpull<cr>
" (g)it (c)ommit
nnoremap <leader>gc :Gcommit<cr>a
" (g)it (a)dd
nnoremap <leader>ga :Gwrite<cr>
" (g)it (A)mend
nnoremap <leader>gA :Git commit --amend<cr>
" (g)it (m)ove
nnoremap <leader>gm :Gmove
" (g)it (b)lame
nnoremap <leader>gb :Gblame<cr>
" (g)it (d)iff
nnoremap <leader>gd :Gdiffsplit<cr>
" }}}


" ==== Files ============================================================={{{
" (f)ile (s)ave
nnoremap <leader>fs :update<cr>
" (f)ile (n)ew (in buffer's dir)
nnoremap <leader>fn :e %:p:h/
" (f)ile (N)ew in project root
nnoremap <leader>fN :e
" control-p link
nnoremap <c-p> :GFiles<cr>
" (f)iles in (p)roject
nnoremap <leader>fp :Files<cr>
" (f)iles in git files in (P)roject
nnoremap <leader>fP :GFiles<cr>
" (f)iles in (c)urrent working directory (not same as project)
nnoremap <leader>fc :Files<cr>
" (f)ind (f)ile (in buffer's dir)
nnoremap <leader>ff :Files %:p:h<cr>
" (f)iles in (h)ome
nnoremap <leader>fh :Files ~/<cr>
" (f)ile (r)efresh
nnoremap <leader>fr :checktime %<cr>
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
" (w)indow focus h
nnoremap <leader>wh <c-w>hzH
" (w)indow focus j
nnoremap <leader>wj <c-w>jzH
" (w)indow focus k
nnoremap <leader>wk <c-w>kzH
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
" (b)uffer fuzzy search
nnoremap <leader>bb :Buffers<cr>
" }}}


" ==== Organisation ======================================================{{{
" (o)rganisation task(w)arrior
nnoremap <leader>ow :TW<cr>
" (o)rganisation (s)ummary
nnoremap <leader>os :TW summary<cr>
" Start (p)omodoro with name auto
nnoremap <leader>op :PomodoroStart auto<cr>
" (j)ump to next todo/fixme tag in file
nnoremap <silent> <leader>oj /\C\<\(TODO\\|FIXME\\|XXX\\|OPTIMIZE\\|NOTE\)\><cr>:noh<cr>
" (J)ump to previous todo/fixme tag in file
nnoremap <silent> <leader>oJ ?\C\<\(TODO\\|FIXME\\|XXX\\|OPTIMIZE\\|NOTE\)\><cr>:noh<cr>
" (o)rganisation generate (t)odo quickfix for current file
nnoremap <leader>ot :vimgrep /\C\<\(TODO\\|FIXME\\|XXX\\|OPTIMIZE\\|NOTE\)\>/g %<cr>:copen<cr>
" }}}


" ==== Misc =============================================================={{{
" Simple pasting from default register
inoremap <c-r> <c-r>"
" Do not store the deleted text in default register when pasting in visual
" mode.
xnoremap <silent> p p:let @"=@0<cr>
" }}}
