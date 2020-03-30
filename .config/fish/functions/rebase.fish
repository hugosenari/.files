# Defined in - @ line 1
function rebase --wraps='git rebase' --description 'alias rebase git rebase'
  git rebase $argv;
end
