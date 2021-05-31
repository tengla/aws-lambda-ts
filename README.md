# AWS Lambda + TypeScript

Firstly, run `yarn install`

Secondly, `source cmd/alias.sh`

This contains an alias shell function called `lambda` that lets you
build, pack to zip, create and update your lambda function.

The "name" property of package.json will become the name of the lambda upstream at AWS.

With a new lambda function project run:
`lambda create`

Now, code your AWS lambda with TypeScript.

Once you are ready to publish run:
`lambda publish`

Try the lambda (RequestResponse):
`lambda invoke`
(you might want to tune this better suit your type of lambda,
take a look at script in `cmd/invoke/main.sh`).
