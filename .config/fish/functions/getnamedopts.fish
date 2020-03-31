# Defined in - @ line 1
function getnamedopts --wraps='echo $argv[2..-1]|grep -ei "^$argv[1] "|sed "s#^$argv[1] ##"' --description 'alias getnamedopts echo $argv[2..-1]|grep -ei "^$argv[1] "|sed "s#^$argv[1] ##"'
  if not string length -q $argv[1]
      echo "No1"
      return 1
  else if not string length -q $argv[2..-1]
      echo "No2"
      return 2
  end
  printf "%s\n" $argv[2..-1]|grep -iE "^$argv[1] "|sed "s#^$argv[1] ##"
end
