function bootstrap#system#copy_to_clipboard()
  let @+=@"
  echom 'Vim default register (>' . @" . '<) copied to system clipbard.'
endfunction

function bootstrap#system#get_tmp_file()
  let name = '/tmp/vim_tmp_' . localtime()
  return name
endfunction


function bootstrap#system#get_project_root()
  return fnamemodify(finddir('.git', '.;'), ':h')
endfunction

function bootstrap#system#toggle_background()
  if &background ==# 'dark'
    execute 'set background=light' 
  else
    execute 'set background=dark'
  endif
  execute ':AirlineTheme gruvbox_material'
endfunction
