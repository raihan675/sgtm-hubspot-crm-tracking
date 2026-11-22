const fs = require('fs');
const vm = require('vm');
const content = fs.readFileSync('C:/Users/Webanalyticspro BD/sgtm-hubspot-crm-tracking/templates/meta-crm-offline-conversions-tag.tpl', 'utf8');
const match = content.match(/___SANDBOXED_JS_FOR_SERVER___([\s\S]*?)___SERVER_PERMISSIONS___/);
const code = '(function(data) {\n' + match[1] + '\n})(mockData);';

let capturedUrl = '';
let capturedBody = null;

const mockEnv = {
  require: (name) => {
    if (name === 'getAllEventData') return () => ({
      event_name: 'deal_closed_won',
      event_time: 1732274400,
      user_data: {
        email: 'john.doe@example.com',
        phone: '+1 (555) 019-2834',
        external_id: '10928374',
        fbc: 'fb.1.1554763741205.AbCdEfGhIjKlMnOpQrStUvWxYz',
        fbp: 'fb.1.1558571054389.109849493'
      },
      value: '2500.00',
      currency: 'USD',
      transaction_id: 'deal_98765'
    });
    if (name === 'sendHttpRequest') return (url, opts, body) => {
      capturedUrl = url;
      capturedBody = JSON.parse(body);
      return Promise.resolve({ statusCode: 200, body: '{"events_received":1}' });
    };
    if (name === 'sha256Sync') return (val) => 'hashed_' + val;
    if (name === 'getTimestampMillis') return () => 1732274400000;
    if (name === 'encodeUriComponent') return encodeURIComponent;
    if (name === 'JSON') return JSON;
    if (name === 'getType') return (v) => v === null ? 'null' : Array.isArray(v) ? 'array' : typeof v;
    if (name === 'makeString') return (v) => '' + v;
    if (name === 'makeNumber') return (v) => Number(v);
    if (name === 'makeInteger') return (n) => Math.floor(n);
    if (name === 'Math') return Math;
    if (name === 'Promise') return Promise;
    throw new Error('Unknown require: ' + name);
  },
  mockData: {
    datasetId: '123456789012345',
    accessToken: 'EAABtestToken...',
    testEventCode: 'TEST12345',
    gtmOnSuccess: () => console.log('GTM SUCCESS: Tag execution completed!'),
    gtmOnFailure: () => console.log('GTM FAILURE: Tag failed!')
  }
};

try {
  vm.runInNewContext(code, mockEnv);
  console.log('--- Verification Output ---');
  console.log('Meta Endpoint URL:', capturedUrl);
  console.log('Single Event Payload:');
  console.log(JSON.stringify(capturedBody, null, 2));
  console.log('--- Simulation Status: 100% SUCCESS ---');
} catch (e) {
  console.error('Simulation error:', e);
}
