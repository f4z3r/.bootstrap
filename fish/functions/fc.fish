function fc --description "find content and perform command on file"
    set output (ska)
    if [ -n "$output" ]
      set files (echo $output | cut -d: -f1)
      eval $argv $files
    end
end
