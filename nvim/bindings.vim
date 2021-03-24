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
nnoremap fd <esc>
inoremap fd <esc>
vnoremap fd <esc>
cnoremap fd <esc>
tnoremap <esc> <c-\><c-N>
" }}}


" ==== Folding ==========================================================={{{
" reduce foldlevel
nnoremap [f zM
" increase foldlevel local
nnoremap <c-d> zA
" increase foldlevel
nnoremap ]f zR
" unmap s in normal mode
nmap s <nop>
" Split downwards
nmap sj :SplitjoinSplit<cr>
" Join upwards
nmap sk :SplitjoinJoin<cr>
" }}}


" ==== Insert ============================================================{{{
" (i)nsert (s)ynonym
nnoremap <leader>is :ThesaurusQueryReplaceCurrentWord<cr>
vnoremap <leader>is y:ThesaurusQueryReplace <c-r>"<cr>
" (i)nsert (u)nicode
nnoremap <leader>iu :UnicodeSearch! 
" (i)nsert (d)igraph
nnoremap <leader>id :Digraphs 
" }}}


" ==== Vimux ============================================================={{{
" (v)imux (p)rompt
nnoremap <leader>vp :VimuxPromptCommand<cr>
" (v)imux (l)ast
nnoremap <leader>vl :VimuxRunLastCommand<cr>
" (v)imux (q)uit
nnoremap <leader>vq :VimuxCloseRunner<cr>
" (v)imux interrupt
nnoremap <leader>vx :VimuxInterrruptRunner<cr>
" (v)imux (i)nspect
nnoremap <leader>vi :VimuxInspectRunner<cr>
" (v)imux (z)oom
nnoremap <leader>vz :call VimuxZoomRunner()<cr>
" }}}


