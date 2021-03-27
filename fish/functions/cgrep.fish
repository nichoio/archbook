# Defined in - @ line 1
function cgrep --wraps='grep -i -C 3 --color' --description 'alias cgrep=grep -i -C 3 --color'
  grep -i -C 3 --color $argv;
end
