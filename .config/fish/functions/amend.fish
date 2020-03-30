# Defined in - @ line 1
function amend --wraps='git commit --amend' --description 'alias amend git commit --amend'
  git commit --amend $argv;
end
