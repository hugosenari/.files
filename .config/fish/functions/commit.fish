# Defined in - @ line 1
function commit --wraps=git\ commit\ -m --description 'alias commit git commit -m'
  set ISSUE   (pwbd|head -1|tail -1)
  set TYPE    (pwbd|head -2|tail -1)
  set SCOPE   (pwbd|head -3|tail -1)
  set PARENT  (pwbd|head -4|tail -1)
  set SUBJECT (pwbd|head -5|tail -1)
  if string length -q $argv[1]
    set SUBJECT $argv[1]
  end
  set DESCR   (pwbd|tail -n +6)
  set MESSAGE "$TYPE"(string length -q -- $SCOPE; and echo '('$SCOPE'): #'; or echo ': #')"$ISSUE $SUBJECT

$DESCR"
  git commit -m "$MESSAGE" $argv[2..-1];
end
