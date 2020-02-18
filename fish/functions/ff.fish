function ff --description "find file and perform command"
    if count $argv > /dev/null
      set files (sk)
      if [ -n "$files" ]
        eval $argv $files
      end
    else
      echo "Usage: ff <cmd>"
    end
end
