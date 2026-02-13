# GTM Container Setup – Conviva AppAnalytics

This guide lists **Variables**, **Tags**, and **Triggers** to configure in your GTM container so all Conviva AppAnalytics tag types work and can be tested (e.g. with the VideoJS sample app).

---

## 1. Variables (create these first)

Create these in **Variables** → **User-Defined Variables** → **New**. Use the names below so triggers and tags can reference them.

| Variable Name | Type | Purpose / Value |
|---------------|------|------------------|
| **Conviva – Customer Key** | Constant | Your Conviva Customer Key (from Pulse). |
| **Conviva – App ID** | Constant | e.g. `WEB App` or `VideoJS Sample`. |
| **Conviva – App Version** | Constant | e.g. `1.0.0` (optional). |
| **Conviva – Custom Event Name** | Data Layer Variable | Key: `convivaEventName`. Used when trigger is Custom Event `conviva_customEvent`. |
| **Conviva – Custom Event Data** | Data Layer Variable | Key: `convivaEventData`. Object for custom event payload. |
| **Conviva – User ID** | Data Layer Variable | Key: `convivaUserId`. For Set User ID and optional Init User ID. |
| **Conviva – Page View Title** | Data Layer Variable | Key: `convivaPageViewTitle`. Optional override for Track Page View. |
| **Conviva – Error Message** | Data Layer Variable | Key: `convivaErrorMessage`. For Track Error. |
| **Conviva – Error Filename** | Data Layer Variable | Key: `convivaErrorFilename`. Optional. |
| **Conviva – Revenue Order Amount** | Data Layer Variable | Key: `convivaRevenueOrderAmount`. Required. |
| **Conviva – Revenue Order ID** | Data Layer Variable | Key: `convivaRevenueOrderId`. Required. |
| **Conviva – Revenue Currency** | Data Layer Variable | Key: `convivaRevenueCurrency`. Required (e.g. USD). |
| **Conviva – Revenue Items List** | Data Layer Variable | Key: `convivaRevenueItems`. Array of line items (objects). |
| **Conviva – Revenue Data** | Data Layer Variable | Key: `convivaRevenueData`. Full revenue payload object (optional). |
| **Conviva – Custom Tags** | Data Layer Variable | Key: `convivaCustomTags`. Object of key/value for Set Custom Tags. |
| **Conviva – Unset Tag Keys** | Data Layer Variable | Key: `convivaUnsetTagKeys`. Comma-separated string or array for Unset Custom Tags. |

**Client ID (for setClientId in Init)** – choose one depending on when Init runs:

| Variable Name | Type | Purpose |
|---------------|------|---------|
| **Conviva – Client ID** | **URL** | Use when Init fires on **All Pages**. Reads from query param: `convivaClientId`. Configure: **URL** variable → Component Type: **Query** → Query Key: `convivaClientId`. Example URL: `https://yoursite.com/page?convivaClientId=11660767.157929047.26575856.697588899`. |
| **Conviva – Client ID (Data Layer)** | Data Layer Variable | Use when Init fires on **Custom Event** `conviva_init`. Key: `convivaClientId`. Pushed in the same `dataLayer.push` as the event. |

**Single variable for both (URL first, then Data Layer):** Use one **Custom JavaScript** variable named **Conviva – Client ID** that reads the query param on page load and falls back to the dataLayer when Init is fired by a custom event:

```javascript
function() {
  var q = window.location.search || '';
  var match = /[?&]convivaClientId=([^&]*)/.exec(q);
  if (match && match[1]) return decodeURIComponent(match[1].replace(/\+/g, ' '));
  var dl = window.dataLayer || [];
  for (var i = dl.length - 1; i >= 0; i--) {
    if (dl[i].convivaClientId) return String(dl[i].convivaClientId).trim();
  }
  return '';
}
```

