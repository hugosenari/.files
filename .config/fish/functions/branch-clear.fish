# Defined in - @ line 1
function branch-clear --wraps=git\ branch\ --merged\|xargs\ git\ branch\ -d --description alias\ branch-clear\ git\ branch\ --merged\|xargs\ git\ branch\ -d
  git branch --merged| egrep -v "(^\*|master|dev|"(pwb)")"|xargs git branch -d $argv;
end
