# Defined in - @ line 1
function ttest --wraps='task test' --description 'alias ttest task test'
  task $argv test;
end
