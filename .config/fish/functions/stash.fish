# Defined in - @ line 1
function stash --wraps='git stash' --description 'alias stash git stash'
  git stash $argv;
end
