" ===========================================================================
" ==================== General Bindings Multi-Language ======================
" ===========================================================================


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


" ==== AutoComplete ======================================================{{{
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" see plugin/coc.vim for documentation showing
" }}}


" ==== Refactorings ======================================================{{{
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
" }}}


" ==== Movement =========================================================={{{
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
" Enable camelCase inner word motion with WORD
map <silent> W <Plug>CamelCaseMotion_w
map <silent> B <Plug>CamelCaseMotion_b
map <silent> E <Plug>CamelCaseMotion_e
map <silent> gE <Plug>CamelCaseMotion_ge
sunmap W
sunmap B
sunmap E
sunmap gE
" coc goto overrides
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" }}}


" ==== Text Objects ======================================================{{{
" Create mappings for function text objects
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
" }}}


" ==== Leader ============================================================{{{
" Leader update
let maplocalleader = '\'
nnoremap <Space> <Nop>
let mapleader = "\<Space>"
" }}}


" ==== Quit =============================================================={{{
" (q)uit
nnoremap <leader>qq :qa<cr>
" (q)uit and (s)uspend
nnoremap <leader>qs <c-z>
" hard (Q)uit
nnoremap <leader>qQ :qa!<cr>
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
" (s)earch (d)definition
nnoremap <leader>sd :ALEGoToDefinition<cr>
" (s)earch (r)eferences
nnoremap <leader>sr :ALEFindReferences<cr>
" (s)earch (s)ymbol
nnoremap <leader>ss :ALESymbolSearch
" see plugin/grep-operator.vim (ss)
" }}}


" ==== Errors ============================================================{{{
" (e)rrors (s)how
nnoremap <leader>es :messages<cr>
" (e)rror (n)ext
nnoremap <silent> <leader>en :ALENextWrap<cr>
" (e)rror (N)previous
nnoremap <silent> <leader>eN :ALEPreviousWrap<cr>
" fix everything
nnoremap <leader>== :ALEFix<cr>
" }}}


" ==== System ============================================================{{{
" open (t)erminal
nnoremap <leader>tt :tabnew<cr>:terminal<cr>a
" open (t)erminal on (s)split
nnoremap <leader>ts :split<cr>:terminal<cr>a
" open (t)erminal on (v)ertical split
nnoremap <leader>tv :vsplit<cr>:terminal<cr>a
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


" ==== Tabs =============================================================={{{
" nagivation
nnoremap <leader>t1 1gt
nnoremap <leader>t2 2gt
nnoremap <leader>t3 3gt
nnoremap <leader>t4 4gt
nnoremap <leader>t5 5gt
" (t)ab (n)ew
nnoremap <leader>tn :tabnew<cr>
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
" (o)rganisation (q)uickfix open
nnoremap <leader>oq :copen<cr>
" (o)rganisation (l)ocation list open
nnoremap <leader>ol :lopen<cr>
" (o)rganisation (g)enerate (t)odo location list for current file
nnoremap <leader>ogt :vimgrep /\C\<\(TODO\\|FIXME\\|XXX\\|OPTIMIZE\\|NOTE\)\>/g %<cr>:copen<cr>
" }}}


" ==== Misc =============================================================={{{
" Simple pasting from default register
inoremap <c-r> <c-r>"
" Do not store the deleted text in default register when pasting in visual
" mode.
xnoremap <silent> p p:let @"=@0<cr>
" }}}
