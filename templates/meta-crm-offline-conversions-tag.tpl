___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Meta CRM & Offline Conversions",
  "categories": [
    "ADVERTISING",
    "CONVERSIONS",
    "MARKETING"
  ],
  "description": "Enterprise Meta Conversions API (CAPI) tag for Server-Side GTM, specifically designed for HubSpot and CRM offline conversion tracking with automated lifecycle mapping and high match quality.",
  "containerContexts": [
    "SERVER"
  ]
}

___TEMPLATE_PARAMETERS___

[
  {
    "type": "GROUP",
    "name": "configGroup",
    "subParams": [
      {
        "type": "TEXT",
        "name": "datasetId",
        "displayName": "Meta Dataset ID / Pixel ID",
        "simpleValueType": true,
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "help": "Your 15-16 digit Meta Dataset ID or Pixel ID from Meta Events Manager (e.g. 123456789012345)."
      },
      {
        "type": "TEXT",
        "name": "accessToken",
        "displayName": "API Access Token",
        "simpleValueType": true,
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "help": "Your permanent Conversions API access token generated from Meta Events Manager or Business Manager System User."
      },
      {
        "type": "SELECT",
        "name": "actionSource",
        "displayName": "Action Source",
        "defaultValue": "system_generated",
        "selectItems": [
          {
            "value": "system_generated",
            "displayValue": "system_generated (Mandatory for CRM Offline Conversions)"
          },
          {
            "value": "website",
            "displayValue": "website"
          },
          {
            "value": "phone_call",
            "displayValue": "phone_call"
          },
          {
            "value": "email",
            "displayValue": "email"
          },
          {
            "value": "other",
            "displayValue": "other"
          }
        ],
        "simpleValueType": true,
        "help": "Meta requires system_generated for server-to-server CRM offline conversion attribution."
      },
      {
        "type": "TEXT",
        "name": "testEventCode",
        "displayName": "Test Event Code (Optional)",
        "simpleValueType": true,
        "help": "Optional test code from Meta Events Manager > Test Events (e.g. TEST12345). Leave blank in production."
      },
      {
        "type": "TEXT",
        "name": "apiVersion",
        "displayName": "Meta Graph API Version",
        "defaultValue": "v21.0",
        "simpleValueType": true,
        "help": "Meta Graph API version (default: v21.0)."
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "eventMappingGroup",
    "displayName": "CRM Event & Lifecycle Stage Mapping",
    "groupStyle": "ZIPPY_OPEN_ON_PARAM",
    "subParams": [
      {
        "type": "SELECT",
        "name": "eventMode",
        "displayName": "Event Resolution Mode",
        "defaultValue": "AUTO_CRM_MAP",
        "selectItems": [
          {
            "value": "AUTO_CRM_MAP",
            "displayValue": "Auto-Map HubSpot CRM Stages to Meta Events (Recommended)"
          },
          {
            "value": "INHERIT",
            "displayValue": "Inherit Event Name from Incoming Event Data"
          },
          {
            "value": "CUSTOM",
            "displayValue": "Specify Single Meta Event Name"
          }
        ],
        "simpleValueType": true,
        "help": "Auto-Map converts lifecycle_sql -> SubmitApplication, deal_closed_won -> Purchase, contact_meeting_booked -> Schedule, etc."
      },
      {
        "type": "TEXT",
        "name": "customEventName",
        "displayName": "Custom Meta Event Name",
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "eventMode",
            "paramValue": "CUSTOM",
            "type": "EQUALS"
          }
        ],
        "help": "Target Meta standard or custom event name (e.g. Lead, SubmitApplication, Purchase)."
      },
      {
        "type": "SIMPLE_TABLE",
        "name": "crmEventOverrides",
        "displayName": "Custom CRM Event Overrides (Optional)",
        "simpleTableColumns": [
          {
            "defaultValue": "",
            "displayName": "Incoming CRM Event Name",
            "name": "crmEvent",
            "type": "TEXT"
          },
          {
            "defaultValue": "",
            "displayName": "Target Meta Standard/Custom Event",
            "name": "metaEvent",
            "type": "TEXT"
          }
        ],
        "newRowButtonText": "Add CRM Override",
        "help": "Allows mapping custom HubSpot events or other CRMs (Salesforce, Zoho, Pipedrive) to Meta events."
      },
      {
        "type": "TEXT",
        "name": "eventId",
        "displayName": "Event ID (Deduplication Key)",
        "simpleValueType": true,
        "help": "Leave empty to automatically inherit from Event Data (event_id or transaction_id)."
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "userDataGroup",
    "displayName": "Customer Information Parameters (user_data)",
    "groupStyle": "ZIPPY_OPEN_ON_PARAM",
    "subParams": [
      {
        "type": "SELECT",
        "name": "userDataMode",
        "displayName": "Customer Data Source",
        "defaultValue": "AUTO",
        "selectItems": [
          {
            "value": "AUTO",
            "displayValue": "Auto-Extract from CRM Event Data (Recommended)"
          },
          {
            "value": "MANUAL",
            "displayValue": "Manually Specify Variables"
          }
        ],
        "simpleValueType": true,
        "help": "Auto mode extracts em, ph, external_id, fbc, and fbp from incoming CRM webhook event data."
      },
      {
        "type": "TEXT",
        "name": "manualEmail",
        "displayName": "Email Address",
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "userDataMode",
            "paramValue": "MANUAL",
            "type": "EQUALS"
          }
        ]
      },
      {
        "type": "TEXT",
        "name": "manualPhone",
        "displayName": "Phone Number",
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "userDataMode",
            "paramValue": "MANUAL",
            "type": "EQUALS"
          }
        ]
      },
      {
        "type": "TEXT",
        "name": "manualExternalId",
        "displayName": "External ID (CRM Contact Record ID)",
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "userDataMode",
            "paramValue": "MANUAL",
            "type": "EQUALS"
          }
        ]
      },
      {
        "type": "TEXT",
        "name": "manualFbc",
        "displayName": "Facebook Click ID (fbc)",
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "userDataMode",
            "paramValue": "MANUAL",
            "type": "EQUALS"
          }
        ]
      },
      {
        "type": "TEXT",
        "name": "manualFbp",
        "displayName": "Facebook Browser ID (fbp)",
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "userDataMode",
            "paramValue": "MANUAL",
            "type": "EQUALS"
          }
        ]
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "customDataGroup",
    "displayName": "Financial & Deal Parameters (custom_data)",
    "groupStyle": "ZIPPY_OPEN_ON_PARAM",
    "subParams": [
      {
        "type": "CHECKBOX",
        "name": "enableCustomData",
        "checkboxText": "Send Monetary Value and Deal Metadata",
        "defaultValue": true,
        "help": "Includes value, currency, and deal/order ID in custom_data. Required for Purchase events and ROAS optimization."
      },
      {
        "type": "TEXT",
        "name": "conversionValue",
        "displayName": "Deal / Conversion Value",
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "enableCustomData",
            "paramValue": true,
            "type": "EQUALS"
          }
        ],
        "help": "Leave blank to automatically extract from eventData.value, deal_amount, or amount."
      },
      {
        "type": "TEXT",
        "name": "currencyCode",
        "displayName": "Currency Code",
        "defaultValue": "USD",
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "enableCustomData",
            "paramValue": true,
            "type": "EQUALS"
          }
        ],
        "help": "3-letter uppercase ISO currency code (default: USD)."
      },
      {
        "type": "TEXT",
        "name": "orderId",
        "displayName": "Order / Deal ID",
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "enableCustomData",
            "paramValue": true,
            "type": "EQUALS"
          }
        ],
        "help": "Leave blank to automatically extract from transaction_id, order_id, or deal_id."
      },
      {
        "type": "TEXT",
        "name": "contentCategory",
        "displayName": "Deal Pipeline / Category",
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "enableCustomData",
            "paramValue": true,
            "type": "EQUALS"
          }
        ],
        "help": "Optional deal pipeline name or content category."
      }
    ]
  }
]

