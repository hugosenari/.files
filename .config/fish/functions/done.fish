# Defined in - @ line 1
function done --wraps='parent; git merge task' --description 'alias done "parent; git merge task"'
  set CURRENT (pwb)
  parent
  git merge $CURRENT;
  branch-clear
end
