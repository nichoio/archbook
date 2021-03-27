# Defined in - @ line 1
function ls --wraps='ls -lah' --wraps='ls lah' --wraps='ls --color' --description 'alias ls=ls --color'
 command ls --color $argv;
end
