# Defined in - @ line 1
function issue --wraps='git checkout -b $argv[1]; git config branch.$argv[1].description $argv[2]; git push -u origin $argv[1]' --description 'alias issue=git checkout -b $argv[1]; git config branch.$argv[1].description $argv[2]; git push -u origin $argv[1]'
  set ISSUE  (pwbd|head -1|tail -1)
  set TYPE   (pwbd|head -2|tail -1)
  set SCOPE  (pwbd|head -3|tail -1)
  set PARENT (pwbd|head -4|tail -1)
  set ISSUE   (string length -q -- $argv[1]; and echo $argv[1]; or echo $ISSUE)
  set SUBJECT (string length -q -- $argv[2]; and echo $argv[2]; or echo $SUBJECT)
  set TYPE    (string length -q -- $argv[3]; and echo $argv[3]; or echo $TYPE)
  set SCOPE   (string length -q -- $argv[4]; and echo $argv[4]; or echo $SCOPE)
  set PARENT  (string length -q -- $argv[5]; and echo $argv[5]; or echo (pwb))
  set BRANCH_DESC $ISSUE\n$TYPE\n$SCOPE\n$PARENT\n$SUBJECT
  git checkout -b $ISSUE
  git config branch.$ISSUE.description $BRANCH_DESC
  git push -u origin $ISSUE
end
