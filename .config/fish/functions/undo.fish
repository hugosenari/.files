# Defined in - @ line 1
function undo --wraps='git reset --hard' --description 'alias undo git reset --hard'
  git reset --hard $argv;
end
