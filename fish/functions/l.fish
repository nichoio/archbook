function l --wraps='ls -lah | awk "{=="";=sprintf("%-5s", ); print }"' --wraps=ls\ -lah\ \|\ awk\ \"\{==\'\'\;=sprintf\(\'\%-5s\',\ \)\;\ print\ \}\"
    if count $argv > /dev/null
        ls -lah --color $argv[1] | awk '{$2=$4="";$5=sprintf("%-5s", $5);$6=sprintf("%-3s", $6); print $0}'
    else
        ls -lah --color | awk '{$2=$4="";$5=sprintf("%-5s", $5);$6=sprintf("%-3s", $6); print $0}'
    end
end
