
export = App;

declare namespace App {
  type ApiGwHandler = (e: AWSLambda.APIGatewayProxyEvent, c: AWSLambda.Context) => Promise<{message: string}>
}

export as namespace app;
