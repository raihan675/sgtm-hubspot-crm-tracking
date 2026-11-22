const fs = require('fs');
const path = require('path');

const stape = fs.readFileSync('c:/Users/Webanalyticspro BD/Downloads/facebook-tag-main/facebook-tag-main/template.tpl', 'utf8');

// 1. Update Display Name and Description in INFO
let updated = stape.replace('"displayName": "Facebook Conversion API"', '"displayName": "Meta CRM Offline Conversions"');
updated = updated.replace('"description": "Tag that send the event data from the GA4/Data clients to Facebook Conversion API."', '"description": "Specialized Meta Conversions API (CAPI) tag for Server-Side GTM, optimized for HubSpot CRM offline conversions, automated lifecycle mapping, and high match quality."');

// 2. Update default actionSource to system_generated in TEMPLATE_PARAMETERS
updated = updated.replace(/("name":\s*"actionSource"[\s\S]*?"defaultValue":\s*")website(")/, '$1system_generated$2');

// 3. Update getEventName to include HubSpot CRM events in SANDBOXED_JS_FOR_SERVER
const crmEvents = `    // HubSpot CRM Lifecycle Stage & Lead Status Mappings
    lifecycle_subscriber: 'Lead',
    lifecycle_lead: 'Lead',
    lifecycle_mql: 'Lead',
    lifecycle_sql: 'SubmitApplication',
    lifecycle_opportunity: 'InitiateCheckout',
    lifecycle_customer: 'Purchase',
    lifecycle_evangelist: 'CompleteRegistration',

    lead_status_new: 'Lead',
    lead_status_open: 'Lead',
    lead_status_in_progress: 'Contact',
    lead_status_attempted_to_contact: 'Contact',
    lead_status_connected: 'Contact',
    lead_status_open_deal: 'InitiateCheckout',

    contact_meeting_booked: 'Schedule',
    deal_appointment_scheduled: 'Schedule',

    deal_closed_won: 'Purchase',
    deal_qualified: 'InitiateCheckout',
    deal_contract_sent: 'InitiateCheckout',
    deal_amount_updated: 'InitiateCheckout',
`;

updated = updated.replace("const gaToFacebookEventName = {", "const gaToFacebookEventName = {\n" + crmEvents);

// 4. Update mapEvent to respect eventData.action_source || 'system_generated'
updated = updated.replace("action_source: data.actionSource || 'website'", "action_source: eventData.action_source || data.actionSource || 'system_generated'");

// 5. Update addUserData to check HubSpot contact/object IDs
updated = updated.replace("const externalId = eventData.external_id || eventData.user_id || eventData.userId;", "const externalId = eventData.external_id || eventData.user_id || eventData.userId || eventData.contact_id || eventData.hs_object_id;");

// 6. Update addEcommerceData to check deal_amount / amount and deal_id / hs_object_id
updated = updated.replace("eventData['x-ga-mp1-ev'] || eventData['x-ga-mp1-tr'] || eventData.value", "eventData['x-ga-mp1-ev'] || eventData['x-ga-mp1-tr'] || eventData.value || eventData.deal_amount || eventData.amount");
updated = updated.replace("if (eventData.transaction_id) mappedData.custom_data.order_id = eventData.transaction_id;", "const ordId = eventData.transaction_id || eventData.order_id || eventData.deal_id || eventData.hs_object_id;\n    if (ordId) mappedData.custom_data.order_id = ordId;");

// Write out to all target locations
const targets = [
  'C:/Users/Webanalyticspro BD/sgtm-hubspot-crm-tracking/templates/meta-crm-offline-conversions-tag.tpl',
  'C:/Users/Webanalyticspro BD/Downloads/meta-crm-offline-conversions-tag.tpl',
  'C:/Users/Webanalyticspro BD/client-web-analytics-bd/templates/meta-crm-offline-conversions-tag.tpl',
  'C:/Users/Webanalyticspro BD/client-ail-and-splatt-lawyers/templates/meta-crm-offline-conversions-tag.tpl'
];

for (const target of targets) {
  const dir = path.dirname(target);
  if (!fs.existsSync(dir)) fs.mkdirSync(dir, { recursive: true });
  fs.writeFileSync(target, updated, 'utf8');
  console.log('Successfully wrote to:', target);
}
