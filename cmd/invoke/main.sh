
if [ -z "$1" ]; then
  echo "no function name given, exiting."
  exit 1
fi

aws lambda invoke \
 --cli-binary-format raw-in-base64-out \
  --function-name "$1" \
  --invocation-type RequestResponse \
  --payload '{ "name": "Bob" }' \
  --region eu-west-1 \
  output.json

cat output.json
