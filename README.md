# HubSpot CRM to Server-Side GTM (sGTM) Tracking Pipeline

Universal enterprise tracking integration connecting HubSpot CRM lifecycle stages, lead statuses, deal pipeline milestones, and advertising click attribution (Meta, Google, ChatGPT, TikTok, LinkedIn, Bing, Reddit) directly to Server-Side Google Tag Manager.

---

## Repository Structure

```
sgtm-crm-tracking/
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

### 2. Connect Your Client's HubSpot Portal
From your terminal, authenticate with the client's portal:
```bash
hs account auth
```
- A browser opens: log into the target HubSpot account and approve the connection.
- In terminal, give the account an alias (e.g., `client_acme`).

Verify connected accounts:
```bash
hs account list
```

---

### 3. Set the Client's sGTM Webhook Endpoint
Open `src/app/webhooks/webhooks-hsmeta.json` in any code or text editor:
Replace `targetUrl` with the client's sGTM Stape endpoint:
```json
"targetUrl": "https://<client-container>.in.stape.io/hubspot-webhook"
```
Save the file.

---

### 4. Deploy to the Client's Portal
Run the following commands inside this repository folder:
```bash
# Upload project files to the client portal
hs project upload --account=client_acme

# Deploy to production in the client portal
hs project deploy --account=client_acme
```

---

### 5. Get the Service Key (Access Token)
1. In the client's HubSpot portal, click **Settings (⚙️)** in the top menu.
2. In the left navigation, go to **Integrations** $\rightarrow$ **Private Apps** (or **Development** $\rightarrow$ **Projects** $\rightarrow$ `sgtm-crm-tracking`).
3. Click `sgtm-crm-tracking-App` $\rightarrow$ open the **Auth** tab.
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
