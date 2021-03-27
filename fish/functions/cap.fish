# Defined in - @ line 1
function cap --wraps='tee /tmp/capture.out' --description 'alias cap=tee /tmp/capture.out'
  tee /tmp/capture.out $argv;
end
