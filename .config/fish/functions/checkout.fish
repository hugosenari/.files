# Defined in - @ line 1
function checkout --wraps='git checkout' --description 'alias checkout git checkout'
  git checkout $argv;
end
