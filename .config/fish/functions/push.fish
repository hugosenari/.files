# Defined in - @ line 1
function push --wraps='git push' --description 'alias push git push'
  git push $argv;
end