___SANDBOXED_JS_FOR_SERVER___

const getAllEventData = require('getAllEventData');
const sendHttpRequest = require('sendHttpRequest');
const sha256Sync = require('sha256Sync');
const getTimestampMillis = require('getTimestampMillis');
const encodeUriComponent = require('encodeUriComponent');
const JSON = require('JSON');
const getType = require('getType');
const makeString = require('makeString');
const makeNumber = require('makeNumber');
const Math = require('Math');
const Promise = require('Promise');

const eventData = getAllEventData() || {};

// 1. Validate Required Meta Credentials
const datasetId = data.datasetId;
const accessToken = data.accessToken;
const apiVersion = data.apiVersion || 'v21.0';
const testEventCode = data.testEventCode;

if (!datasetId || !accessToken) {
  return data.gtmOnFailure();
}

// 2. Data Validation & Normalization Helpers
function isValidValue(val) {
  const t = getType(val);
  if (t === 'null' || t === 'undefined' || val !== val) return false;
  return val !== '' && val !== 'undefined' && val !== 'null';
}

function cleanString(val) {
  if (!isValidValue(val)) return '';
  return makeString(val).trim();
}

function isHashed(val) {
  if (!val) return false;
  return makeString(val).match('^[A-Fa-f0-9]{64}$') !== null;
}

