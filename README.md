# sGTM HubSpot CRM Tracking

Universal enterprise tracking integration connecting HubSpot CRM lifecycle stages, lead statuses, deal pipeline milestones, and advertising click attribution (Meta, Google, ChatGPT, TikTok, LinkedIn, Bing, Reddit) directly to Server-Side Google Tag Manager.

---

## Repository Structure

```
sgtm-hubspot-crm-tracking/
├── templates/
│   ├── hubspot-crm-ingest-client.tpl        # Custom Ingestion Client Template for sGTM
│   └── meta-crm-offline-conversions-tag.tpl # Custom Meta CAPI Tag Template for sGTM
├── src/
│   └── app/
│       ├── app-hsmeta.json                  # HubSpot Developer App Definition & Permissions
│       └── webhooks/
│           └── webhooks-hsmeta.json         # Webhook Subscriptions & Target sGTM URL
├── hsproject.json                           # HubSpot Project Configuration
└── README.md                                # Universal Setup & Deployment Guide
```

---

## Universal Setup Guide (Any Computer / Any OS)

### 1. Prerequisites
- **Node.js** (v18 or higher) installed from [nodejs.org](https://nodejs.org).
- **HubSpot CLI** installed:
  ```bash
  npm install -g @hubspot/cli@latest
  ```

---

### 2. Connect Your Client's HubSpot Account
From your terminal, authenticate with the client's portal:
```bash
hs account auth
```
- A browser opens: log into the target HubSpot account and approve the connection.
- In terminal, give the account an **Account Name** (e.g., `ail-and-splatt-lawyers` or your client's business name).

To view all connected account names on your computer:
```bash
hs account list
```
*(Shows the exact **Account Name** and numeric **Portal ID** for each connected client).*

---

### 3. Set the Client's sGTM Webhook Endpoint
Open `src/app/webhooks/webhooks-hsmeta.json` in any code or text editor:
Replace `targetUrl` on line 6 with the client's sGTM Stape endpoint:
```json
"targetUrl": "https://<client-container>.in.stape.io/hubspot-webhook"
```
Save the file.

---

### 4. Deploy to the Client's Account
Run the following commands inside this repository folder, replacing `<ACCOUNT_NAME>` with your client's account name (e.g., `ail-and-splatt-lawyers`) or their numeric Portal ID (e.g., `50516291`):

```bash
# Upload project files to the client account
hs project upload --account=<ACCOUNT_NAME>

# Deploy to production in the client account
hs project deploy --account=<ACCOUNT_NAME>
```

> [!TIP]
> **Pro Tip**: If the client account was set as your default account during `hs account auth`, you can omit `--account=` completely and simply run:
> ```bash
> hs project upload
> hs project deploy
> ```

---

### 5. Get the Service Key (Access Token)
1. In the client's HubSpot portal, click **Settings (⚙️)** in the top menu.
2. In the left navigation, go to **Integrations** $\rightarrow$ **Private Apps** (or **Development** $\rightarrow$ **Projects** $\rightarrow$ `sgtm-hubspot-crm-tracking`).
3. Click `sGTM HubSpot CRM Tracking` $\rightarrow$ open the **Auth** tab.
4. Click **Show token** and copy the access token (`pat-na1-...`).

---

### 6. Import the Client Template into sGTM
1. Open the client's Server-Side GTM container.
2. Go to **Templates** $\rightarrow$ **Client Templates** $\rightarrow$ click **New**.
3. In the top right corner, click **⋮ (three dots)** $\rightarrow$ **Import**.
4. Choose `templates/hubspot-crm-ingest-client.tpl` from this repository.
5. Click **Save** and close the template editor.
6. In sGTM, go to **Clients** $\rightarrow$ click **New** $\rightarrow$ select **HubSpot CRM Client**.
7. Paste the copied token into **HubSpot Service Key / Access Token**.
8. Enable the advertising platforms the client uses (Meta, Google, ChatGPT, etc.).
9. Click **Save** and **Publish** (Submit) the container.

---

### 7. Import & Configure the Meta CRM Offline Conversions Tag
1. In your Server-Side GTM container, navigate to **Templates** $\rightarrow$ **Tag Templates** $\rightarrow$ click **New**.
2. Click **⋮ (three dots)** in the top right $\rightarrow$ **Import**.
3. Choose `templates/meta-crm-offline-conversions-tag.tpl` from this repository.
4. Click **Save** and close the template editor.
5. In sGTM, go to **Tags** $\rightarrow$ click **New** $\rightarrow$ select **Meta CRM Offline Conversions**.
6. Enter configuration:
   * **Meta Dataset ID / Pixel ID**: Enter your 15-16 digit Meta Dataset ID.
   * **System User Access Token**: Paste your Conversions API permanent access token.
   * **Test Event Code** *(Optional)*: Enter your test code (e.g. `TEST12345`) while in debugging mode.
   * **Event Name Resolution Mode**: Keep `Auto-Map CRM Lifecycle & Deal Events to Meta Standards` (Recommended).
   * **Customer Data Ingestion Mode**: Keep `Auto-Inherit from Event Data & Cryptographically Hash PII`.
7. Set Trigger:
   * Create a Custom Event trigger where **`Client Name` equals `HubSpot CRM Client`**.
8. Click **Save** and **Publish** the container.

---

### 8. End-to-End Test in GTM Preview & Meta Events Manager
1. Change a lead status, lifecycle stage, or deal stage for any test contact in HubSpot.
2. Inspect the event in Server GTM Preview:
   - Client claims webhook and parses data layer.
   - Tag fires: **Meta CRM Offline Conversions** executes with HTTP 200.
   - Check `user_data`: `em`, `ph` are SHA-256 hashed; `fbc`, `fbp`, and `external_id` remain plaintext.
   - For deals/revenue: `custom_data.value`, `currency`, and `order_id` are populated.
3. Open **Meta Events Manager** $\rightarrow$ **Test Events**:
   - Verify incoming event (e.g., `SubmitApplication`, `Purchase`, or `InitiateCheckout`).
   - Check **Event Match Quality (EMQ)** rating is elevated ($\ge 8.5/10$).

---

## Tracking Custom CRM Events & Properties

The client template and project structure automatically support custom contact properties, custom deal properties, and custom pipeline stages.

### 1. How Custom Events are Formatted in sGTM
* **Custom Lifecycle Stages**: Automatically becomes `lifecycle_<stage_name>` (e.g., `lifecycle_trial_user`).
* **Custom Lead Statuses**: Automatically becomes `lead_status_<status_name>` (e.g., `lead_status_demo_completed`).
* **Custom Deal Stages**: Automatically becomes `deal_stage_<stage_name>` (e.g., `deal_stage_proposal_review`).
* **Custom Contact Properties**: Formatted as `crm_<property>_<value>` (e.g., `crm_kyc_status_verified`) or `crm_<property>`.
* **Custom Deal Properties**: Formatted as `deal_<property>_<value>` (e.g., `deal_contract_signed`) or `deal_<property>`.
* **Data Layer Variables**: `custom_property_name` and `custom_property_value` are always exposed at the top level of Event Data.

### 2. How to Subscribe to a Custom Property
In `src/app/webhooks/webhooks-hsmeta.json`, add your custom property under `subscriptions.crmObjects`:

```json
{
  "subscriptionType": "object.propertyChange",
  "objectType": "contact",
  "propertyName": "kyc_status",
  "active": true
}
```

Then deploy via terminal:
```bash
hs project upload
hs project deploy --force
```

