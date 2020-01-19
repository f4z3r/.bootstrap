function ska --description "search in directory using `ag`"
    sk --ansi -i -c 'ag "{}"' $argv
end