Then set the Init tag’s **Client ID (optional – set before init)** to `{{Conviva – Client ID}}` and use either **Conviva – All Pages (Init)** or **Conviva – Init (Custom Event)**; clientId will come from the URL when present, otherwise from the dataLayer push.

**Data Layer Variable** configuration: set **Data Layer Variable Name** to the key (e.g. `convivaEventName`). Version: 2.

**Custom Event – avoiding merged data:** GTM merges each dataLayer push into a single state. If you fire multiple `conviva_customEvent` pushes (e.g. one from a setTimeout and one from a button), the **Data Layer Variable** for `convivaEventData` can return the **merged** object (e.g. both `performanceTiming` and `button` in one payload). To send only the **current** push’s event name and data, use these **JavaScript Variables** instead of the Data Layer Variables for the Custom Event tag:

| Variable Name | Type | Purpose |
|---------------|------|---------|
| **Conviva – Custom Event Name (from last push)** | Custom JavaScript | Returns `convivaEventName` from the most recent dataLayer entry with `event === 'conviva_customEvent'`. |
| **Conviva – Custom Event Data (from last push)** | Custom JavaScript | Returns `convivaEventData` from that same push (only the current event’s payload). |

**Custom JavaScript** for **Conviva – Custom Event Name (from last push):**

```javascript
function() {
  var dl = window.dataLayer || [];
  for (var i = dl.length - 1; i >= 0; i--) {
    if (dl[i].event === 'conviva_customEvent' && dl[i].convivaEventName)
      return dl[i].convivaEventName;
  }
  return '';
}
```

**Custom JavaScript** for **Conviva – Custom Event Data (from last push):**

```javascript
function() {
  var dl = window.dataLayer || [];
  for (var i = dl.length - 1; i >= 0; i--) {
    if (dl[i].event === 'conviva_customEvent' && dl[i].convivaEventData != null)
      return dl[i].convivaEventData;
  }
  return {};
}
```

In the **Conviva – Custom Event** tag, set Event Name → `{{Conviva – Custom Event Name (from last push)}}` and Event Data Object (variable) → `{{Conviva – Custom Event Data (from last push)}}` so each firing sends only that push’s data.

---

## 2. Triggers

Create these in **Triggers** → **New**.

| Trigger Name | Type | Configuration |
|--------------|------|----------------|
| **Conviva – All Pages (Init)** | Initialization – All Pages | (no filters) – fires first so Init loads the SDK. Use for production. |
| **Conviva – Init (Custom Event)** | Custom Event | Event name: `conviva_init`. Use to fire Init on button click for testing setClientId; push `convivaClientId` in the same push. |
| **Conviva – DOM Ready (Page View)** | DOM Ready | (no filters) – for Track Page View on **first load** (MPA or SPA). |
| **Conviva – History Change (Page View)** | History Change | (no filters) – for Track Page View on **SPA route changes** (pushState/replaceState). |
| **Conviva – Custom Event** | Custom Event | Event name: `conviva_customEvent`. Use for Track Custom Event tag. |

**Page View triggers:** Use **DOM Ready** for traditional multi-page sites (one view per full load). Use **History Change** for single-page apps so each route change sends a page view. For **SPA or hybrid** sites, attach the same Page View tag to **both** DOM Ready and History Change so you get a view on initial load and on every in-app navigation.

| **Conviva – Set User ID** | Custom Event | Event name: `conviva_setUserId`. |
| **Conviva – Track Error** | Custom Event | Event name: `conviva_trackError`. |
| **Conviva – Revenue** | Custom Event | Event name: `conviva_revenue`. |
| **Conviva – Set Custom Tags** | Custom Event | Event name: `conviva_setCustomTags`. |
| **Conviva – Unset Custom Tags** | Custom Event | Event name: `conviva_unsetCustomTags`. |

---

## 3. Tags (Conviva DPI JS SDK)

Create one tag per row. Tag type: **Conviva DPI JS SDK** (after importing the template). Map fields to the variables above where indicated.

