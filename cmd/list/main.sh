alias lfns="aws lambda list-functions --region eu-west-1"

if [ -n "$1" ]; then
  lfns|jq ".Functions[]|{FunctionName,Runtime,Description}|select(.FunctionName|match(\"$1\"))"
else
  lfns|jq '.Functions[]|{FunctionName,Runtime,Description}'
fi
