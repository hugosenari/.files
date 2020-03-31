# Defined in - @ line 1
function getposopts --wraps='echo $argv[2..-1]|grep -e "^_ "|sed "s/^_ //"|head -$argv[1]|tail -1' --description 'alias getposopts echo $argv[2..-1]|grep -e "^_ "|sed "s/^_ //"|head -$argv[1]|tail -1'
  if not string length -q $argv[1]
      return 1
  else if not string length -q $argv[2..-1]
      return 2
  end
  printf "%s\n" $argv[2..-1]|grep -e "^_ "|sed "s/^_ //"|head -$argv[1]|tail -1;
end
