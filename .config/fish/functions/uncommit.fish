# Defined in - @ line 1
function uncommit --wraps='git reset --soft HEAD^' --description 'alias uncommit git reset --soft HEAD^'
  git reset --soft HEAD^ $argv;
end
