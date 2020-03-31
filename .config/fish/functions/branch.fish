# Defined in - @ line 1
function branch --wraps='git branch' --description 'alias branch=git branch'
  git branch $argv;
end
