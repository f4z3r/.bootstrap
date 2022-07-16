" ===========================================================================
" ============================== Projectionist ==============================
" ===========================================================================


let g:projectionist_heuristics = {
      \   '*.py': {
      \       'src/*.py': {
      \            'alternate': 'test/test_{}.py',
      \            'dispatch': 'pipenv run pytest test/test_{}.py',
      \         },
      \       'test/test_*.py': {
      \            'alternate': 'src/{}.py',
      \            'dispatch': 'pipenv run pytest {file}',
      \         },
      \       },
      \   '*.go': {
      \       '*.go': {
      \            'alternate': '{}_test.go',
      \            'dispatch': 'go test -v ./...',
      \         },
      \       '*_test.go': {
      \            'alternate': '{}.go',
      \            'dispatch': 'go test -v ./...',
      \         },
      \       },
      \   '*.c|*.h': {
      \       '*.c': {
      \            'alternate': '{}.h',
      \         },
      \       '*.h': {
      \            'alternate': '{}.c',
      \         },
      \       },
      \   '*.cpp|*.hpp': {
      \       '*.cpp': {
      \            'alternate': '{}.hpp',
      \         },
      \       '*.hpp': {
      \            'alternate': '{}.cpp',
      \         },
      \       }
      \     }

