# Defined in - @ line 1
function task --description 'alias task issue'
  set YD_DM (date +%j)(echo (date +%H)'*'(date +%M)|bc)(date +%S)
  set ISSUE  (pwbd|head -1|tail -1)
  set TYPE   (pwbd|head -2|tail -1)
  set SCOPE  (pwbd|head -3|tail -1)
  set DESC   (pwbd|tail -n +5)
  set MY_OPTS (getopts $argv)
  set TYPE    (mygetopt  "$TYPE"          type     t  1  $MY_OPTS)
  set SUBJECT (mygetopt  ""               subject  s  2  $MY_OPTS)
  set SCOPE   (mygetopt  "$SCOPE"         scope    e  0  $MY_OPTS)
  set ISSUE   (mygetopt  $ISSUE'_'$YD_DM  id       i  0  $MY_OPTS)
  set PARENT  (mygetopt  (pwb)            parent   p  0  $MY_OPTS)
  set BRANCH_DESC "$ISSUE"\n"$TYPE"\n"$SCOPE"\n"$PARENT"\n"$SUBJECT"\n\n"$DESC"
  git checkout -b $ISSUE
  git config branch.$ISSUE.description $BRANCH_DESC
end
