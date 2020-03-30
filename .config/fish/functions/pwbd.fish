# Defined in - @ line 1
function pwbd --wraps='git config branch.($argv[1]).description' --description 'alias pwbd=git config branch.($argv[1]).description'
  set BRANCH_NAME (string length -q -- $argv[1]; and echo $argv[1]; or pwb)
  git config branch.$BRANCH_NAME.description $argv[2];
end
