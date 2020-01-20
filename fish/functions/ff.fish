function ff --description "find file and perform command"
    set files (sk)
    if [ -n "$files" ]
      eval $argv $files
    end
end
