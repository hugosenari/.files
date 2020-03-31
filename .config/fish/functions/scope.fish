# Defined in - @ line 1
function scope --wraps=pwd\ \|sed\ \'s\#\'\(git\ rev-parse\ --show-toplevel\)\'/\#\#\' --description alias\ scope\ pwd\|sed\ \'s\#\'\(git\ rev-parse\ --show-toplevel\)\'/\#\#\'
  pwd |sed 's#'(git rev-parse --show-toplevel)'##'
end
