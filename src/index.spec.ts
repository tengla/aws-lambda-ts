import { handler } from './index';
import { event, context } from './test-helper';

test('should handle event', async () => {
  const response = await handler(event, context);
  expect(response.message).toEqual(
    'A hello as promised.');
});