function hashString(val) {
  if (!isValidValue(val)) return '';
  const cleaned = cleanString(val).toLowerCase();
  if (isHashed(cleaned)) return cleaned;
  return sha256Sync(cleaned, { outputEncoding: 'hex' });
}

function normalizePhone(phone) {
  if (!isValidValue(phone)) return '';
  const s = makeString(phone);
  let digits = '';
  for (let i = 0; i < s.length; i++) {
    const c = s.charAt(i);
    if ('0123456789'.indexOf(c) !== -1) digits += c;
  }
  return digits;
}

function hashPhone(phone) {
  if (!isValidValue(phone)) return '';
  const digits = normalizePhone(phone);
  if (!digits) return '';
  if (isHashed(digits)) return digits;
  return sha256Sync(digits, { outputEncoding: 'hex' });
}

function parseNumber(val) {
  if (!isValidValue(val)) return undefined;
  const t = getType(val);
  if (t !== 'number' && t !== 'string') return undefined;
  if (t === 'string' && makeString(val).trim() === '') return undefined;
  const num = makeNumber(val);
  if (num * 0 !== 0) return undefined;
  return num;
}

// 3. Resolve Event Name (HubSpot Native + Universal CRM Mapping)
let rawEventName = cleanString(eventData.event_name || 'CRM_Event');
let resolvedEventName = rawEventName;

// Check user-configured custom CRM overrides first
if (data.crmEventOverrides && data.crmEventOverrides.length > 0) {
  for (let i = 0; i < data.crmEventOverrides.length; i++) {
    const row = data.crmEventOverrides[i];
    if (row && row.crmEvent === rawEventName && row.metaEvent) {
      resolvedEventName = row.metaEvent;
      break;
    }
  }
}

if (data.eventMode === 'CUSTOM' && data.customEventName) {
  resolvedEventName = data.customEventName;
} else if (data.eventMode === 'AUTO_CRM_MAP') {
  const lower = rawEventName.toLowerCase();
  
  // HubSpot & General CRM Lifecycle Stage Translations
  if (lower === 'lifecycle_subscriber') resolvedEventName = 'Lead';
  else if (lower === 'lifecycle_lead') resolvedEventName = 'Lead';
  else if (lower === 'lifecycle_mql') resolvedEventName = 'Lead';
  else if (lower === 'lifecycle_sql') resolvedEventName = 'SubmitApplication';
  else if (lower === 'lifecycle_opportunity') resolvedEventName = 'InitiateCheckout';
  else if (lower === 'lifecycle_customer') resolvedEventName = 'Purchase';
  else if (lower === 'lifecycle_evangelist') resolvedEventName = 'CompleteRegistration';
  
  // HubSpot & Lead Status Translations
  else if (lower === 'lead_status_new') resolvedEventName = 'Lead';
  else if (lower === 'lead_status_open') resolvedEventName = 'Lead';
  else if (lower === 'lead_status_in_progress') resolvedEventName = 'Contact';
  else if (lower === 'lead_status_attempted_to_contact') resolvedEventName = 'Contact';
  else if (lower === 'lead_status_connected') resolvedEventName = 'Contact';
  else if (lower === 'lead_status_open_deal') resolvedEventName = 'InitiateCheckout';
  
  // CRM Meetings & Schedules
  else if (lower === 'contact_meeting_booked') resolvedEventName = 'Schedule';
  else if (lower === 'deal_appointment_scheduled') resolvedEventName = 'Schedule';
  
  // Deal Pipeline Progression
  else if (lower === 'deal_closed_won') resolvedEventName = 'Purchase';
  else if (lower === 'deal_qualified') resolvedEventName = 'InitiateCheckout';
  else if (lower === 'deal_contract_sent') resolvedEventName = 'InitiateCheckout';
  else if (lower === 'deal_amount_updated') resolvedEventName = 'InitiateCheckout';
}

