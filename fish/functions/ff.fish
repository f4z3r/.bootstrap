function ff --description "find file and perform command"
    set files (sk)
    if [ -n "$files" ]
      $argv $files
    end
end
