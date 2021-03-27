# Defined in - @ line 1
function grep --wraps='grep -in --color' --description 'alias grep=grep -i --color'
 command grep -in --color $argv;
end
