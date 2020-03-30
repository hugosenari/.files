# Defined in - @ line 1
function pull --wraps='git pull' --description 'alias pull git pull'
  git pull $argv;
end
