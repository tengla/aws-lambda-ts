
if [ -z "$1" ]; then
  echo "no command given."
  echo "must be one of create or update"
  exit 1
fi

if [ -z "$2" ]; then
  echo "no function name given."
  exit 1
fi

ROLE=arn:aws:iam::469515120670:role/service-role/thomas-test-nodejs-role-jqp2n13y

function create() {

  if [ -z "$ROLE" ]; then
    echo "ROLE (arn) not set."
    return 0
  fi

  aws lambda create-function \
    --function-name "$1" \
    --description "thomas testing typescript to lambda" \
    --runtime nodejs14.x \
    --memory-size 128 \
    --publish \
    --role "$ROLE" \
    --package-type Zip \
    --zip-file fileb://function.zip \
    --timeout 30 \
    --handler index.handler \
    --region eu-west-1
}

function update() {
  aws lambda update-function-code \
    --function-name "$1" \
    --publish \
    --zip-file fileb://function.zip
}

case "$1" in
create)
  echo "creating function"
  create "$2"
  ;;
update)
  echo "updating function"
  update "$2"
  ;;
esac