| Tag Name | Tag Type (dropdown) | Key fields → Variable / Value | Trigger |
|----------|---------------------|------------------------------|---------|
| **Conviva – Init** | Initialize (init) | **Script source:** Conviva-hosted (version dropdown) or Customer-hosted (Script URL). **Replay:** If "Init with Cohort Replay" is enabled, **Replay script source:** Conviva-hosted (version) or Customer-hosted (Replay script URL). Other fields: Conviva Customer Key, App ID, App Version, (optional) User ID, (optional) **Client ID** → `{{Conviva – Client ID}}`. With **All Pages** trigger, pass clientId in URL: `?convivaClientId=...`; with **Custom Event** trigger, push `convivaClientId` in the same dataLayer push. | **Conviva – All Pages (Init)** (production) or **Conviva – Init (Custom Event)** (testing). |
| **Conviva – Page View** | Track Page View (trackPageView) | Page Title Override → `{{Conviva – Page View Title}}` (or leave empty). Only fire if initialized: ✓ | **Conviva – DOM Ready (Page View)** and/or **Conviva – History Change (Page View)**. Use both for SPA/hybrid. |
| **Conviva – Custom Event** | Track Custom Event (trackCustomEvent) | Event Name → `{{Conviva – Custom Event Name}}`, Event Data Object (variable) → `{{Conviva – Custom Event Data}}`. Only fire if initialized: ✓ | **Conviva – Custom Event** |
| **Conviva – Set User ID** | Set User ID (setUserId) | User ID → `{{Conviva – User ID}}` | **Conviva – Set User ID** |
| **Conviva – Track Error** | Track Error (trackError) | Error Message → `{{Conviva – Error Message}}`, Filename → `{{Conviva – Error Filename}}` | **Conviva – Track Error** |
| **Conviva – Revenue** | Track Revenue (trackRevenue) | Total order amount → `{{Conviva – Revenue Order Amount}}`, Order ID → `{{Conviva – Revenue Order ID}}`, Currency → `{{Conviva – Revenue Currency}}` (all required). Purchased items (variable) → `{{Conviva – Revenue Items List}}`, Revenue data object → `{{Conviva – Revenue Data}}` (optional). Only fire if initialized: ✓ | **Conviva – Revenue** |
| **Conviva – Set Custom Tags** | Set Custom Tags (setCustomTags) | **Custom Tags (variable)** → `{{Conviva – Custom Tags}}` (object from dataLayer). Optionally add rows in the **table**; variable and table are merged. See "Set Custom Tags – explained" below. | **Conviva – Set Custom Tags** |
| **Conviva – Unset Custom Tags** | Unset Custom Tags (unsetCustomTags) | Tag Keys to Unset → `{{Conviva – Unset Tag Keys}}` | **Conviva – Unset Custom Tags** |

#### Script source (main SDK and Cohort Replay)

- **Main SDK:** **Script source** = Conviva-hosted (recommended) or Customer-hosted. When Customer-hosted, set **Script URL** to the full URL of `convivaAppTracker.js`.
- **Cohort Replay** (when "Init with Cohort Replay" is checked): **Replay script source** = Conviva-hosted (recommended) or Customer-hosted. When Customer-hosted, set **Replay script URL** to the full URL of your replay bundle (e.g. `conviva-replay.umd.min.js`). For customer-hosted scripts, ensure the tag’s inject-script permissions allow your domain (or add your URL in the container if required).

#### Client ID (setClientId)

