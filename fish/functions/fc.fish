function fc --description "find content and perform command on file"
    if count $argv > /dev/null
      set output (ska)
      if [ -n "$output" ]
        set files (echo $output | cut -d: -f1)
        eval $argv $files
      end
    else
      echo "Usage: fc <cmd>"
    end
end
