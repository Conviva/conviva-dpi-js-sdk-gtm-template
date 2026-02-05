# Conviva AppAnalytics – Google Tag Manager Template

Deploy the [Conviva JavaScript DPI SDK](https://github.com/Conviva/conviva-js-script-appanalytics) (script-based AppAnalytics tracker) via Google Tag Manager without editing site code.

## Installation

1. **Import the template** into your GTM container:
   - In GTM: **Templates** → **Tag Configuration** → **New** → **Import** and select the `template.tpl` file,  
   - Or install from the **Community Template Gallery** (when published): search for "Conviva AppAnalytics" and add the tag type.

2. **Create tags** from the "Conviva AppAnalytics Browser SDK" tag type and configure by tag type (see below).

## Tag types

| Tag type | Purpose | Recommended trigger |
|----------|---------|---------------------|
| **Initialize (init)** | Load the SDK and initialize with Customer Key, App ID, App Version. Optionally set User ID and default custom tags. | **Initialization – All Pages** (or Consent Initialization when using consent mode) |
| **Set User ID (setUserId)** | Set the viewer/user ID (e.g. after login). | When user is identified (e.g. Custom Event or DOM Ready with variable) |
| **Track Page View (trackPageView)** | Send a page view. Required for SPA/MPA correctness. | **DOM Ready** or **Window Loaded** (MPA), or **History Change** (SPA) |
| **Track Custom Event (trackCustomEvent)** | Send a custom event with name and optional data. | **Custom Event** from dataLayer (or other trigger) |
| **Track Revenue (trackRevenue)** | Send a revenue/purchase event (`conviva_revenue_event`) with order amount and transaction ID; optional currency, tax, shipping, discount, line items, and extra metadata. | On purchase/checkout (e.g. Custom Event or thank-you page) |
| **Set Custom Tags (setCustomTags)** | Set global key/value tags applied to all events. | As needed |
| **Unset Custom Tags (unsetCustomTags)** | Remove previously set custom tag keys. | As needed |
| **Track Error (trackError)** | Report an error (message, optional filename, optional error object). | On error (e.g. Custom Event with error payload) |

## Init tag (required once per page)

- **Conviva Customer Key*** – From [Pulse → My Profile → Applications](https://pulse.conviva.com/app/profile/applications).
- **App ID*** – Application name (e.g. `"WEB App"`, `"LGTV Web App"`).
- **App Version** – Optional string (e.g. `"1.1.0"`).
- **Script source** – **Conviva-hosted (recommended)** or **Customer-hosted**. If customer-hosted, provide the full URL to `convivaAppTracker.js`.
- **Init with Cohort Replay** – When enabled, loads and initialises [Conviva Session Replay](https://github.com/Conviva/conviva-js-replay) (conviva-replay.umd.min.js from jsDelivr) **before** the main SDK, using the same Customer Key. Replay must run before AppAnalytics.
- **Replay script version** – (Shown when Cohort Replay is enabled.) Dropdown to select replay SDK version (e.g. `1.0.1`). **Replay custom version (optional)** overrides the dropdown when set (e.g. `main`, `1.0.1`).
- **User ID** – Optional; if set, `setUserId` is called immediately after init.
- **Default Custom Tags** – Optional key/value table; applied via `setCustomTags` after init.

**Trigger:** Fire the Init tag on **All Pages** (or Consent Initialization) so the SDK loads before other Conviva tags.

## Page View tag

- **Page Title Override** – Optional; if empty, the SDK uses `document.title`.
- **Only fire if initialized** – When enabled (default), the tag does not fire if the Init tag has not run (avoids errors).

**Triggers:** MPA: **DOM Ready** or **Window Loaded**. SPA: **History Change** or a Custom Event that fires on route change.

## Custom Event tag

- **Event Name*** – Required.
- **Event Data** – Optional; key/value table and/or a variable that returns an object.
- **Only fire if initialized** – When enabled (default), the tag does not fire if the Init tag has not run.

**Trigger:** Usually a **Custom Event** that pushes to `dataLayer` with event name and data.

## Revenue tag

Sends a custom event with fixed name `conviva_revenue_event` and data suitable for revenue metrics (Total Revenue, Revenue per visitor, Average Order Value, Average Cart Size). Same API as Custom Event.

- **Total order amount*** – Required.
- **Order ID (transaction ID)*** – Required.
- **Optional:** Currency, Tax amount, Shipping cost, Discount/coupon value, Cart size, Purchased items (table: Product ID, Name, SKU, Category, Unit price, Quantity, Discount, Brand, Variant), Payment method, Payment provider, Order status.
- **Additional metadata** – Key/value table for any extra fields.
- **Revenue data object (variable)** – Optional variable returning an object; merged with the above.

**Trigger:** On purchase/checkout success (e.g. thank-you page or Custom Event with order data).

## Links

- [Conviva JavaScript DPI SDK (conviva-js-script-appanalytics)](https://github.com/Conviva/conviva-js-script-appanalytics)
- [Pulse – My Profile / Applications](https://pulse.conviva.com/app/profile/applications) (Customer Key)
- [GTM Community Template Gallery](https://tagmanager.google.com/gallery/)
