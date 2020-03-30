# Defined in - @ line 1
function pwb --wraps='git rev-parse --abbrev-ref HEAD' --description 'alias pwb=git rev-parse --abbrev-ref HEAD'
  git rev-parse --abbrev-ref HEAD $argv;
end
