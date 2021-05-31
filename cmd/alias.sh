
FNNAME=$(cat package.json | jq .name)

alias create-fn="sh cmd/deploy/main.sh create $FNNAME"
alias update-fn="sh cmd/deploy/main.sh update $FNNAME"
alias invoke-fn="sh cmd/invoke/main.sh $FNNAME"
alias list-fns="sh cmd/list/main.sh"
alias pack-fn="sh cmd/pack/main.sh"
alias publish-fn="pack-fn && update-fn"

function lambda() {
  case "$1" in
  create)
    echo "lambda create"
    create-fn
    ;;
  update)
    echo "lambda update"
    update-fn
    ;;
  invoke)
    echo "lambda invoke"
    invoke-fn
    ;;
  list)
    echo "lambda list"
    list-fns "$2"
    ;;
  build)
    echo "lambda build"
    pack-fn
    ;;
  publish)
    echo "lambda publish"
    pack-fn && publish-fn
    ;;
  tf)
    e=$([ -n "$NODE_ENV" ] && echo "$NODE_ENV" || echo "dev")
    echo "generate terraform blueprint"
    node cmd/tfgen
    echo "saved file ./terraform/$e/terraform.tf"
    ;;
  clean)
    echo "clean dist"
    rm dist/*{.js,.map} function.zip
    ;;
  *)
    echo "usage: lambda create|update|invoke|list|build|publish|tf"
    ;;
  esac
}
