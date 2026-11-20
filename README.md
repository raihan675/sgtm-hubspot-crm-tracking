# sGTM HubSpot CRM Tracking

Universal enterprise tracking integration connecting HubSpot CRM lifecycle stages, lead statuses, deal pipeline milestones, and advertising click attribution (Meta, Google, ChatGPT, TikTok, LinkedIn, Bing, Reddit) directly to Server-Side Google Tag Manager.

---

## Repository Structure

```
sgtm-hubspot-crm-tracking/
├── templates/
│   └── hubspot-crm-ingest-client.tpl   # Custom Client Template for sGTM
├── src/
│   └── app/
│       ├── app-hsmeta.json             # HubSpot Developer App Definition & Permissions
│       └── webhooks/
│           └── webhooks-hsmeta.json    # Webhook Subscriptions & Target sGTM URL
├── hsproject.json                      # HubSpot Project Configuration
└── README.md                           # Universal Setup & Deployment Guide
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
6. In sGTM, go to **Clients** $\rightarrow$ click **New** $\rightarrow$ select **HubSpot CRM Ingest Client**.
7. Paste the copied token into **HubSpot Service Key / Access Token**.
8. Enable the advertising platforms the client uses (Meta, Google, ChatGPT, etc.).
9. Click **Save** and **Publish** (Submit) the container.

---

### 7. Test in GTM Preview
Change a lead status or lifecycle stage for any test contact in HubSpot. Inspect the event in GTM Preview mode:
- Single event fires (e.g., `lifecycle_sql`, `lead_status_in_progress`).
- Clean `user_data` without duplicate emails.
- Structured `crm_details` with lifecycle milestone timestamps and revenue.
- Clean `attribution` showing populated click IDs.
