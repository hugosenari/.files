# Defined in - @ line 1
function merge --wraps='git merge' --description 'alias merge git merge'
  git merge $argv;
end
