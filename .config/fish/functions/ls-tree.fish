# Defined in - @ line 1
function ls-tree --wraps='git ls-tree (pwb)' --description 'alias ls-tree git ls-tree (pwb)'
  git ls-tree (pwb) $argv;
end
