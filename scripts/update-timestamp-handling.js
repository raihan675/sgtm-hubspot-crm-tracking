const fs = require('fs');
const path = require('path');

const tplPath = path.join(__dirname, '..', 'templates', 'hubspot-crm-ingest-client.tpl');
let content = fs.readFileSync(tplPath, 'utf8');

// 1. Update events.forEach & helpers
const oldEventsLoop = `events.forEach((evt) => {
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
});`;

const newEventsLoop = `events.forEach((evt) => {
  const objectId = evt.objectId;
  const propertyName = evt.propertyName;
  const propertyValue = evt.propertyValue;

  let rawTime = parseNumber(evt.occurredAt);
  if (!rawTime || rawTime <= 0) {
    rawTime = getTimestampMillis();
  }
  let occurredAtMs = rawTime;
  let eventTimeSec = rawTime;

  if (rawTime > 9999999999) {
    // HubSpot webhook sends Unix timestamp in milliseconds (13 digits: e.g. 1795363141589)
    occurredAtMs = rawTime;
    eventTimeSec = (rawTime - (rawTime % 1000)) / 1000;
  } else {
    // If timestamp was already in seconds (10 digits: e.g. 1795363141)
    occurredAtMs = rawTime * 1000;
    eventTimeSec = rawTime - (rawTime % 1);
  }

  const isDeal = (evt.objectTypeId === '0-3') || (evt.subscriptionType && evt.subscriptionType.indexOf('deal') !== -1);
  const isContact = (evt.objectTypeId === '0-1') || (evt.subscriptionType && evt.subscriptionType.indexOf('contact') !== -1);

  if (isContact) {
    enrichAndDispatchContact(objectId, propertyName, propertyValue, eventTimeSec, occurredAtMs, checkDone);
  } else if (isDeal) {
    enrichAndDispatchDeal(objectId, propertyName, propertyValue, eventTimeSec, occurredAtMs, checkDone);
  } else {
    enrichAndDispatchContact(objectId, propertyName, propertyValue, eventTimeSec, occurredAtMs, checkDone);
  }
});`;

if (!content.includes(oldEventsLoop)) {
  console.error('ERROR: oldEventsLoop not found');
  process.exit(1);
}
content = content.replace(oldEventsLoop, newEventsLoop);

// 2. Update enrichAndDispatchContact signature & eventData
const oldContactFn = `function enrichAndDispatchContact(contactId, propName, propValue, occurredAt, onComplete) {`;
const newContactFn = `function enrichAndDispatchContact(contactId, propName, propValue, eventTimeSec, occurredAtMs, onComplete) {`;

if (!content.includes(oldContactFn)) {
  console.error('ERROR: oldContactFn not found');
  process.exit(1);
}
content = content.replace(oldContactFn, newContactFn);

const oldContactEventData = `      client_id: props.original_ga4_client_id || ('crm.contact.' + contactId),
      event_time: occurredAt,
      event_id: contactEventId,`;

const newContactEventData = `      client_id: props.original_ga4_client_id || ('crm.contact.' + contactId),
      event_time: eventTimeSec,
      event_time_seconds: eventTimeSec,
      event_time_ms: occurredAtMs,
      occurred_at: occurredAtMs,
      occurred_at_seconds: eventTimeSec,
      event_id: contactEventId,`;

if (!content.includes(oldContactEventData)) {
  console.error('ERROR: oldContactEventData not found');
  process.exit(1);
}
content = content.replace(oldContactEventData, newContactEventData);

const oldContactAttr = `eventData.attribution = buildAttributionObject(props, occurredAt, eventData);`;
const newContactAttr = `eventData.attribution = buildAttributionObject(props, occurredAtMs, eventData);`;

if (!content.includes(oldContactAttr)) {
  console.error('ERROR: oldContactAttr not found');
  process.exit(1);
}
content = content.replace(oldContactAttr, newContactAttr);

// 3. Update enrichAndDispatchDeal signature and calls
const oldDealFn = `function enrichAndDispatchDeal(dealId, propName, propValue, occurredAt, onComplete) {`;
const newDealFn = `function enrichAndDispatchDeal(dealId, propName, propValue, eventTimeSec, occurredAtMs, onComplete) {`;

