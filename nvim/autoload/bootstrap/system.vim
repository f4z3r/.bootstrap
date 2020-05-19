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

