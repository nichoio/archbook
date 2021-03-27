function fgrep --wraps=grep
    find . -iname "*$argv*" 2>/dev/null | command grep -i --color $argv
end
