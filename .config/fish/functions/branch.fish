# Defined in - @ line 1
function branch --wraps='git branch' --wraps='git rev-parse --abbrev-ref HEAD' --description 'alias branch=git branch'
  git branch $argv;
end