Per the [Conviva JS SDK](https://github.com/Conviva/conviva-js-script-appanalytics), **setClientId** can be used to sync clientId from another instance (e.g. mobile app or subdomain). In the **Conviva – Init** tag, use the optional **Client ID (optional – set before init)** field. Set it to a variable (e.g. from a cookie or dataLayer) when you want to reuse a client ID; leave empty to let the SDK generate one.

#### Set Custom Tags – explained

- Use the **Conviva – Custom Tags** variable: create a Data Layer Variable with key `convivaCustomTags` (already in the Variables table). In the tag, set **Custom Tags (variable)** to `{{Conviva – Custom Tags}}`. Your page pushes `conviva_setCustomTags` with `convivaCustomTags: { "key1": "value1", ... }` and the tag sends that object to the tracker.
- You can also use the **table** for fixed key/value pairs. If both the variable and the table are set, they are merged (variable keys override table keys for the same name).
- **Testing:** Push `event: 'conviva_setCustomTags'` and `convivaCustomTags: { env: 'test' }` from your page; in the tag select **Custom Tags (variable)** → `{{Conviva – Custom Tags}}` and fire on **Conviva – Set Custom Tags**.


---

## 4. dataLayer event names (for your site or sample app)

Push these from your page so the triggers above fire and variables are read from the same push:

| Event name (push as `event: '...'`) | Data Layer keys to set (so variables work) |
|-------------------------------------|--------------------------------------------|
| `conviva_customEvent` | `convivaEventName`, `convivaEventData` |
| `conviva_setUserId` | `convivaUserId` |
| `conviva_trackError` | `convivaErrorMessage`, `convivaErrorFilename` (optional) |
| `conviva_revenue` | `convivaRevenueOrderAmount`, `convivaRevenueOrderId`, `convivaRevenueCurrency` (all required), `convivaRevenueItems` (array), optionally `convivaRevenueData` (object) |
| `conviva_setCustomTags` | `convivaCustomTags` (object) |
| `conviva_unsetCustomTags` | `convivaUnsetTagKeys` (string or array) |

**Example – Custom Event:**

```javascript
window.dataLayer = window.dataLayer || [];
window.dataLayer.push({
  event: 'conviva_customEvent',
  convivaEventName: 'my_event_name',
  convivaEventData: { key: 'value' }
});
```

**Example – Revenue:**

```javascript
window.dataLayer = window.dataLayer || [];
window.dataLayer.push({
  event: 'conviva_revenue',
  convivaRevenueOrderAmount: '99.99',
  convivaRevenueOrderId: 'ord_12345',
  convivaRevenueCurrency: 'USD',
  convivaRevenueItems: [{ productId: 'p1', name: 'Product 1', quantity: '2', unitPrice: '49.99' }]
});
```

**Example – Set User ID:**

```javascript
window.dataLayer = window.dataLayer || [];
window.dataLayer.push({
  event: 'conviva_setUserId',
  convivaUserId: 'user_123'
});
```

**Example – Track Error:**

```javascript
window.dataLayer = window.dataLayer || [];
window.dataLayer.push({
  event: 'conviva_trackError',
  convivaErrorMessage: 'Something went wrong',
  convivaErrorFilename: 'app.js'
});
```

---

## 5. Queue snippet (required for SDK v1.5.5+)

Add this **before** the GTM script (or in a Custom HTML tag that fires before Conviva Init) so `window.tracker` exists when the SDK loads:

```html
<script>
(function(p,i){if(!p[i]){p.GlobalConvivaNamespace=p.GlobalConvivaNamespace||[];p.GlobalConvivaNamespace.push(i);p[i]=function(){(p[i].q=p[i].q||[]).push(arguments);};p[i].q=p[i].q||[];}}(window,"tracker"));
</script>
```

---

## 6. Testing with VideoJS sample app

The sample app (`VideoJS-Sample-AppInsights-0.3.19`) includes:

- The queue snippet in the page (before GTM).
- dataLayer pushes for: `conviva_customEvent`, `conviva_pageView` (via DOM Ready), `conviva_setUserId`, `conviva_trackError`, `conviva_revenue`, `conviva_setCustomTags`, `conviva_unsetCustomTags`.

Configure your GTM container with the Variables and Triggers above, create the Conviva tags as in the table, then open the sample app and use the buttons/actions that push each event to verify each tag type.
