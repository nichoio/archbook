function diffl --description 'alias diff for line n...n1 for single or 2 files'
    set tail1 (math 1 + $argv[2] - $argv[1])
    set tail2 (math 1 + $argv[4] - $argv[3])

    if test (count $argv) -eq 5
        diff --color (head -n $argv[2] $argv[5] | tail -n $tail1 | psub) (head -n $argv[4] $argv[5] | tail -n $tail2 | psub)
    else if test (count $argv) -eq 6
        diff --color (head -n $argv[2] $argv[5] | tail -n $tail1 | psub) (head -n $argv[4] $argv[6] | tail -n $tail2 | psub)
    else
        echo "Invalid arguments. Provide args such as \"diffl 5 10 10 20 ~/foo.txt [~/bar.txt]\". "
    end
end
