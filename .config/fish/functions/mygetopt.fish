# Defined in - @ line 1
function mygetopt --description 'mygetopt default long short pos argv'
  set DEFAULT $argv[1]
  if not set -q argv[5]
      return 
  end
  set LONG    (getnamedopts $argv[2] $argv[5..-1])
  set SHORT   (getnamedopts $argv[3] $argv[5..-1])
  set POS     (getposopts   $argv[4] $argv[5..-1])
  if string length -q $LONG
    printf '%s' $LONG
  else if string length -q $SHORT
    printf '%s' $SHORT
  else if string length -q $POS
    printf '%s' $POS
  else
    printf '%s' $DEFAULT
  end
end