" ==== Refactoring ======================================================={{{
" (r)efactor (s)earch error
nnoremap <leader>rs :CocList diagnostics<cr>
" (r)efactor (r)ename
nmap <leader>rr <Plug>(coc-rename)
" refactor (n)ext error
nmap ]e <plug>(ale_next_wrap_error)
" refactor (p)revious error
nmap [e <plug>(ale_previous_wrap_error)
" refactor (w)arnings (n)ext
nmap ]w <plug>(ale_next_wrap_warning)
" refactor (w)arnings (p)revious
nmap [w <plug>(ale_previous_wrap_warning)
" (r)efactor (f)ix
nnoremap <leader>rf :ALEFix<cr>
" (r)efactor (S)uggest fixes
nnoremap <leader>rS :ALEFixSuggest<cr>
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
" Scrolling by visual line
nnoremap <a-j> gj
nnoremap <a-k> gk
vnoremap <a-j> gj
vnoremap <a-k> gk
nnoremap <a-h> g0
nnoremap <a-l> g$
vnoremap <a-h> g0
vnoremap <a-l> g$
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

" Easy movement in insert mode
" delete word and char already default <c-w> and <c-h> respectively
" <c-a> pastes default register
" move to end of line
inoremap <c-e> <c-o>A
" move to beginning of line
inoremap <c-b> <c-o>I
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
" (s)earch (t)ags
nnoremap <leader>st :Tags<cr>
" (s)earch local (t)ags
nnoremap <leader>sT :BTags<cr>
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
" search for visual selection using //
vnoremap // y/\V<c-r>=escape(@",'/\')<cr><cr>
" (s)earch (n)otes
nnoremap <leader>sn :Pad search<cr>
" make all searches appear in the middle of the screen
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
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
nnoremap <leader>mu :execute 'tcd' . bootstrap#system#get_project_root()<cr>
" }}}


" ==== Toggles ==========================================================={{{
" (t)oggle (t)agbar
nnoremap <leader>tt :TagbarToggle<cr>
" (t)oggle colorcolumn (l)ine
nnoremap <leader>tl :set colorcolumn=100<cr>
" (t)oggle (g)olden ratio
nnoremap <leader>tg :GoldenRatioToggle<cr>
" (t)oggle (u)ndo tree
nnoremap <leader>tu :GundoToggle<cr>
" (t)oggle (b)ackground
nnoremap <leader>tb :call bootstrap#system#toggle_background()<cr>
" (t)oggle (s)yntax
nnoremap <expr> <leader>ts exists('g:syntax_on') ? ':syntax off<cr>' : ':syntax enable<cr>'
" (t)oggle (w)rap
nnoremap <leader>tw :call bootstrap#system#toggle_wrap()<cr>
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
" (f)iles (a)ll
nnoremap <leader>fa :Files /<cr>
" (f)ile (r)efresh
nnoremap <leader>fr :checktime %<cr>
" (f)ile new (t)emp
nnoremap <leader>ft :execute "e " . bootstrap#system#get_tmp_file()<cr>
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
" (w)indow = equalize
nnoremap <leader>w= <c-w>=
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
" (b)uffer (s)elect
nnoremap <leader>bs ggVG
" (b)uffer (y)ank
nnoremap <leader>by ggVGy
" close buffer without closing window command
command! Bd :bp | :sp | :bn | :bd
" (b)uffer (d)elete
nnoremap <leader>bd :Bd<cr>
" fast switch buffer
nnoremap <leader><tab> :b#<cr>
" (b)uffer fuzzy search
nnoremap <leader>bb :Buffers<cr>
" close all buffers except current
command! Bk execute '%bdelete|edit #|normal `"'
" (b)uffer only (k)eep current
nnoremap <leader>bk :Bk<cr>
" Navigate to buffer count within tab
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap [t <Plug>AirlineSelectPrevTab
nmap ]t <Plug>AirlineSelectNextTab
" }}}


" ==== Organisation ======================================================{{{
" (o)rganisation task(w)arrior
nnoremap <leader>ow :TW<cr>
" (o)rganisation (r)eport (s)ummary
nnoremap <leader>ors :TW summary<cr>
" (o)rganisation (r)eport (t)oday
nnoremap <leader>ort :TW today<cr>
" (o)rganisation (r)eport (a)ge
nnoremap <leader>ora :TW age<cr>
" (o)rganisation (r)eport (h)igh
nnoremap <leader>orh :TW high<cr>
" (o)rganisation (r)eport (d)ue/schedule
nnoremap <leader>ord :TW sch<cr>
" (o)rganisation (S)ync
nnoremap <leader>oS :TWSync<cr>
" Start (p)omodoro with name auto
nnoremap <leader>op :PomodoroStart auto<cr>
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
" (o)rganisation (s)ession (m)anage
nnoremap <leader>osm :e ~/.vim/sessions/<cr>
" }}}


" ==== Notes ============================================================={{{
" (n)otes (s)earch
nnoremap <leader>ns :Pad search<cr>
" (n)otes (l)ist
nnoremap <leader>nl :Pad ls<cr>
" (n)otes (n)ew
nnoremap <leader>nn :Pad new<cr>
" (n)otes (f)ile (local)
nnoremap <leader>nf :Pad! this<cr>
" }}}


" ==== Preferences ======================================================={{{
" (p)references (v)im
nnoremap <leader>pv :e ~/.config/nvim/<cr>
" (p)references (s)nippets (for current filetype)
nnoremap <leader>ps :CocCommand snippets.editSnippets<cr>
" }}}


" ==== Misc =============================================================={{{
" Simple pasting from default register
inoremap <c-r> <c-r>"
" Do not store the deleted text in default register when pasting in visual
" mode.
xnoremap <silent> p p:let @"=@0<cr>
" Copy default register contents to system copy clipboard
nnoremap <silent> <leader>yy :call bootstrap#system#copy_to_clipboard()<cr>
" change last written word to UPPER_CASE
inoremap <a-l> <esc>bviwUea
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}
