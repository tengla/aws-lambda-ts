import createEvent from '@serverless/event-mocks';
import { APIGatewayProxyEvent } from 'aws-lambda';

export const context = {
  getRemainingTimeInMillis: () => 1000,
  functionName: "test-lambda",
  functionVersion: "1",
  invokedFunctionArn: "n/a",
  memoryLimitInMB: "128",
  awsRequestId: "abc-123",
  logGroupName: "test-group",
  logStreamName: "test-stream",
  callbackWaitsForEmptyEventLoop: false,
  /** deprecated, but type def still whines when not present */
  done: () => "done",
  fail: () => "fail",
  succeed: () => "succeed"
};

export const event = createEvent(
  "aws:apiGateway",
  {
    body: 'testing'
  } as APIGatewayProxyEvent
);