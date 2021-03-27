# Defined in - @ line 1
function rcap --wraps='cat /tmp/capture.out' --description 'alias rcap=cat /tmp/capture.out'
  cat /tmp/capture.out $argv;
end
