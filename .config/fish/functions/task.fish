# Defined in - @ line 1
function task --description 'alias task issue'
  set YD_DM (date +%j)(echo (date +%H)'*'(date +%M)|bc)(date +%S)
  set _flag_id (pwbd|head -1|tail -1)'_'$YD_DM
  set _flag_type   (pwbd|head -2|tail -1)
  set _flag_scope  (pwbd|head -3|tail -1)
  set _flag_subject ''
  set _flag_parent (pwb)
  set DESC   (pwbd|tail -n +5)
  argparse --name 'task' 't/type=' 's/subject=' 'p/parent=' 'q-scope=' 'i/id=' -- $argv
  if not string length -q $_flag_type
    set _flag_type $argv[1]
  end
  if not string length -q $_flag_type
    echo "task: you must inform type $argv[1] $_flag_type ie: task type" 
    exit 1
  end
  if not string length -q $_flag_subject
    set _flag_subject $argv[2]
  end
  set BRANCH_DESC "$_flag_id"\n"$_flag_type"\n"$_flag_scope"\n"$_flag_parent"\n"$_flag_subject"\n\n"$DESC"
  echo $BRANCH_DESC
  git checkout -b $_flag_id
  git config branch.$_flag_id.description "$BRANCH_DESC"
end