const fs = require('fs');
const content = fs.readFileSync('C:/Users/Webanalyticspro BD/sgtm-hubspot-crm-tracking/templates/hubspot-crm-ingest-client.tpl', 'utf8');

// Verify template structure
const parts = content.split('___');
console.log('Parts count:', parts.length);

const sandboxedJs = content.match(/___SANDBOXED_JS_FOR_SERVER___([\s\S]*?)___SERVER_PERMISSIONS___/);
if (!sandboxedJs) {
  console.error('ERROR: Could not find SANDBOXED_JS_FOR_SERVER section!');
  process.exit(1);
}

console.log('Sandboxed JS extracted, length:', sandboxedJs[1].length);

// Verify parsing/syntax with standard VM or Function
try {
  new Function('data', sandboxedJs[1]);
  console.log('SYNTAX CHECK: PASS (No JS syntax errors)');
} catch (e) {
  console.error('SYNTAX CHECK: FAILED!', e);
  process.exit(1);
}

// Check that lead_id is present
if (sandboxedJs[1].includes('hs_facebook_ad_lead_id') && sandboxedJs[1].includes('eventData.lead_id = sLeadId')) {
  console.log('LEAD ID LOGIC CHECK: PASS');
} else {
  console.error('LEAD ID LOGIC CHECK: FAILED');
  process.exit(1);
}

console.log('ALL CLIENT TEMPLATE AUDITS PASSED!');
