# Defined in - @ line 1
function feat --wraps='task feat' --description 'alias feat task feat'
  task $argv feat;
end
