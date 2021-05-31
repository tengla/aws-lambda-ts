
export const handler: app.ApiGwHandler = (
  event: AWSLambda.APIGatewayProxyEvent,
  ctx: AWSLambda.Context,
) => {
  console.log(event.httpMethod,
    ctx.awsRequestId, ctx.functionName,
    ctx.functionVersion)
  return Promise.resolve({
    message: "A hello as promised."
  })
};
