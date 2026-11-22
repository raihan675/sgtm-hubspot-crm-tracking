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
  "displayName": "Meta CRM Offline Conversions",
  "categories": [
    "ADVERTISING",
    "CONVERSIONS",
    "MARKETING"
  ],
  "description": "Specialized Meta Conversions API (CAPI) tag for Server-Side GTM, optimized for HubSpot CRM offline conversions, automated lifecycle mapping, and high match quality.",
  "containerContexts": [
    "SERVER"
  ]
}

___TEMPLATE_PARAMETERS___

[
  {
    "type": "GROUP",
    "name": "connectionGroup",
    "displayName": "Meta API Credentials & Connection",
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
        "displayName": "System User Access Token",
        "simpleValueType": true,
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "help": "Your permanent Conversions API access token generated from Meta Events Manager or Business Manager System User."
      },
      {
        "type": "TEXT",
        "name": "testEventCode",
        "displayName": "Test Event Code (Debugging Only)",
        "simpleValueType": true,
        "help": "Optional test code from Meta Events Manager > Test Events (e.g. TEST12345). Leave empty in production."
      },
      {
        "type": "TEXT",
        "name": "apiEndpoint",
        "displayName": "API Endpoint Base URL",
        "defaultValue": "https://graph.facebook.com",
        "simpleValueType": true,
        "help": "Defaults to https://graph.facebook.com. You can replace this if using a custom CAPI proxy."
      },
      {
        "type": "TEXT",
        "name": "apiVersion",
        "displayName": "Graph API Version",
        "defaultValue": "v21.0",
        "simpleValueType": true,
        "help": "Meta Graph API version (default: v21.0)."
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "eventConfigGroup",
    "displayName": "Event Configuration & Lifecycle Mapping",
    "subParams": [
      {
        "type": "SELECT",
        "name": "eventMode",
        "displayName": "Event Name Resolution Mode",
        "defaultValue": "AUTO_CRM_MAP",
        "selectItems": [
          {
            "value": "AUTO_CRM_MAP",
            "displayValue": "Auto-Map CRM Lifecycle & Deal Events to Meta Standards (Recommended)"
          },
          {
            "value": "INHERIT",
            "displayValue": "Inherit Event Name from Event Data (Exact String)"
          },
          {
            "value": "CUSTOM",
            "displayValue": "Specify Explicit Meta Event Name"
          }
        ],
        "simpleValueType": true,
        "help": "Auto-Map translates lifecycle_sql to SubmitApplication, deal_closed_won to Purchase, meeting_booked to Schedule, etc."
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
        "help": "Specify the exact Meta standard or custom event name (e.g. Purchase, Lead, QualificationCompleted)."
      },
      {
        "type": "SIMPLE_TABLE",
        "name": "customStageOverrides",
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
        "newRowButtonText": "Add Override",
        "help": "Override specific CRM event names to custom Meta events (e.g. crm_kyc_verified -> CompleteRegistration)."
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
            "value": "other",
            "displayValue": "other"
          }
        ],
        "simpleValueType": true,
        "help": "Must be system_generated for server-to-server CRM offline conversions."
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
    "displayName": "Customer Matching Parameters (user_data)",
    "subParams": [
      {
        "type": "SELECT",
        "name": "userDataMode",
        "displayName": "Customer Data Source",
        "defaultValue": "AUTO",
        "selectItems": [
          {
            "value": "AUTO",
            "displayValue": "Auto-Extract from Event Data (Recommended)"
          },
          {
            "value": "MANUAL",
            "displayValue": "Manually Map Fields"
          }
        ],
        "simpleValueType": true,
        "help": "Auto mode extracts em, ph, external_id, fbc, fbp from event_data.user_data or top-level event fields."
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
    "displayName": "Financial & Conversion Parameters (custom_data)",
    "subParams": [
      {
        "type": "CHECKBOX",
        "name": "enableCustomData",
        "checkboxText": "Send Conversion Value and Order Metadata",
        "defaultValue": true,
        "help": "Includes value, currency, and order_id in custom_data. Required for Purchase and Value Optimization."
      },
      {
        "type": "TEXT",
        "name": "conversionValue",
        "displayName": "Monetary Value",
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "enableCustomData",
            "paramValue": true,
            "type": "EQUALS"
          }
        ],
        "help": "Leave empty to automatically inherit from event data (eventData.value)."
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
        "help": "3-letter uppercase ISO currency code (default: USD). Automatically inherits if eventData.currency is present."
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
        "help": "Leave empty to automatically inherit from transaction_id or order_id."
      },
      {
        "type": "TEXT",
        "name": "contentCategory",
        "displayName": "Content Category / Deal Pipeline",
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "enableCustomData",
            "paramValue": true,
            "type": "EQUALS"
          }
        ]
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
const makeInteger = require('makeInteger');
const Math = require('Math');
const Promise = require('Promise');

const eventData = getAllEventData() || {};

// 1. Resolve Meta Credentials
const datasetId = data.datasetId;
const accessToken = data.accessToken;
const apiEndpoint = data.apiEndpoint || 'https://graph.facebook.com';
const apiVersion = data.apiVersion || 'v21.0';
const testEventCode = data.testEventCode;

if (!datasetId || !accessToken) {
  data.gtmOnFailure();
  return;
}

// 2. Normalization & Cryptographic Helper Functions (Stape-aligned robust patterns)
function isValidValue(value) {
  const valueType = getType(value);
  if (valueType === 'null' || valueType === 'undefined' || value !== value) return false;
  return value !== '' && value !== 'undefined' && value !== 'null';
}

function isHashed(value) {
  if (!value) return false;
  return makeString(value).match('^[A-Fa-f0-9]{64}$') !== null;
}

function cleanString(val) {
  if (!isValidValue(val)) return '';
  return makeString(val).trim();
}

function hashString(val) {
  if (!isValidValue(val)) return '';
  const cleaned = cleanString(val).toLowerCase();
  if (isHashed(cleaned)) return cleaned;
  return sha256Sync(cleaned, { outputEncoding: 'hex' });
}

function normalizePhoneNumber(phoneNumber) {
  if (!isValidValue(phoneNumber)) return '';
  const s = makeString(phoneNumber);
  let digits = '';
  for (let i = 0; i < s.length; i++) {
    const c = s.charAt(i);
    if ('0123456789'.indexOf(c) !== -1) digits += c;
  }
  return digits;
}

function hashPhone(val) {
  if (!isValidValue(val)) return '';
  const digits = normalizePhoneNumber(val);
  if (!digits) return '';
  if (isHashed(digits)) return digits;
  return sha256Sync(digits, { outputEncoding: 'hex' });
}

function toFiniteNumber(value) {
  if (!isValidValue(value)) return undefined;
  const valueType = getType(value);
  if (valueType !== 'number' && valueType !== 'string') return undefined;
  if (valueType === 'string' && makeString(value).trim() === '') return undefined;
  const parsed = makeNumber(value);
  if (parsed * 0 !== 0) return undefined;
  return parsed;
}

// 3. Resolve Meta Event Name
let rawEventName = eventData.event_name || 'CRM_Event';
let targetEventName = rawEventName;

// Check user-configured custom stage overrides table first
if (data.customStageOverrides && data.customStageOverrides.length > 0) {
  for (let i = 0; i < data.customStageOverrides.length; i++) {
    const row = data.customStageOverrides[i];
    if (row && row.crmEvent === rawEventName && row.metaEvent) {
      targetEventName = row.metaEvent;
      break;
    }
  }
}

if (data.eventMode === 'CUSTOM' && data.customEventName) {
  targetEventName = data.customEventName;
} else if (data.eventMode === 'AUTO_CRM_MAP') {
  const lowerName = rawEventName.toLowerCase();
  
  // HubSpot Lifecycle Stage Mappings
  if (lowerName === 'lifecycle_subscriber') targetEventName = 'Lead';
  else if (lowerName === 'lifecycle_lead') targetEventName = 'Lead';
  else if (lowerName === 'lifecycle_mql') targetEventName = 'Lead';
  else if (lowerName === 'lifecycle_sql') targetEventName = 'SubmitApplication';
  else if (lowerName === 'lifecycle_opportunity') targetEventName = 'InitiateCheckout';
  else if (lowerName === 'lifecycle_customer') targetEventName = 'Purchase';
  else if (lowerName === 'lifecycle_evangelist') targetEventName = 'CompleteRegistration';
  
  // HubSpot Lead Status Mappings
  else if (lowerName === 'lead_status_new') targetEventName = 'Lead';
  else if (lowerName === 'lead_status_open') targetEventName = 'Lead';
  else if (lowerName === 'lead_status_in_progress') targetEventName = 'Contact';
  else if (lowerName === 'lead_status_attempted_to_contact') targetEventName = 'Contact';
  else if (lowerName === 'lead_status_connected') targetEventName = 'Contact';
  else if (lowerName === 'lead_status_open_deal') targetEventName = 'InitiateCheckout';
  
  // Engagement & Meeting Mappings
  else if (lowerName === 'contact_meeting_booked') targetEventName = 'Schedule';
  else if (lowerName === 'deal_appointment_scheduled') targetEventName = 'Schedule';
  
  // HubSpot Deal Pipeline Mappings
  else if (lowerName === 'deal_closed_won') targetEventName = 'Purchase';
  else if (lowerName === 'deal_qualified') targetEventName = 'InitiateCheckout';
  else if (lowerName === 'deal_contract_sent') targetEventName = 'InitiateCheckout';
  else if (lowerName === 'deal_amount_updated') targetEventName = 'InitiateCheckout';
}

// 4. Resolve Event Time (Strictly 10-digit Unix Epoch Seconds)
let eventTime = eventData.event_time || getTimestampMillis();
const numEventTime = toFiniteNumber(eventTime) || Math.round(getTimestampMillis() / 1000);
if (numEventTime > 100000000000) {
  eventTime = Math.round(numEventTime / 1000);
} else {
  eventTime = Math.round(numEventTime);
}

// 5. Resolve Event ID & Action Source
const resolvedEventId = cleanString(data.eventId || eventData.event_id || eventData.transaction_id || '');
const resolvedActionSource = data.actionSource || eventData.action_source || 'system_generated';

// 6. Build Customer Information Parameters (user_data)
const rawUserData = eventData.user_data || {};
const finalUserData = {};

// Handle External ID (CRM Contact Record ID)
let extId = '';
if (data.userDataMode === 'MANUAL' && data.manualExternalId) {
  extId = cleanString(data.manualExternalId);
} else {
  extId = cleanString(rawUserData.external_id || eventData.external_id || '');
}
if (extId) {
  finalUserData.external_id = [extId];
}

// Handle Email (em)
let rawEmail = '';
if (data.userDataMode === 'MANUAL' && data.manualEmail) {
  rawEmail = data.manualEmail;
} else {
  rawEmail = rawUserData.em || rawUserData.email || rawUserData.email_address || eventData.email || '';
}
if (rawEmail) {
  const hashedEmail = hashString(rawEmail);
  if (hashedEmail) finalUserData.em = [hashedEmail];
}

// Handle Phone (ph)
let rawPhone = '';
if (data.userDataMode === 'MANUAL' && data.manualPhone) {
  rawPhone = data.manualPhone;
} else {
  rawPhone = rawUserData.ph || rawUserData.phone || rawUserData.phone_number || eventData.phone || '';
}
if (rawPhone) {
  const hashedPhone = hashPhone(rawPhone);
  if (hashedPhone) finalUserData.ph = [hashedPhone];
}

// Handle Meta Click ID (fbc) - NEVER HASH
let rawFbc = '';
if (data.userDataMode === 'MANUAL' && data.manualFbc) {
  rawFbc = data.manualFbc;
} else {
  rawFbc = rawUserData.fbc || eventData.fbc || (eventData.attribution ? eventData.attribution.fbc : '');
}
if (rawFbc && makeString(rawFbc).indexOf('fb.') === 0) {
  finalUserData.fbc = cleanString(rawFbc);
}

// Handle Meta Browser ID (fbp) - NEVER HASH
let rawFbp = '';
if (data.userDataMode === 'MANUAL' && data.manualFbp) {
  rawFbp = data.manualFbp;
} else {
  rawFbp = rawUserData.fbp || eventData.fbp || (eventData.attribution ? eventData.attribution.fbp : '');
}
if (rawFbp && makeString(rawFbp).indexOf('fb.') === 0) {
  finalUserData.fbp = cleanString(rawFbp);
}

// Handle Meta Lead ID - NEVER HASH
const rawLeadId = rawUserData.lead_id || eventData.lead_id || '';
if (rawLeadId) {
  finalUserData.lead_id = makeString(rawLeadId);
}

// Handle First & Last Name
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

// Handle City, State, Zip, Country
const rawCt = rawUserData.ct || (rawUserData.address ? rawUserData.address.city : '') || '';
if (rawCt) {
  const hashedCt = hashString(rawCt);
  if (hashedCt) finalUserData.ct = [hashedCt];
}
const rawSt = rawUserData.st || (rawUserData.address ? rawUserData.address.region : '') || '';
if (rawSt) {
  const hashedSt = hashString(rawSt);
  if (hashedSt) finalUserData.st = [hashedSt];
}
const rawZp = rawUserData.zp || (rawUserData.address ? rawUserData.address.postal_code : '') || '';
if (rawZp) {
  const hashedZp = hashString(rawZp);
  if (hashedZp) finalUserData.zp = [hashedZp];
}
const rawCountry = rawUserData.country || (rawUserData.address ? rawUserData.address.country : '') || '';
if (rawCountry) {
  const hashedCountry = hashString(rawCountry);
  if (hashedCountry) finalUserData.country = [hashedCountry];
}

// 7. Build Conversion Financial Parameters (custom_data)
const finalCustomData = {};
if (data.enableCustomData !== false) {
  const valSource = isValidValue(data.conversionValue) ? data.conversionValue : eventData.value;
  const numVal = toFiniteNumber(valSource);
  if (numVal !== undefined && numVal > 0) {
    finalCustomData.value = numVal;
  } else if (targetEventName === 'Purchase') {
    finalCustomData.value = 0;
  }
  
  const curSource = data.currencyCode || eventData.currency || 'USD';
  if (curSource) {
    finalCustomData.currency = cleanString(curSource).toUpperCase();
  }
  
  const ordSource = data.orderId || eventData.order_id || eventData.transaction_id || resolvedEventId;
  if (ordSource) {
    finalCustomData.order_id = makeString(ordSource);
  }
  
  if (data.contentCategory) {
    finalCustomData.content_category = data.contentCategory;
  }
}

// 8. Assemble Meta Graph API Event Payload
const singleEvent = {
  event_name: targetEventName,
  event_time: eventTime,
  action_source: resolvedActionSource,
  user_data: finalUserData
};

if (resolvedEventId) {
  singleEvent.event_id = resolvedEventId;
}

if (eventData.event_source_url) {
  singleEvent.event_source_url = eventData.event_source_url;
}

if (data.enableCustomData !== false && (finalCustomData.value !== undefined || finalCustomData.order_id || targetEventName === 'Purchase')) {
  singleEvent.custom_data = finalCustomData;
}

const payload = {
  data: [singleEvent]
};

if (testEventCode) {
  payload.test_event_code = cleanString(testEventCode);
}

// 9. Dispatch to Meta Graph API v21.0
const requestUrl = apiEndpoint + '/' + apiVersion + '/' + encodeUriComponent(datasetId) + '/events?access_token=' + encodeUriComponent(accessToken) + (testEventCode ? '&test_event_code=' + encodeUriComponent(testEventCode) : '');
const postBody = JSON.stringify(payload);

sendHttpRequest(requestUrl, {
  method: 'POST',
  headers: {
    'content-type': 'application/json'
  },
  timeout: 5000
}, postBody)
  .then((res) => {
    if (res.statusCode >= 200 && res.statusCode < 300) {
      data.gtmOnSuccess();
    } else {
      data.gtmOnFailure();
    }
  })
  .catch((err) => {
    data.gtmOnFailure();
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
            "string": "any"
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
  - Enterprise Meta CRM Offline Conversions Tag Template for Server-Side GTM.
  - HubSpot CRM lifecycle stages, deal stages, and meeting booked auto-mapping.
  - Zero DOM scraping, authoritative backend data ingestion.
  - Compliant with Meta Graph API v21.0 CRM offline conversion specifications.
  - Applied robust Sandboxed JS patterns (isValidValue, isHashed, toFiniteNumber, normalizePhoneNumber).
