# Defined in - @ line 1
function perf --wraps='task perf' --description 'alias perf task perf'
  task $argv perf;
end