if (!content.includes(oldDealFn)) {
  console.error('ERROR: oldDealFn not found');
  process.exit(1);
}
content = content.replace(oldDealFn, newDealFn);

const oldDealCalls = `          dispatchDeal(dealId, contactId, propName, propValue, dealProps, cProps, occurredAt, onComplete);
        }, () => {
          dispatchDeal(dealId, contactId, propName, propValue, dealProps, {}, occurredAt, onComplete);
        });
      } else {
        dispatchDeal(dealId, null, propName, propValue, dealProps, {}, occurredAt, onComplete);
      }`;

const newDealCalls = `          dispatchDeal(dealId, contactId, propName, propValue, dealProps, cProps, eventTimeSec, occurredAtMs, onComplete);
        }, () => {
          dispatchDeal(dealId, contactId, propName, propValue, dealProps, {}, eventTimeSec, occurredAtMs, onComplete);
        });
      } else {
        dispatchDeal(dealId, null, propName, propValue, dealProps, {}, eventTimeSec, occurredAtMs, onComplete);
      }`;

if (!content.includes(oldDealCalls)) {
  console.error('ERROR: oldDealCalls not found');
  process.exit(1);
}
content = content.replace(oldDealCalls, newDealCalls);

// 4. Update dispatchDeal signature & eventData
const oldDispatchDeal = `function dispatchDeal(dealId, contactId, propName, propValue, dealProps, cProps, occurredAt, onComplete) {`;
const newDispatchDeal = `function dispatchDeal(dealId, contactId, propName, propValue, dealProps, cProps, eventTimeSec, occurredAtMs, onComplete) {`;

if (!content.includes(oldDispatchDeal)) {
  console.error('ERROR: oldDispatchDeal not found');
  process.exit(1);
}
content = content.replace(oldDispatchDeal, newDispatchDeal);

const oldDealEventData = `    client_id: cProps.original_ga4_client_id || ('crm.deal.' + dealId),
    event_time: occurredAt,
    event_id: dealEventId,`;

const newDealEventData = `    client_id: cProps.original_ga4_client_id || ('crm.deal.' + dealId),
    event_time: eventTimeSec,
    event_time_seconds: eventTimeSec,
    event_time_ms: occurredAtMs,
    occurred_at: occurredAtMs,
    occurred_at_seconds: eventTimeSec,
    event_id: dealEventId,`;

if (!content.includes(oldDealEventData)) {
  console.error('ERROR: oldDealEventData not found');
  process.exit(1);
}
content = content.replace(oldDealEventData, newDealEventData);

const oldDealAttr = `eventData.attribution = buildAttributionObject(cProps, occurredAt, eventData);`;
const newDealAttr = `eventData.attribution = buildAttributionObject(cProps, occurredAtMs, eventData);`;

if (!content.includes(oldDealAttr)) {
  console.error('ERROR: oldDealAttr not found');
  process.exit(1);
}
content = content.replace(oldDealAttr, newDealAttr);

// 5. Update NOTES
const oldNotes = `- Sandboxed JS strictly compliant: zero try/catch, zero regex literals.`;
const newNotes = `- Sandboxed JS strictly compliant: zero try/catch, zero regex literals.
- Normalized event_time strictly to 10-digit integer Unix timestamp in seconds (Meta CAPI & standard sGTM format), while retaining 13-digit milliseconds in occurred_at_ms for synthetic Meta _fbc/_fbp generation.`;

if (!content.includes(oldNotes)) {
  console.error('ERROR: oldNotes not found');
  process.exit(1);
}
content = content.replace(oldNotes, newNotes);

// Write to template file
fs.writeFileSync(tplPath, content, 'utf8');
console.log('Successfully updated template at:', tplPath);

// Also copy to Downloads folder for instant access by user
const dlPath = 'C:/Users/Webanalyticspro BD/Downloads/hubspot-crm-ingest-client.tpl';
fs.writeFileSync(dlPath, content, 'utf8');
console.log('Successfully updated Downloads copy at:', dlPath);
