# Defined in - @ line 1
function issue --description 'issue [--type|-t type] [--scope|-e scope] [--parent|-p parent] [--id|-i id] [[--subject subject|-s subject] subject]'
  set _flag_id      (pwbd|head -1|tail -1)
  set _flag_type    (pwbd|head -2|tail -1)
  set _flag_scope   (pwbd|head -3|tail -1)
  set _flag_parent  (pwb)
  set _flag_subject (pwbd|head -5|tail -1)
  argparse --name 'issue' 't/type=' 's/subject=' 'p/parent=' 'q-scope=' 'i/id=' -- $argv
  if not string length -q $_flag_id
    set _flag_id $argv[1]
  end
  if not string length -q $_flag_id
    echo "issue: you must inform id $_flag_id ie: issue MY-123" 
    exit 1
  end
  if not string length -q $_flag_subject
    set _flag_subject $argv[2]
  end
  if not string length -q $_flag_type
    set _flag_type 'feat'
  end
  set BRANCH_DESC $_flag_id\n$_flag_type\n$_flag_scope\n$_flag_parent\n$_flag_subject
  git checkout -b $_flag_id
  git config branch.$_flag_id.description "$BRANCH_DESC"
  git push -u origin $_flag_id
end
