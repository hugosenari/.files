# Defined in - @ line 1
function issue --description 'issue [--type|-t type] [--scope|-e scope] [--parent|-p parent] [--id|-i id] [[--subject subject|-s subject] subject]'
  set ISSUE  (pwbd|head -1|tail -1)
  set TYPE   (pwbd|head -2|tail -1)
  set SCOPE  (pwbd|head -3|tail -1)
  set MY_OPTS (getopts $argv)
  set ISSUE   (mygetopt "$ISSUE" id      i 1 $MY_OPTS)
  set SUBJECT (mygetopt ""       subject s 2 $MY_OPTS)
  set TYPE    (mygetopt "$TYPE"  type    t 0 $MY_OPTS)
  set SCOPE   (mygetopt "$SCOPE" scope   e 0 $MY_OPTS)
  set PARENT  (mygetopt (pwb)    parent  p 0 $MY_OPTS)
  set BRANCH_DESC $ISSUE\n$TYPE\n$SCOPE\n$PARENT\n$SUBJECT
  git checkout -b $ISSUE
  git config branch.$ISSUE.description $BRANCH_DESC
  git push -u origin $ISSUE
end
