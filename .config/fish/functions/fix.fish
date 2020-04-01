# Defined in - @ line 1
function fix --wraps='task fix' --description 'alias fix task fix'
  task $argv fix;
end
