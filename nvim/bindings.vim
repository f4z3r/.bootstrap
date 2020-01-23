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
" fold fast
nnoremap <c-d> zA
" unmap s in normal mode
nmap s <nop>
" Split downwards
nmap sj :SplitjoinSplit<cr>
" Join upwards
nmap sk :SplitjoinJoin<cr>
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
" }}}


" ==== Leader ============================================================{{{
" Leader update
let maplocalleader = '\'
nnoremap <Space> <Nop>
let mapleader = "\<Space>"
" }}}


" ==== Quit =============================================================={{{
" (q)uit
nnoremap <leader>qq :qa<enter>
" (q)uit and (s)ave
nnoremap <leader>qs :wqa<enter>
" hard (Q)uit
nnoremap <leader>qQ :qa!<enter>
" }}}


" ==== Search ============================================================{{{
" (s)earch (c)lear (highlighting)
nnoremap <leader>sc :noh<enter>
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
" (s)earch (d)definition
nnoremap <leader>sd :ALEGoToDefinition<enter>
" (s)earch (r)eferences
nnoremap <leader>sr :ALEFindReferences<enter>
" (s)earch (s)ymbol
nnoremap <leader>ss :ALESymbolSearch 
" }}}


" ==== Errors ============================================================{{{
" (e)rrors (s)how
nnoremap <leader>es :messages<enter>
" (e)rror (n)ext
nnoremap <silent> <leader>en :ALENextWrap<enter>
" (e)rror (N)previous
nnoremap <silent> <leader>eN :ALEPreviousWrap<enter>
" fix everything
nnoremap <leader>== :ALEFix<enter>
" }}}


" ==== System ============================================================{{{
" open (t)erminal
nnoremap <leader>tt :tabnew<enter>:terminal<enter>a
" open (t)erminal on (s)split
nnoremap <leader>ts :split<enter>:terminal<enter>a
" open (t)erminal on (v)ertical split
nnoremap <leader>tv :vsplit<enter>:terminal<enter>a
" }}}


" ==== Toggles ==========================================================={{{
" (t)oggle colorcolumn (l)ine 
nnoremap <leader>tl :set colorcolumn=100<enter>
" (t)oggle (g)olden ratio
nnoremap <leader>tg :GoldenRatioToggle<enter>
" (t)oggle (u)ndo tree
nnoremap <leader>tu :GundoToggle<enter>
" }}}


" ==== Git ==============================================================={{{
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
" (g)it (d)iff 
nnoremap <leader>gd :Gdiffsplit<enter>
" }}}


" ==== Files ============================================================={{{
" (f)ile (s)ave
nnoremap <leader>fs :update<enter>
" (f)ile (n)ew (in buffer's dir)
nnoremap <leader>fn :e %:p:h/
" (f)ile (N)ew in project root
nnoremap <leader>fN :e 
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
" }}}


" ==== Tabs =============================================================={{{
" nagivation
nnoremap <leader>t1 1gt
nnoremap <leader>t2 2gt
nnoremap <leader>t3 3gt
nnoremap <leader>t4 4gt
nnoremap <leader>t5 5gt
" (t)ab (n)ew
nnoremap <leader>tn :tabnew<enter>
" }}}


" ==== Windows ==========================================================={{{
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
" }}}


" ==== Buffer ============================================================{{{
" close buffer without closing window command
command! Bd :bp | :sp | :bn | :bd
" (b)uffer (d)elete
nnoremap <leader>bd :Bd<enter>
" fast switch buffer
nnoremap <leader><tab> :b#<enter>
" (b)uffer fuzzy search
nnoremap <leader>bb :Buffers<enter>
" }}}


" ==== Organisation ======================================================{{{
" Start (p)omodoro with name auto
nnoremap <leader>op :PomodoroStart auto<enter>
" Open project level to(d)o file
nnoremap <leader>od :e todo.txt<enter>
" Open (g)lobal todo file
nnoremap <leader>og :e ~/todo.txt<enter>
" (j)ump to next todo/fixme tag in file
nnoremap <silent> <leader>oj /\<\(TODO\\|FIXME\\|XXX\\|OPTIMIZE\\|NOTE\)\><enter>:noh<enter>
" (J)ump to previous todo/fixme tag in file
nnoremap <silent> <leader>oJ ?\<\(TODO\\|FIXME\\|XXX\\|OPTIMIZE\\|NOTE\)\><enter>:noh<enter>
" }}}


" ==== Misc =============================================================={{{
" Simple pasting from default register
inoremap <c-r> <c-r>"
" }}}
