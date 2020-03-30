# Defined in - @ line 1
function parent --wraps='checkout (pwbd|head -4|tail -1)' --description 'alias parent checkout (pwbd|head -4|tail -1)'
  checkout (pwbd|head -4|tail -1)
end