// 4. Resolve Event Time (10-digit Unix Epoch Seconds)
let eventTime = eventData.event_time;
const numTime = parseNumber(eventTime);
if (numTime) {
  eventTime = (numTime > 100000000000) ? Math.round(numTime / 1000) : Math.round(numTime);
} else {
  eventTime = Math.round(getTimestampMillis() / 1000);
}

// 5. Resolve Action Source & Event ID
const actionSource = cleanString(eventData.action_source || data.actionSource || 'system_generated');
const eventId = cleanString(data.eventId || eventData.event_id || eventData.transaction_id || '');

// 6. Assemble Customer Matching Parameters (user_data)
const rawUserData = eventData.user_data || {};
const finalUserData = {};

// External ID (HubSpot Contact Record ID, Deal ID, or other CRM unique ID)
let extId = '';
if (data.userDataMode === 'MANUAL' && data.manualExternalId) {
  extId = cleanString(data.manualExternalId);
} else {
  extId = cleanString(rawUserData.external_id || eventData.external_id || eventData.contact_id || eventData.user_id || eventData.hs_object_id || '');
}
if (extId) {
  finalUserData.external_id = [extId];
}

// Email Address (em)
let rawEmail = '';
if (data.userDataMode === 'MANUAL' && data.manualEmail) {
  rawEmail = data.manualEmail;
} else {
  rawEmail = rawUserData.em || rawUserData.email || rawUserData.email_address || eventData.email || '';
}
if (rawEmail) {
  const hashed = hashString(rawEmail);
  if (hashed) finalUserData.em = [hashed];
}

// Phone Number (ph)
let rawPhone = '';
if (data.userDataMode === 'MANUAL' && data.manualPhone) {
  rawPhone = data.manualPhone;
} else {
  rawPhone = rawUserData.ph || rawUserData.phone || rawUserData.phone_number || eventData.phone || '';
}
if (rawPhone) {
  const hashedPh = hashPhone(rawPhone);
  if (hashedPh) finalUserData.ph = [hashedPh];
}

// Meta Click ID (fbc) - NEVER HASHED
let rawFbc = '';
if (data.userDataMode === 'MANUAL' && data.manualFbc) {
  rawFbc = data.manualFbc;
} else {
  rawFbc = rawUserData.fbc || eventData.fbc || (eventData.attribution ? eventData.attribution.fbc : '');
}
if (rawFbc && makeString(rawFbc).indexOf('fb.') === 0) {
  finalUserData.fbc = cleanString(rawFbc);
}

// Meta Browser ID (fbp) - NEVER HASHED
let rawFbp = '';
if (data.userDataMode === 'MANUAL' && data.manualFbp) {
  rawFbp = data.manualFbp;
} else {
  rawFbp = rawUserData.fbp || eventData.fbp || (eventData.attribution ? eventData.attribution.fbp : '');
}
if (rawFbp && makeString(rawFbp).indexOf('fb.') === 0) {
  finalUserData.fbp = cleanString(rawFbp);
}

// Meta Lead Ad ID (lead_id) - NEVER HASHED
const rawLead = rawUserData.lead_id || eventData.lead_id || '';
if (rawLead) {
  finalUserData.lead_id = makeString(rawLead);
}

// First & Last Name
const rawFn = rawUserData.fn || (rawUserData.address ? rawUserData.address.first_name : '') || eventData.first_name || '';
if (rawFn) {
  const hashedFn = hashString(rawFn);
  if (hashedFn) finalUserData.fn = [hashedFn];
}
const rawLn = rawUserData.ln || (rawUserData.address ? rawUserData.address.last_name : '') || eventData.last_name || '';
if (rawLn) {
  const hashedLn = hashString(rawLn);
  if (hashedLn) finalUserData.ln = [hashedLn];
}

