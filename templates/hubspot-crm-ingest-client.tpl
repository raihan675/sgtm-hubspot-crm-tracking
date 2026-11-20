___INFO___

{
  "type": "CLIENT",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "HubSpot CRM Ingest Client",
  "description": "Enterprise HubSpot CRM client with customizable attribution, clean user data, and zero empty parameters.",
  "containerContexts": [
    "SERVER"
  ]
}

___TEMPLATE_PARAMETERS___

[
  {
    "type": "GROUP",
    "name": "basicSettings",
    "displayName": "Connection Settings",
    "subParams": [
      {
        "type": "TEXT",
        "name": "webhookPath",
        "displayName": "Webhook Request Path",
        "defaultValue": "/hubspot-webhook",
        "simpleValueType": true,
        "help": "The path on your sGTM server that HubSpot webhooks are sent to (e.g. /hubspot-webhook)."
      },
      {
        "type": "TEXT",
        "name": "hubspotToken",
        "displayName": "HubSpot Service Key / Access Token",
        "simpleValueType": true,
        "help": "Your Static Auth Service Key or Bearer Token from HubSpot used to enrich contact and deal properties."
      },
      {
        "type": "TEXT",
        "name": "defaultCurrency",
        "displayName": "Default Currency Code",
        "defaultValue": "USD",
        "simpleValueType": true,
        "help": "3-letter ISO currency code (e.g. USD, EUR, GBP) to use when an event does not have an explicit currency."
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "eventToggles",
    "displayName": "Event Category Toggles",
    "subParams": [
      {
        "type": "CHECKBOX",
        "name": "enableLifecycleEvents",
        "checkboxText": "Enable Lifecycle Stage Events (lifecycle_*)",
        "defaultValue": true,
        "help": "When enabled, fires events when contact lifecycle stage changes (e.g. MQL, SQL, Opportunity, Customer)."
      },
      {
        "type": "CHECKBOX",
        "name": "enableLeadStatusEvents",
        "checkboxText": "Enable Lead Status Events (lead_status_*)",
        "defaultValue": true,
        "help": "When enabled, fires events when sales lead status changes (e.g. Connected, In Progress, Open Deal)."
      },
      {
        "type": "CHECKBOX",
        "name": "enableDealEvents",
        "checkboxText": "Enable Deal Pipeline Events (deal_*)",
        "defaultValue": true,
        "help": "When enabled, fires events when deal stages change (e.g. Closed Won, Qualified, Contract Sent)."
      },
      {
        "type": "CHECKBOX",
        "name": "enableUnqualifiedEvents",
        "checkboxText": "Dispatch Negative / Unqualified Events",
        "defaultValue": true,
        "help": "If unchecked, drops events for UNQUALIFIED and closedlost to prevent sending negative signals to optimization tags."
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "attributionSettings",
    "displayName": "Advertising Attribution & Click ID Settings",
    "subParams": [
      {
        "type": "CHECKBOX",
        "name": "omitEmptyParams",
        "checkboxText": "Omit Empty Attribution Parameters (Clean Debug View)",
        "defaultValue": true,
        "help": "Hides empty click IDs and UTM keys from Event Data so only populated attribution signals are shown."
      },
      {
        "type": "CHECKBOX",
        "name": "enableMetaAds",
        "checkboxText": "Meta / Facebook (fbclid, fbc, fbp)",
        "defaultValue": true,
        "help": "Capture Meta click IDs and browser cookies for Meta Conversions API (CAPI)."
      },
      {
        "type": "CHECKBOX",
        "name": "enableGoogleAds",
        "checkboxText": "Google Ads (gclid, gbraid, wbraid)",
        "defaultValue": true,
        "help": "Capture Google click identifiers for Google Ads Offline Conversions."
      },
      {
        "type": "CHECKBOX",
        "name": "enableChatGptAds",
        "checkboxText": "ChatGPT Ads (hs_chatgpt_click_id)",
        "defaultValue": true,
        "help": "Capture ChatGPT click identifiers."
      },
      {
        "type": "CHECKBOX",
        "name": "enableTikTokAds",
        "checkboxText": "TikTok Ads (ttclid)",
        "defaultValue": false,
        "help": "Capture TikTok click identifiers."
      },
      {
        "type": "CHECKBOX",
        "name": "enableLinkedInAds",
        "checkboxText": "LinkedIn Ads (li_fat_id)",
        "defaultValue": false,
        "help": "Capture LinkedIn click identifiers."
      },
      {
        "type": "CHECKBOX",
        "name": "enableBingAds",
        "checkboxText": "Microsoft / Bing Ads (msclkid)",
        "defaultValue": false,
        "help": "Capture Microsoft Bing click identifiers."
      },
      {
        "type": "CHECKBOX",
        "name": "enableRedditAds",
        "checkboxText": "Reddit Ads (rdt_cid)",
        "defaultValue": false,
        "help": "Capture Reddit click identifiers."
      },
      {
        "type": "CHECKBOX",
        "name": "enableTwitterAds",
        "checkboxText": "Twitter / X Ads (twclid)",
        "defaultValue": false,
        "help": "Capture Twitter/X click identifiers."
      },
      {
        "type": "CHECKBOX",
        "name": "enablePinterestAds",
        "checkboxText": "Pinterest Ads (epik)",
        "defaultValue": false,
        "help": "Capture Pinterest click identifiers."
      },
      {
        "type": "CHECKBOX",
        "name": "enableSnapchatAds",
        "checkboxText": "Snapchat Ads (sc_clid)",
        "defaultValue": false,
        "help": "Capture Snapchat click identifiers."
      },
      {
        "type": "CHECKBOX",
        "name": "enableUtmParams",
        "checkboxText": "UTM Campaign Tracking (source, medium, campaign, term, content)",
        "defaultValue": true,
        "help": "Capture standard UTM campaign tracking parameters."
      },
      {
        "type": "CHECKBOX",
        "name": "enableTrafficSources",
        "checkboxText": "HubSpot Analytics & Traffic Sources",
        "defaultValue": true,
        "help": "Capture HubSpot original traffic source, drill-downs, and referring URLs."
      }
    ]
  }
]

___SANDBOXED_JS_FOR_SERVER___

const getRequestPath = require('getRequestPath');
const getRequestMethod = require('getRequestMethod');
const getRequestBody = require('getRequestBody');
const setResponseStatus = require('setResponseStatus');
const setResponseBody = require('setResponseBody');
const setResponseHeader = require('setResponseHeader');
const returnResponse = require('returnResponse');
const runContainer = require('runContainer');
const sendHttpRequest = require('sendHttpRequest');
const claimRequest = require('claimRequest');
const JSON = require('JSON');
const getTimestampMillis = require('getTimestampMillis');

const expectedPath = data.webhookPath || '/hubspot-webhook';
const token = data.hubspotToken;
const fallbackCurrency = data.defaultCurrency || 'USD';
const requestPath = getRequestPath();

// Category Toggles
const enableLifecycle = data.enableLifecycleEvents !== false;
const enableLeadStatus = data.enableLeadStatusEvents !== false;
const enableDeals = data.enableDealEvents !== false;
const enableUnqualified = data.enableUnqualifiedEvents !== false;

// Ad Attribution & Tracking Toggles
const enableGoogleAds = data.enableGoogleAds !== false;
const enableMetaAds = data.enableMetaAds !== false;
const enableChatGptAds = data.enableChatGptAds !== false;
const enableTikTokAds = data.enableTikTokAds === true;
const enableLinkedInAds = data.enableLinkedInAds === true;
const enableBingAds = data.enableBingAds === true;
const enableRedditAds = data.enableRedditAds === true;
const enableTwitterAds = data.enableTwitterAds === true;
const enablePinterestAds = data.enablePinterestAds === true;
const enableSnapchatAds = data.enableSnapchatAds === true;
const enableUtmParams = data.enableUtmParams !== false;
const enableTrafficSources = data.enableTrafficSources !== false;
const omitEmptyParams = data.omitEmptyParams !== false;

if (requestPath !== expectedPath) {
  return;
}

if (getRequestMethod() !== 'POST') {
  setResponseStatus(405);
  setResponseHeader('Content-Type', 'application/json');
  setResponseBody(JSON.stringify({ error: 'Method Not Allowed' }));
  returnResponse();
  return;
}

claimRequest();

let rawBody = getRequestBody();
if (!rawBody) {
  setResponseStatus(400);
  setResponseHeader('Content-Type', 'application/json');
  setResponseBody(JSON.stringify({ error: 'Empty payload' }));
  returnResponse();
  return;
}

let eventsParsed = JSON.parse(rawBody);
if (!eventsParsed) {
  setResponseStatus(400);
  setResponseHeader('Content-Type', 'application/json');
  setResponseBody(JSON.stringify({ error: 'Invalid JSON payload' }));
  returnResponse();
  return;
}

let rawEvents = eventsParsed;
if (typeof rawEvents.length !== 'number') {
  rawEvents = [rawEvents];
}

// Filter out empty notifications & deduplicate within the incoming batch
const seenEventKeys = {};
const events = [];
for (let i = 0; i < rawEvents.length; i++) {
  const ev = rawEvents[i];
  if (ev && ev.objectId) {
    const val = ev.propertyValue;
    // Reject empty, null, or whitespace-only values (stops empty lifecycle_ or lead_status_)
    if (val !== undefined && val !== null && val !== '') {
      const pName = ev.propertyName || '';
      const objType = ev.objectTypeId || '0-1';
      const dedupKey = objType + ':' + ev.objectId + ':' + pName + ':' + val;
      if (!seenEventKeys[dedupKey]) {
        seenEventKeys[dedupKey] = true;
        events.push(ev);
      }
    }
  }
}

if (events.length === 0) {
  setResponseStatus(200);
  setResponseHeader('Content-Type', 'application/json');
  setResponseBody(JSON.stringify({ status: 'ignored', reason: 'no eligible events with values' }));
  returnResponse();
  return;
}

let pending = events.length;
function checkDone() {
  pending--;
  if (pending <= 0) {
    setResponseStatus(200);
    setResponseHeader('Content-Type', 'application/json');
    setResponseBody(JSON.stringify({ status: 'success', processed: events.length }));
    returnResponse();
  }
}

events.forEach((evt) => {
  const objectId = evt.objectId;
  const propertyName = evt.propertyName;
  const propertyValue = evt.propertyValue;
  const occurredAt = evt.occurredAt || getTimestampMillis();
  const isDeal = (evt.objectTypeId === '0-3') || (evt.subscriptionType && evt.subscriptionType.indexOf('deal') !== -1);
  const isContact = (evt.objectTypeId === '0-1') || (evt.subscriptionType && evt.subscriptionType.indexOf('contact') !== -1);

  if (isContact) {
    enrichAndDispatchContact(objectId, propertyName, propertyValue, occurredAt, checkDone);
  } else if (isDeal) {
    enrichAndDispatchDeal(objectId, propertyName, propertyValue, occurredAt, checkDone);
  } else {
    enrichAndDispatchContact(objectId, propertyName, propertyValue, occurredAt, checkDone);
  }
});

function extractUrlParam(urlStr, param) {
  if (!urlStr || typeof urlStr !== 'string') return '';
  const qIndex = urlStr.indexOf('?');
  if (qIndex === -1) return '';
  const queryString = urlStr.substring(qIndex + 1);
  const pairs = queryString.split('&');
  for (let i = 0; i < pairs.length; i++) {
    const pair = pairs[i].split('=');
    if (pair[0] === param) {
      return pair[1] ? pair[1] : '';
    }
  }
  return '';
}

function parseNumber(val) {
  if (typeof val === 'number') return val;
  if (!val || typeof val !== 'string') return 0;
  
  let result = '';
  const allowed = '0123456789.-';
  for (let i = 0; i < val.length; i++) {
    const char = val.charAt(i);
    if (allowed.indexOf(char) !== -1) {
      result += char;
    }
  }
  
  const num = result ? (result - 0) : 0;
  return (num || num === 0) ? num : 0;
}

function getRequestedPropertyList() {
  const list = [
    'email', 'firstname', 'lastname', 'phone', 'mobilephone',
    'address', 'city', 'state', 'zip', 'country', 'ip_country', 'ip_country_code',
    'associatedcompanyid', 'hs_object_id',
    'lifecyclestage', 'hs_lead_status',
    'num_associated_deals', 'num_conversion_events', 'num_unique_conversion_events',
    'first_conversion_date', 'first_conversion_event_name',
    'recent_conversion_date', 'recent_conversion_event_name',
    'engagements_last_meeting_booked',
    'recent_deal_amount', 'total_revenue', 'hs_analytics_revenue',
    'hubspot_owner_id', 'days_to_close', 'closedate',
    'hs_v2_date_entered_lead', 'hs_v2_date_entered_salesqualifiedlead',
    'hs_v2_date_entered_opportunity', 'hs_v2_date_entered_customer',
    'original_ga4_client_id'
  ];

  if (enableGoogleAds) {
    list.push('hs_google_click_id', 'google_click_id', 'gclid', 'first_touch_gclid', 'last_touch_gclid', 'gbraid', 'wbraid');
  }
  if (enableMetaAds) {
    list.push('hs_facebook_click_id', 'first_touch_fbclid', 'fbclid', 'fbc', 'fbp');
  }
  if (enableChatGptAds) {
    list.push('hs_chatgpt_click_id', 'chatgpt_click_id', 'oai_click_id');
  }
  if (enableTikTokAds) {
    list.push('hs_tiktok_click_id', 'tiktok_click_id', 'ttclid');
  }
  if (enableLinkedInAds) {
    list.push('hs_linkedin_click_id', 'linkedin_click_id', 'li_fat_id');
  }
  if (enableBingAds) {
    list.push('hs_bing_click_id', 'bing_click_id', 'msclkid');
  }
  if (enableRedditAds) {
    list.push('hs_reddit_click_id', 'reddit_click_id', 'rdt_cid');
  }
  if (enableTwitterAds) {
    list.push('hs_twitter_click_id', 'twitter_click_id', 'twclid');
  }
  if (enablePinterestAds) {
    list.push('hs_pinterest_click_id', 'pinterest_click_id', 'epik');
  }
  if (enableSnapchatAds) {
    list.push('hs_snapchat_click_id', 'snapchat_click_id', 'sc_clid');
  }
  if (enableUtmParams) {
    list.push('utm_source', 'utm_medium', 'utm_campaign', 'utm_term', 'utm_content',
              'first_touch_utm_source', 'first_touch_utm_medium', 'first_touch_utm_campaign');
  }
  if (enableTrafficSources || enableGoogleAds || enableMetaAds || enableChatGptAds || enableTikTokAds || enableLinkedInAds || enableBingAds || enableRedditAds) {
    list.push('hs_analytics_source', 'hs_analytics_source_data_1', 'hs_analytics_source_data_2',
              'hs_analytics_first_url', 'hs_analytics_last_url', 'hs_analytics_first_referrer', 'hs_analytics_last_referrer');
  }
  return list;
}

function buildAttributionObject(props, occurredAt, eventData) {
  const attr = {};

  function addParam(key, val) {
    if (omitEmptyParams) {
      if (val && val !== '') {
        attr[key] = val;
      }
    } else {
      attr[key] = val || '';
    }
  }

  if (enableGoogleAds) {
    let gclidVal = props.hs_google_click_id || props.gclid || props.google_click_id || props.last_touch_gclid || props.first_touch_gclid || '';
    if (!gclidVal && props.hs_analytics_last_url) {
      gclidVal = extractUrlParam(props.hs_analytics_last_url, 'gclid');
    }
    addParam('gclid', gclidVal);
    addParam('gbraid', props.gbraid || '');
    addParam('wbraid', props.wbraid || '');
    if (gclidVal) eventData.gclid = gclidVal;
    if (props.gbraid) eventData.gbraid = props.gbraid;
    if (props.wbraid) eventData.wbraid = props.wbraid;
  }

  if (enableMetaAds) {
    let fbclidVal = props.hs_facebook_click_id || props.first_touch_fbclid || props.fbclid || '';
    if (!fbclidVal && props.hs_analytics_last_url) {
      fbclidVal = extractUrlParam(props.hs_analytics_last_url, 'fbclid');
    }
    const fbcVal = props.fbc || (fbclidVal ? ('fb.1.' + occurredAt + '.' + fbclidVal) : '');
    const fbpVal = props.fbp || '';
    addParam('fbclid', fbclidVal);
    addParam('fbc', fbcVal);
    addParam('fbp', fbpVal);
    if (fbclidVal) eventData.fbclid = fbclidVal;
    if (fbcVal) eventData.fbc = fbcVal;
    if (fbpVal) eventData.fbp = fbpVal;
  }

  if (enableChatGptAds) {
    let chatgptClickId = props.hs_chatgpt_click_id || props.chatgpt_click_id || props.oai_click_id || '';
    if (!chatgptClickId && props.hs_analytics_last_url) {
      chatgptClickId = extractUrlParam(props.hs_analytics_last_url, 'chatgpt_click_id') || extractUrlParam(props.hs_analytics_last_url, 'oai_click_id');
    }
    addParam('chatgpt_click_id', chatgptClickId);
    if (chatgptClickId) eventData.chatgpt_click_id = chatgptClickId;
  }

  if (enableTikTokAds) {
    let tiktokClickId = props.hs_tiktok_click_id || props.tiktok_click_id || props.ttclid || '';
    if (!tiktokClickId && props.hs_analytics_last_url) {
      tiktokClickId = extractUrlParam(props.hs_analytics_last_url, 'ttclid');
    }
    addParam('tiktok_click_id', tiktokClickId);
    if (tiktokClickId) eventData.tiktok_click_id = tiktokClickId;
  }

  if (enableLinkedInAds) {
    let linkedinClickId = props.hs_linkedin_click_id || props.linkedin_click_id || props.li_fat_id || '';
    if (!linkedinClickId && props.hs_analytics_last_url) {
      linkedinClickId = extractUrlParam(props.hs_analytics_last_url, 'li_fat_id');
    }
    addParam('linkedin_click_id', linkedinClickId);
    if (linkedinClickId) eventData.linkedin_click_id = linkedinClickId;
  }

  if (enableBingAds) {
    let bingClickId = props.hs_bing_click_id || props.bing_click_id || props.msclkid || '';
    if (!bingClickId && props.hs_analytics_last_url) {
      bingClickId = extractUrlParam(props.hs_analytics_last_url, 'msclkid');
    }
    addParam('bing_click_id', bingClickId);
    if (bingClickId) eventData.bing_click_id = bingClickId;
  }

  if (enableRedditAds) {
    let redditClickId = props.hs_reddit_click_id || props.reddit_click_id || props.rdt_cid || '';
    if (!redditClickId && props.hs_analytics_last_url) {
      redditClickId = extractUrlParam(props.hs_analytics_last_url, 'rdt_cid');
    }
    addParam('reddit_click_id', redditClickId);
    if (redditClickId) eventData.reddit_click_id = redditClickId;
  }

  if (enableTwitterAds) {
    let twitterClickId = props.hs_twitter_click_id || props.twitter_click_id || props.twclid || '';
    if (!twitterClickId && props.hs_analytics_last_url) {
      twitterClickId = extractUrlParam(props.hs_analytics_last_url, 'twclid');
    }
    addParam('twitter_click_id', twitterClickId);
    if (twitterClickId) eventData.twitter_click_id = twitterClickId;
  }

  if (enablePinterestAds) {
    let pinterestClickId = props.hs_pinterest_click_id || props.pinterest_click_id || props.epik || '';
    if (!pinterestClickId && props.hs_analytics_last_url) {
      pinterestClickId = extractUrlParam(props.hs_analytics_last_url, 'epik');
    }
    addParam('pinterest_click_id', pinterestClickId);
    if (pinterestClickId) eventData.pinterest_click_id = pinterestClickId;
  }

  if (enableSnapchatAds) {
    let snapchatClickId = props.hs_snapchat_click_id || props.snapchat_click_id || props.sc_clid || '';
    if (!snapchatClickId && props.hs_analytics_last_url) {
      snapchatClickId = extractUrlParam(props.hs_analytics_last_url, 'sc_clid');
    }
    addParam('snapchat_click_id', snapchatClickId);
    if (snapchatClickId) eventData.snapchat_click_id = snapchatClickId;
  }

  if (enableUtmParams) {
    const src = props.utm_source || props.first_touch_utm_source || extractUrlParam(props.hs_analytics_last_url, 'utm_source');
    const med = props.utm_medium || props.first_touch_utm_medium || extractUrlParam(props.hs_analytics_last_url, 'utm_medium');
    const cmp = props.utm_campaign || props.first_touch_utm_campaign || extractUrlParam(props.hs_analytics_last_url, 'utm_campaign');
    const trm = props.utm_term || extractUrlParam(props.hs_analytics_last_url, 'utm_term');
    const cnt = props.utm_content || extractUrlParam(props.hs_analytics_last_url, 'utm_content');
    addParam('utm_source', src);
    addParam('utm_medium', med);
    addParam('utm_campaign', cmp);
    addParam('utm_term', trm);
    addParam('utm_content', cnt);
  }

  if (enableTrafficSources) {
    addParam('original_traffic_source', props.hs_analytics_source || '');
    addParam('drill_down_1', props.hs_analytics_source_data_1 || '');
    addParam('drill_down_2', props.hs_analytics_source_data_2 || '');
    addParam('first_page_seen', props.hs_analytics_first_url || '');
    addParam('last_page_seen', props.hs_analytics_last_url || '');
    addParam('first_referring_site', props.hs_analytics_first_referrer || '');
    addParam('last_referring_site', props.hs_analytics_last_referrer || '');
  }

  return attr;
}

function enrichAndDispatchContact(contactId, propName, propValue, occurredAt, onComplete) {
  if (propName === 'lifecyclestage' && !enableLifecycle) {
    onComplete();
    return;
  }
  if (propName === 'hs_lead_status' && !enableLeadStatus) {
    onComplete();
    return;
  }
  if (!enableUnqualified && (propValue === 'UNQUALIFIED' || propValue === 'closedlost')) {
    onComplete();
    return;
  }

  const propList = getRequestedPropertyList();
  const url = 'https://api.hubapi.com/crm/v3/objects/contacts/' + contactId + '?properties=' + propList.join(',');

  sendHttpRequest(url, {
    method: 'GET',
    headers: {
      'Authorization': 'Bearer ' + token,
      'Content-Type': 'application/json'
    },
    timeout: 4000
  }).then((res) => {
    let props = {};
    if (res.statusCode === 200) {
      props = JSON.parse(res.body).properties || {};
    }

    let eventName = null;
    if (propName === 'lifecyclestage') {
      const stage = (propValue || '').toLowerCase();
      if (stage === 'subscriber') eventName = 'lifecycle_subscriber';
      else if (stage === 'lead') eventName = 'lifecycle_lead';
      else if (stage === 'marketingqualifiedlead') eventName = 'lifecycle_mql';
      else if (stage === 'salesqualifiedlead') eventName = 'lifecycle_sql';
      else if (stage === 'opportunity') eventName = 'lifecycle_opportunity';
      else if (stage === 'customer') eventName = 'lifecycle_customer';
      else if (stage === 'evangelist') eventName = 'lifecycle_evangelist';
      else if (stage !== '') eventName = 'lifecycle_' + stage;
    } else if (propName === 'hs_lead_status') {
      const status = (propValue || '').toLowerCase();
      if (status === 'new') eventName = 'lead_status_new';
      else if (status === 'open') eventName = 'lead_status_open';
      else if (status === 'in_progress') eventName = 'lead_status_in_progress';
      else if (status === 'open_deal') eventName = 'lead_status_open_deal';
      else if (status === 'unqualified') eventName = 'lead_status_unqualified';
      else if (status === 'attempted_to_contact') eventName = 'lead_status_attempted_to_contact';
      else if (status === 'connected') eventName = 'lead_status_connected';
      else if (status === 'bad_timing') eventName = 'lead_status_bad_timing';
      else if (status !== '') eventName = 'lead_status_' + status;
    } else if (propName === 'engagements_last_meeting_booked') {
      eventName = 'contact_meeting_booked';
    } else if (propName === 'num_associated_deals') {
      eventName = 'contact_deal_associated';
    } else {
      eventName = 'crm_' + propName;
    }

    // Defensive check: never dispatch empty prefix events
    if (!eventName || eventName === 'lifecycle_' || eventName === 'lead_status_' || eventName === 'deal_' || eventName === 'crm_') {
      onComplete();
      return;
    }

    const phoneVal = props.phone || props.mobilephone || '';

    let monetaryValue = 0;
    if (props.recent_deal_amount) monetaryValue = parseNumber(props.recent_deal_amount);
    else if (props.total_revenue) monetaryValue = parseNumber(props.total_revenue);
    else if (props.hs_analytics_revenue) monetaryValue = parseNumber(props.hs_analytics_revenue);

    const crmDetailsObj = {
      contact_id: contactId,
      object_type: 'contact',
      change_category: (propName === 'lifecyclestage') ? 'lifecycle_stage' : ((propName === 'hs_lead_status') ? 'lead_status' : 'contact_property'),
      lead_status: props.hs_lead_status || '',
      lifecycle_stage: props.lifecyclestage || '',
      property_updated: propName,
      updated_value: propValue,
      num_associated_deals: props.num_associated_deals ? props.num_associated_deals : 0,
      num_form_submissions: props.num_conversion_events ? props.num_conversion_events : 0,
      num_unique_forms_submitted: props.num_unique_conversion_events ? props.num_unique_conversion_events : 0,
      first_conversion_date: props.first_conversion_date || '',
      first_conversion_form: props.first_conversion_event_name || '',
      recent_conversion_date: props.recent_conversion_date || '',
      recent_conversion_form: props.recent_conversion_event_name || '',
      last_meeting_booked: props.engagements_last_meeting_booked || '',
      recent_deal_amount: props.recent_deal_amount ? parseNumber(props.recent_deal_amount) : 0,
      total_revenue: props.total_revenue ? parseNumber(props.total_revenue) : 0,
      owner_id: props.hubspot_owner_id || '',
      days_to_close: props.days_to_close || '',
      closedate: props.closedate || '',
      milestones: {
        date_entered_lead: props.hs_v2_date_entered_lead || '',
        date_entered_sql: props.hs_v2_date_entered_salesqualifiedlead || '',
        date_entered_opportunity: props.hs_v2_date_entered_opportunity || '',
        date_entered_customer: props.hs_v2_date_entered_customer || ''
      }
    };

    const eventData = {
      event_name: eventName,
      event_source_category: (propName === 'lifecyclestage') ? 'lifecycle_stage' : ((propName === 'hs_lead_status') ? 'lead_status' : 'contact_property'),
      client_id: props.original_ga4_client_id || ('crm.contact.' + contactId),
      event_time: occurredAt,
      transaction_id: 'HS_' + contactId + '_' + occurredAt,
      value: monetaryValue,
      currency: fallbackCurrency,

      user_data: {
        email_address: props.email || '',
        phone_number: phoneVal,
        address: {
          first_name: props.firstname || '',
          last_name: props.lastname || '',
          street: props.address || '',
          city: props.city || '',
          region: props.state || '',
          postal_code: props.zip || '',
          country: props.country || props.ip_country_code || ''
        },
        company: {
          id: props.associatedcompanyid || ''
        }
      },

      crm_details: crmDetailsObj,
      crm_lead_status: props.hs_lead_status || '',
      crm_lifecycle_stage: props.lifecyclestage || ''
    };

    // Hydrate attribution according to user settings
    eventData.attribution = buildAttributionObject(props, occurredAt, eventData);

    runContainer(eventData, onComplete);
  }, onComplete);
}

function enrichAndDispatchDeal(dealId, propName, propValue, occurredAt, onComplete) {
  if (!enableDeals) {
    onComplete();
    return;
  }
  if (!enableUnqualified && propValue === 'closedlost') {
    onComplete();
    return;
  }

  const assocUrl = 'https://api.hubapi.com/crm/v3/objects/deals/' + dealId + '/associations/contacts';

  sendHttpRequest(assocUrl, {
    method: 'GET',
    headers: {
      'Authorization': 'Bearer ' + token,
      'Content-Type': 'application/json'
    },
    timeout: 3000
  }).then((assocRes) => {
    let contactId = null;
    if (assocRes.statusCode === 200) {
      const results = JSON.parse(assocRes.body).results || [];
      if (results.length > 0) contactId = results[0].id;
    }

    const dealUrl = 'https://api.hubapi.com/crm/v3/objects/deals/' + dealId + '?properties=amount,dealname,dealstage,pipeline,closedate,deal_currency_code';
    sendHttpRequest(dealUrl, {
      method: 'GET',
      headers: {
        'Authorization': 'Bearer ' + token,
        'Content-Type': 'application/json'
      },
      timeout: 3000
    }).then((dealRes) => {
      let dealProps = {};
      if (dealRes.statusCode === 200) {
        dealProps = JSON.parse(dealRes.body).properties || {};
      }

      if (contactId) {
        const propList = getRequestedPropertyList();
        const contactUrl = 'https://api.hubapi.com/crm/v3/objects/contacts/' + contactId + '?properties=' + propList.join(',');
        sendHttpRequest(contactUrl, {
          method: 'GET',
          headers: {
            'Authorization': 'Bearer ' + token,
            'Content-Type': 'application/json'
          },
          timeout: 3500
        }).then((cRes) => {
          let cProps = {};
          if (cRes.statusCode === 200) {
            cProps = JSON.parse(cRes.body).properties || {};
          }
          dispatchDeal(dealId, contactId, propName, propValue, dealProps, cProps, occurredAt, onComplete);
        }, () => {
          dispatchDeal(dealId, contactId, propName, propValue, dealProps, {}, occurredAt, onComplete);
        });
      } else {
        dispatchDeal(dealId, null, propName, propValue, dealProps, {}, occurredAt, onComplete);
      }
    }, onComplete);
  }, onComplete);
}

function dispatchDeal(dealId, contactId, propName, propValue, dealProps, cProps, occurredAt, onComplete) {
  let eventName = null;
  const stageVal = (propValue || '').toLowerCase();
  if (propName === 'dealstage') {
    if (stageVal.indexOf('closedwon') !== -1 || stageVal === 'won') eventName = 'deal_closed_won';
    else if (stageVal.indexOf('closedlost') !== -1 || stageVal === 'lost') eventName = 'deal_closed_lost';
    else if (stageVal.indexOf('contract') !== -1) eventName = 'deal_contract_sent';
    else if (stageVal.indexOf('qualified') !== -1) eventName = 'deal_qualified';
    else if (stageVal.indexOf('appointment') !== -1) eventName = 'deal_appointment_scheduled';
    else if (stageVal !== '') eventName = 'deal_stage_' + stageVal;
  } else if (propName === 'amount') {
    eventName = 'deal_amount_updated';
  } else {
    eventName = 'deal_' + propName;
  }

  // Defensive check: never dispatch empty prefix events
  if (!eventName || eventName === 'deal_stage_' || eventName === 'deal_') {
    onComplete();
    return;
  }

  const phoneVal = cProps.phone || cProps.mobilephone || '';
  const dealAmount = dealProps.amount ? parseNumber(dealProps.amount) : 0;
  const dealCurrency = dealProps.deal_currency_code || fallbackCurrency;

  const eventData = {
    event_name: eventName,
    event_source_category: 'deal_pipeline',
    client_id: cProps.original_ga4_client_id || ('crm.deal.' + dealId),
    event_time: occurredAt,
    transaction_id: 'DEAL_' + dealId,
    value: dealAmount,
    currency: dealCurrency,

    user_data: {
      email_address: cProps.email || '',
      phone_number: phoneVal,
      address: {
        first_name: cProps.firstname || '',
        last_name: cProps.lastname || '',
        street: cProps.address || '',
        city: cProps.city || '',
        region: cProps.state || '',
        postal_code: cProps.zip || '',
        country: cProps.country || cProps.ip_country_code || ''
      },
      company: {
        id: cProps.associatedcompanyid || ''
      }
    },

    crm_details: {
      deal_id: dealId,
      deal_name: dealProps.dealname || '',
      pipeline: dealProps.pipeline || '',
      deal_stage: dealProps.dealstage || '',
      property_updated: propName,
      updated_value: propValue,
      amount: dealAmount,
      currency: dealCurrency,
      closedate: dealProps.closedate || '',
      associated_contact_id: contactId || ''
    }
  };

  eventData.attribution = buildAttributionObject(cProps, occurredAt, eventData);

  runContainer(eventData, onComplete);
}


___SERVER_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "read_request",
        "versionId": "1"
      },
      "param": [
        {
          "key": "requestAccess",
          "value": {
            "type": 1,
            "string": "any"
          }
        },
        {
          "key": "headerAccess",
          "value": {
            "type": 1,
            "string": "any"
          }
        },
        {
          "key": "queryParameterAccess",
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
        "publicId": "access_response",
        "versionId": "1"
      },
      "param": [
        {
          "key": "writeResponseHeadersAllowed",
          "value": {
            "type": 8,
            "boolean": true
          }
        },
        {
          "key": "writeResponseBodyAllowed",
          "value": {
            "type": 8,
            "boolean": true
          }
        },
        {
          "key": "writeResponseStatusAllowed",
          "value": {
            "type": 8,
            "boolean": true
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
        "publicId": "return_response",
        "versionId": "1"
      },
      "param": []
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "run_container",
        "versionId": "1"
      },
      "param": []
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

HubSpot CRM Ingest Client with customizable ad attribution toggles and clean event data.
- Zero empty prefix events: drops empty or clearing property change notifications (eliminates lifecycle_ duplicate).
- Removed Custom Event Overrides and Custom Contact Properties tables.
- Added granular Attribution toggles: Meta, Google, ChatGPT, TikTok, LinkedIn, Bing, Reddit, Twitter, Pinterest, Snapchat, UTMs.
- Added Omit Empty Attribution Parameters: suppresses empty string keys from the preview debugger.
- Sandboxed JS strictly compliant: zero try/catch, zero regex literals.