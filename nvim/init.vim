" ===========================================================================
" ================================= Dein ====================================
" ===========================================================================
if &compatible
  set nocompatible
endif

" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" ==== Plugin Installs ==================================================={{{
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

" ================= Plugins =================
  " splash screen
  call dein#add('mhinz/vim-startify')

  " auto completion
  call dein#add('neoclide/coc.nvim',
        \{'merged': 0, 'rev': 'release'})

  " nice icon set for tabs and status line
  call dein#add('ryanoasis/vim-devicons')

  " asynchronous linting (and fixing) engine
  call dein#add('w0rp/ale')

  " netrw in buffer nagivation
  call dein#add('tpope/vim-vinegar')

  " nice theme (not original for true haskell support)
  call dein#add('dkasak/gruvbox')

  " comment things
  call dein#add('preservim/nerdcommenter')

  " git support
  call dein#add('tpope/vim-fugitive')

  " fuzzy search everything
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
        \]})

  " provide nice surround commands
  call dein#add('tpope/vim-surround')

  " show indent guide
  call dein#add('Yggdroot/indentLine')

  " taskwarrior (allow lazy loading but place airline extension into autoload)
  call dein#add('blindfs/vim-taskwarrior',
        \{'on_cmd': ['TW', 'TWSync']})

  " required for markdown table formatting
  call dein#add('godlygeek/tabular',
        \{'on_cmd': 'TableFormat'})

  " support TOC generation for markdown
  call dein#add('mzlogin/vim-markdown-toc',
        \{'on_ft': 'markdown'})

  " language support (should be lazy by default)
  call dein#add('sheerun/vim-polyglot')

  " better OCaml support for indenting
  call dein#add('OCamlPro/ocp-indent',
        \{'on_ft': 'ocaml'})

  " polyglot does not come with proper julia syntax highlightling
  call dein#add('JuliaEditorSupport/julia-vim',
        \{'on_ft': 'julia'})

  " polyglot does not come with a java syntax highlightling
  call dein#add('uiiaoo/java-syntax.vim',
        \{'on_ft': 'java'})

  call dein#add('neoclide/jsonc.vim',
        \{'on_ft': 'json'})

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

  " undo tree
  call dein#add('sjl/gundo.vim',
        \{'on_cmd': 'GundoToggle'})

  " tag file generation
  call dein#add('ludovicchabant/vim-gutentags')

  " tag tree
  call dein#add('majutsushi/tagbar',
        \{'on_cmd': 'TagbarToggle'})

  " split and join multi line statements
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

  " switch from header to implementation and vice-versa
  call dein#add('jakobbeckmann/a.vim',
        \{'on_ft': ['c', 'cpp']})

  " enable project local vimrcs (.lvimrc)
  call dein#add('embear/vim-localvimrc')

  " change case using single keystroke
  call dein#add('tpope/vim-abolish')

  " add closing ends upon opening
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

  " provide nice status line
  call dein#add('bling/vim-airline')

  " move through camel or snake case
  call dein#add('bkad/camelcasemotion')

  " pomodoro
  call dein#add('rmolin88/pomodoro.vim')

  " enable colorscheme overrides
  call dein#add('vim-scripts/AfterColors.vim')

  " fix indentation on paste
  call dein#add('conradirwin/vim-bracketed-paste')

  " thesaurus lookup
  call dein#add('ron89/thesaurus_query.vim',
        \{'on_cmd': ['ThesaurusQueryReplaceCurrentWord',
        \            'ThesaurusQueryReplace',
        \            'Thesaurus']})

  " unicode search
  call dein#add('chrisbra/unicode.vim',
        \{'on_cmd': ['Digraphs',
        \            'UnicodeSearch',
        \            'UnicodeName',
        \            'UnicodeTable',
        \            'DownloadUnicode']})
  
  call dein#end()
  call dein#save_state()
endif
" }}}

" Syntax enable
filetype plugin indent on
syntax enable

" Load General bindings
source <sfile>:h/bindings.vim

" Load Scroll config
source <sfile>:h/scrolling.vim

" Load visualisation
source <sfile>:h/visualisation.vim

" Load searching
source <sfile>:h/searching.vim

" Load misceleneous
source <sfile>:h/misc.vim

" Load abbreviation
source <sfile>:h/abbrev.vim

" Security
set secure