// Address Fields (ct, st, zp, country)
const rawCt = rawUserData.ct || (rawUserData.address ? rawUserData.address.city : '') || eventData.city || '';
if (rawCt) {
  const h = hashString(rawCt);
  if (h) finalUserData.ct = [h];
}
const rawSt = rawUserData.st || (rawUserData.address ? rawUserData.address.region : '') || eventData.state || '';
if (rawSt) {
  const h = hashString(rawSt);
  if (h) finalUserData.st = [h];
}
const rawZp = rawUserData.zp || (rawUserData.address ? rawUserData.address.postal_code : '') || eventData.zip || '';
if (rawZp) {
  const h = hashString(rawZp);
  if (h) finalUserData.zp = [h];
}
const rawCountry = rawUserData.country || (rawUserData.address ? rawUserData.address.country : '') || eventData.country || '';
if (rawCountry) {
  const h = hashString(rawCountry);
  if (h) finalUserData.country = [h];
}

// 7. Assemble Financial & Conversion Data (custom_data)
const finalCustomData = {};
if (data.enableCustomData !== false) {
  const valSource = isValidValue(data.conversionValue) ? data.conversionValue : (eventData.value || eventData.deal_amount || eventData.amount);
  const parsedVal = parseNumber(valSource);
  if (parsedVal !== undefined && parsedVal > 0) {
    finalCustomData.value = parsedVal;
  } else if (resolvedEventName === 'Purchase') {
    finalCustomData.value = 0.00;
  }
  
  const curSource = data.currencyCode || eventData.currency || 'USD';
  if (curSource) {
    finalCustomData.currency = cleanString(curSource).toUpperCase();
  }
  
  const ordSource = data.orderId || eventData.order_id || eventData.transaction_id || eventData.deal_id || eventData.hs_object_id || eventId;
  if (ordSource) {
    finalCustomData.order_id = makeString(ordSource);
  }
  
  const catSource = data.contentCategory || eventData.deal_pipeline || eventData.content_category || '';
  if (catSource) {
    finalCustomData.content_category = cleanString(catSource);
  }
}

// 8. Construct Meta Graph API Event Object
const eventObj = {
  event_name: resolvedEventName,
  event_time: eventTime,
  action_source: actionSource,
  user_data: finalUserData
};

if (eventId) {
  eventObj.event_id = eventId;
}

if (eventData.event_source_url) {
  eventObj.event_source_url = eventData.event_source_url;
}

if (data.enableCustomData !== false && (finalCustomData.value !== undefined || finalCustomData.order_id || resolvedEventName === 'Purchase')) {
  eventObj.custom_data = finalCustomData;
}

const payload = {
  data: [eventObj]
};

if (testEventCode) {
  payload.test_event_code = cleanString(testEventCode);
}

// 9. Dispatch Event to Meta Conversions API
const postUrl = 'https://graph.facebook.com/' + apiVersion + '/' + encodeUriComponent(datasetId) + '/events?access_token=' + encodeUriComponent(accessToken) + (testEventCode ? '&test_event_code=' + encodeUriComponent(testEventCode) : '');
const bodyString = JSON.stringify(payload);

sendHttpRequest(postUrl, {
  method: 'POST',
  headers: {
    'content-type': 'application/json'
  },
  timeout: 5000
}, bodyString).then((res) => {
  if (res.statusCode >= 200 && res.statusCode < 300) {
    return data.gtmOnSuccess();
  } else {
    return data.gtmOnFailure();
  }
}).catch((err) => {
  return data.gtmOnFailure();
});


___SERVER_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "read_event_data",
        "versionId": "1"
      },
      "param": [
        {
          "key": "eventDataAccess",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "send_http",
        "versionId": "1"
      },
      "param": [
        {
          "key": "allowedUrls",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://graph.facebook.com/"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]

___TESTS___

scenarios: []


___NOTES___

2026-11-22 Change Notes:
  - Custom Meta CRM & Offline Conversions Tag Template for Server-Side GTM.
  - Built specifically for HubSpot CRM lifecycle events and deals with multi-CRM support.
  - Zero DOM scraping, authoritative backend data ingestion.
  - Strict compliance with Meta Graph API v21.0 offline CRM conversion specifications.
