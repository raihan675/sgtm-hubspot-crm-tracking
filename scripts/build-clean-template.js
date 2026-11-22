const fs = require('fs');
const cp = require('child_process');
const vm = require('vm');

// Load 7ee93e8 as base
const baseContent = cp.execSync('git show 7ee93e8:templates/meta-crm-offline-conversions-tag.tpl', {
  cwd: 'C:/Users/Webanalyticspro BD/sgtm-hubspot-crm-tracking'
}).toString('utf8');

function getSections(text) {
  const map = {};
  const regex = /^___([A-Z_]+)___/gm;
  let match;
  const indices = [];
  while ((match = regex.exec(text)) !== null) {
    indices.push({ name: match[1], start: match.index, contentStart: regex.lastIndex });
  }
  for (let i = 0; i < indices.length; i++) {
    const end = i < indices.length - 1 ? indices[i + 1].start : text.length;
    map[indices[i].name] = text.substring(indices[i].contentStart, end).trim();
  }
  return map;
}

const sections = getSections(baseContent);

// 1. INFO: Strip brand completely
const info = JSON.parse(sections.INFO);
delete info.brand;
info.displayName = 'Meta CRM Offline Conversions';
info.description = 'Enterprise Meta Conversions API (CAPI) tag for Server-Side GTM, specifically designed for HubSpot CRM lifecycle stages and offline conversion tracking with automated mapping and high match quality.';
sections.INFO = JSON.stringify(info, null, 2);

// 2. TEMPLATE_PARAMETERS
let params = JSON.parse(sections.TEMPLATE_PARAMETERS);

// Filter out enableEventEnhancement
for (const group of params) {
  if (group.subParams) {
    group.subParams = group.subParams.filter(p => p.name !== 'enableEventEnhancement');
  }
}

// Clean any stape references in help strings
let paramsStr = JSON.stringify(params, null, 2);
paramsStr = paramsStr.replace(/Stape\\u0027s Data Tag/g, 'CRM Data Tag');
paramsStr = paramsStr.replace(/Stape's Data Tag/g, 'CRM Data Tag');
paramsStr = paramsStr.replace(/stape/gi, 'crm');
sections.TEMPLATE_PARAMETERS = paramsStr;

// 3. SERVER_PERMISSIONS
let perms = JSON.parse(sections.SERVER_PERMISSIONS);
// Remove _gtmeec cookie
for (const p of perms) {
  if (p.instance.key.publicId === 'set_cookies') {
    const allowed = p.instance.param[0].value.listItem;
    p.instance.param[0].value.listItem = allowed.filter(item => {
      const nameVal = item.mapValue[0].string;
      return nameVal !== '_gtmeec';
    });
  }
  if (p.instance.key.publicId === 'get_cookies') {
    const cookieNames = p.instance.param[1].value.listItem;
    p.instance.param[1].value.listItem = cookieNames.filter(item => item.string !== '_gtmeec');
  }
}
sections.SERVER_PERMISSIONS = JSON.stringify(perms, null, 2);

// 4. SANDBOXED_JS_FOR_SERVER
let code = sections.SANDBOXED_JS_FOR_SERVER;

// Replace partner agent string
code = code.replace(
  /const PARTNER_AGENT_STRING = [^;]+;/,
  "const PARTNER_AGENT_STRING = 'hubspot-crm-offline-capi-1.0.0';"
);

// Simplify setGtmEecCookie and enhanceEventData
code = code.replace(
  /function setGtmEecCookie\([\s\S]*?^}/m,
  'function setGtmEecCookie(userData) {\n  // Offline CRM conversions do not set client-side enhancement cookies\n}'
);

code = code.replace(
  /function enhanceEventData\([\s\S]*?^}/m,
  'function enhanceEventData(eventData, userData) {\n  return userData;\n}'
);

// Enhance addEcommerceData with HubSpot CRM fields
code = code.replace(
  'function addEcommerceData(data, eventData, mappedData) {',
  `function addEcommerceData(data, eventData, mappedData) {
    // Authoritative HubSpot CRM Deal & Conversion Values
    if (isValidValue(eventData.value) || isValidValue(eventData.deal_amount) || isValidValue(eventData.amount)) {
      const dealVal = makeNumber(eventData.value || eventData.deal_amount || eventData.amount);
      if (dealVal * 0 === 0) mappedData.custom_data.value = dealVal;
    }
    if (isValidValue(eventData.currency)) {
      mappedData.custom_data.currency = makeString(eventData.currency);
    }
    if (isValidValue(eventData.order_id) || isValidValue(eventData.deal_id) || isValidValue(eventData.transaction_id) || isValidValue(eventData.hs_object_id)) {
      mappedData.custom_data.order_id = makeString(eventData.order_id || eventData.deal_id || eventData.transaction_id || eventData.hs_object_id);
    }
    if (isValidValue(eventData.deal_pipeline) || isValidValue(eventData.dealstage) || isValidValue(eventData.content_category)) {
      mappedData.custom_data.content_category = makeString(eventData.deal_pipeline || eventData.dealstage || eventData.content_category);
    }`
);

sections.SANDBOXED_JS_FOR_SERVER = code;

// 5. TESTS
let tests = sections.TESTS;
tests = tests.replace(/stape-gtmss-2\.1\.7/g, 'hubspot-crm-offline-capi-1.0.0');
tests = tests.replace(/stape/gi, 'hubspot');
sections.TESTS = tests;

// 6. NOTES
sections.NOTES = `2026-11-22 Change Notes:
  - Meta CRM Offline Conversions Tag Template for Server-Side GTM.
  - Native HubSpot CRM Lifecycle Stage mappings (Lead, MQL, SQL, Opportunity, Customer, Deal stages).
  - High Match Quality user matching (external_id, fbc, fbp, lead_id, hashed PII).
  - Authoritative backend-driven tracking for CRM webhooks with action_source: system_generated.
  - Zero third-party vendor dependencies or branding.`;

// Assemble new template
let newTemplate = '\uFEFF___TERMS_OF_SERVICE___\n\n' +
  "By creating or modifying this file you agree to Google Tag Manager's Community\n" +
  "Template Gallery Developer Terms of Service available at\n" +
  "https://developers.google.com/tag-manager/gallery-tos (or such other URL as\n" +
  "Google may provide), as modified from time to time.\n\n\n" +
  '___INFO___\n\n' + sections.INFO + '\n\n' +
  '___TEMPLATE_PARAMETERS___\n\n' + sections.TEMPLATE_PARAMETERS + '\n\n' +
  '___SANDBOXED_JS_FOR_SERVER___\n\n' + sections.SANDBOXED_JS_FOR_SERVER + '\n\n' +
  '___SERVER_PERMISSIONS___\n\n' + sections.SERVER_PERMISSIONS + '\n\n' +
  '___TESTS___\n\n' + sections.TESTS + '\n\n' +
  '___NOTES___\n\n' + sections.NOTES + '\n';

// Check for any remaining 'stape'
const remainingStape = (newTemplate.match(/stape/gi) || []).length;
console.log('Remaining occurrences of "stape":', remainingStape);

// Write to files
fs.writeFileSync('C:/Users/Webanalyticspro BD/Downloads/meta-crm-offline-conversions-tag.tpl', newTemplate, 'utf8');
fs.writeFileSync('C:/Users/Webanalyticspro BD/sgtm-hubspot-crm-tracking/templates/meta-crm-offline-conversions-tag.tpl', newTemplate, 'utf8');
console.log('Updated template written successfully! Size:', newTemplate.length);
