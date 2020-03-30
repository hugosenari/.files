# Defined in - @ line 1
function fetch --wraps='git fetch --all --tag' --description 'alias fetch git fetch --all --tag'
  git fetch --all --tag $argv;
end
