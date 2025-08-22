import test from 'node:test';
import assert from 'node:assert/strict';
import { handler } from '../index.js';

test('returns hello world', async () => {
  const res = await handler({ queryStringParameters: {} });
  assert.equal(res.statusCode, 200);
  const body = JSON.parse(res.body);
  assert.equal(body.message, 'Hello, World! Teste 2');
});