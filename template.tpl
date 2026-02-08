___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "conviva_appanalytics_public_id",
  "version": 1,
  "securityGroups": [],
  "categories": [
    "ANALYTICS"
  ],
  "displayName": "Conviva DPI JS SDK",
  "brand": {
    "id": "conviva",
    "displayName": "Conviva"
  },
  "description": "Deploy the Conviva JavaScript DPI SDK (script-based AppAnalytics tracker) via GTM. Supports Initialize (with optional Cohort Replay), Set User ID, Track Page View, Track Custom Event, Track Revenue, Set/Unset Custom Tags, and Track Error. See https://github.com/Conviva/conviva-js-script-appanalytics and https://github.com/Conviva/conviva-js-replay.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "selectItems": [
      {
        "displayValue": "Initialize (init)",
        "value": "init"
      },
      {
        "displayValue": "Set User ID (setUserId)",
        "value": "setUserId"
      },
      {
        "displayValue": "Track Page View (trackPageView)",
        "value": "trackPageView"
      },
      {
        "displayValue": "Track Custom Event (trackCustomEvent)",
        "value": "trackCustomEvent"
      },
      {
        "displayValue": "Set Custom Tags (setCustomTags)",
        "value": "setCustomTags"
      },
      {
        "displayValue": "Unset Custom Tags (unsetCustomTags)",
        "value": "unsetCustomTags"
      },
      {
        "displayValue": "Track Error (trackError)",
        "value": "trackError"
      },
      {
        "displayValue": "Track Revenue (trackRevenue)",
        "value": "trackRevenue"
      }
    ],
    "displayName": "Tag Type",
    "defaultValue": "init",
    "simpleValueType": true,
    "name": "type",
    "type": "SELECT",
    "alwaysInSummary": true
  },
  {
    "type": "LABEL",
    "name": "initDescription",
    "displayName": "Initialize – Loads the Conviva SDK and initializes with Customer Key, App ID, and App Version. Fire once per page (e.g. All Pages or Consent Initialization). <a href=\"https://github.com/Conviva/conviva-js-script-appanalytics\">SDK docs</a>",
    "enablingConditions": [
      {
        "paramName": "type",
        "paramValue": "init",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "LABEL",
    "name": "setUserIdDescription",
    "displayName": "Set User ID – Sets the viewer/user ID. Trigger after user is identified (e.g. login).",
    "enablingConditions": [
      {
        "paramName": "type",
        "paramValue": "setUserId",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "LABEL",
    "name": "trackPageViewDescription",
    "displayName": "Track Page View – Sends a page view. Required for correct metrics. Use DOM Ready / Window Loaded (MPA) or History Change (SPA).",
    "enablingConditions": [
      {
        "paramName": "type",
        "paramValue": "trackPageView",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "LABEL",
    "name": "trackCustomEventDescription",
    "displayName": "Track Custom Event – Sends a custom event with name and optional data.",
    "enablingConditions": [
      {
        "paramName": "type",
        "paramValue": "trackCustomEvent",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "LABEL",
    "name": "setCustomTagsDescription",
    "displayName": "Set Custom Tags – Key/value pairs applied to all subsequent events.",
    "enablingConditions": [
      {
        "paramName": "type",
        "paramValue": "setCustomTags",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "LABEL",
    "name": "unsetCustomTagsDescription",
    "displayName": "Unset Custom Tags – Removes previously set tag keys (comma-separated or one per line).",
    "enablingConditions": [
      {
        "paramName": "type",
        "paramValue": "unsetCustomTags",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "LABEL",
    "name": "trackErrorDescription",
    "displayName": "Track Error – Reports an error (message, optional filename, optional error object variable).",
    "enablingConditions": [
      {
        "paramName": "type",
        "paramValue": "trackError",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "LABEL",
    "name": "trackRevenueDescription",
    "displayName": "Track Revenue – Sends a revenue/purchase event (conviva_revenue_event) with order amount and transaction ID required; optional currency, tax, shipping, discount, cart size, line items, and extra metadata. Uses same API as Custom Event.",
    "enablingConditions": [
      {
        "paramName": "type",
        "paramValue": "trackRevenue",
        "type": "EQUALS"
      }
    ]
  },
  {
    "help": "Find your Customer Key in <a href=\"https://pulse.conviva.com/app/profile/applications\">Pulse → My Profile → Applications</a>.",
    "alwaysInSummary": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "displayName": "Conviva Customer Key*",
    "simpleValueType": true,
    "name": "convivaCustomerKey",
    "type": "TEXT",
    "enablingConditions": [
      {
        "paramName": "type",
        "paramValue": "init",
        "type": "EQUALS"
      }
    ]
  },
  {
    "help": "Application name, e.g. \"WEB App\", \"LGTV Web App\".",
    "alwaysInSummary": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "displayName": "App ID*",
    "simpleValueType": true,
    "name": "appId",
    "type": "TEXT",
    "enablingConditions": [
      {
        "paramName": "type",
        "paramValue": "init",
        "type": "EQUALS"
      }
    ]
  },
  {
    "displayName": "App Version",
    "simpleValueType": true,
    "name": "appVersion",
    "type": "TEXT",
    "valueHint": "e.g. 1.1.0",
    "enablingConditions": [
      {
        "paramName": "type",
        "paramValue": "init",
        "type": "EQUALS"
      }
    ]
  },
  {
    "selectItems": [
      {
        "displayValue": "Conviva-hosted (recommended)",
        "value": "conviva_hosted"
      },
      {
        "displayValue": "Customer-hosted",
        "value": "customer_hosted"
      }
    ],
    "displayName": "Script source",
    "defaultValue": "conviva_hosted",
    "simpleValueType": true,
    "name": "scriptSource",
    "type": "SELECT",
    "enablingConditions": [
      {
        "paramName": "type",
        "paramValue": "init",
        "type": "EQUALS"
      }
    ],
    subParams:[
      {
        "selectItems": [
          {
            "displayValue": "1.5.5",
            "value": "1.5.5"
          },
          {
            "displayValue": "GTM Init",
            "value": "GTM-init"
          }
        ],
        "displayName": "Script version",
        "defaultValue": "GTM-init",
        "simpleValueType": true,
        "name": "scriptVersion",
        "type": "SELECT",
        "help": "SDK version to load from Conviva CDN (jsDelivr). Overridden by Custom version when set.",
        "enablingConditions": [
          {
            "paramName": "scriptSource",
            "paramValue": "conviva_hosted",
            "type": "EQUALS"
          }
        ]
      },
      {
        "displayName": "Custom version (optional)",
        "simpleValueType": true,
        "name": "scriptVersionCustom",
        "type": "TEXT",
        "valueHint": "Overrides dropdown when set (e.g. 1.5.5, GTM-init)",
        "enablingConditions": [
          {
            "paramName": "scriptSource",
            "paramValue": "conviva_hosted",
            "type": "EQUALS"
          }
        ]
      },
      {
        "help": "Full URL to convivaAppTracker.js (required when Script source is Customer-hosted).",
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "displayName": "Script URL",
        "simpleValueType": true,
        "name": "scriptUrl",
        "type": "TEXT",
        "enablingConditions": [
          {
            "paramName": "scriptSource",
            "paramValue": "customer_hosted",
            "type": "EQUALS"
          }
        ]
      },
    ]
  },
  {
    "defaultValue": false,
    "simpleValueType": true,
    "name": "initWithCohortReplay",
    "checkboxText": "Init with Cohort Replay",
    "type": "CHECKBOX",
    "help": "When enabled, loads and initialises Conviva Session Replay (conviva-js-replay) before the main SDK. Uses the same Customer Key. Replay must run before AppAnalytics. See https://github.com/Conviva/conviva-js-replay.",
    "enablingConditions": [
      {
        "paramName": "type",
        "paramValue": "init",
        "type": "EQUALS"
      }
    ]
  },
  {
    "selectItems": [
      { "displayValue": "1.0.1", "value": "1.0.1" }
    ],
    "displayName": "Replay script version",
    "defaultValue": "1.0.1",
    "simpleValueType": true,
    "name": "replayScriptVersion",
    "type": "SELECT",
    "help": "Replay SDK version from jsDelivr. Overridden by Custom version when set.",
    "enablingConditions": [
      { "paramName": "type", "paramValue": "init", "type": "EQUALS" },
      { "paramName": "initWithCohortReplay", "paramValue": true, "type": "EQUALS" }
    ]
  },
  {
    "displayName": "Replay custom version (optional)",
    "simpleValueType": true,
    "name": "replayScriptVersionCustom",
    "type": "TEXT",
    "valueHint": "Overrides dropdown when set (e.g. 1.0.1, main)",
    "enablingConditions": [
      { "paramName": "type", "paramValue": "init", "type": "EQUALS" },
      { "paramName": "initWithCohortReplay", "paramValue": true, "type": "EQUALS" }
    ]
  },
  {
    "displayName": "User ID (optional)",
    "simpleValueType": true,
    "name": "initUserId",
    "type": "TEXT",
    "enablingConditions": [
      {
        "paramName": "type",
        "paramValue": "init",
        "type": "EQUALS"
      }
    ]
  },
  {
    "displayName": "Default Custom Tags",
    "name": "initCustomTags",
    "simpleTableColumns": [
      {
        "defaultValue": "",
        "displayName": "Key",
        "name": "key",
        "type": "TEXT"
      },
      {
        "defaultValue": "",
        "displayName": "Value",
        "name": "value",
        "type": "TEXT"
      }
    ],
    "type": "SIMPLE_TABLE",
    "newRowButtonText": "Add Tag",
    "enablingConditions": [
      {
        "paramName": "type",
        "paramValue": "init",
        "type": "EQUALS"
      }
    ]
  },
  {
    "defaultValue": false,
    "simpleValueType": true,
    "name": "enableClIdInCookies",
    "checkboxText": "Enable Client ID in cookies (share clientId across subdomains)",
    "type": "CHECKBOX",
    "enablingConditions": [
      {
        "paramName": "type",
        "paramValue": "init",
        "type": "EQUALS"
      }
    ]
  },
  {
    "enablingConditions": [
      {
        "paramName": "type",
        "paramValue": "init",
        "type": "EQUALS"
      }
    ],
    "displayName": "Device Metadata (optional)",
    "name": "deviceMetadataGroup",
    "groupStyle": "ZIPPY_CLOSED",
    "type": "GROUP",
    "subParams": [
      {
        "displayName": "Device Brand",
        "simpleValueType": true,
        "name": "deviceBrand",
        "type": "TEXT",
        "valueHint": "e.g. Apple, Samsung SmartTV"
      },
      {
        "displayName": "Device Manufacturer",
        "simpleValueType": true,
        "name": "deviceManufacturer",
        "type": "TEXT",
        "valueHint": "e.g. Samsung, Apple"
      },
      {
        "displayName": "Device Model",
        "simpleValueType": true,
        "name": "deviceModel",
        "type": "TEXT",
        "valueHint": "e.g. iPhone 6 Plus, MacBookPro"
      },
      {
        "displayName": "Device Type",
        "simpleValueType": true,
        "name": "deviceType",
        "type": "SELECT",
        "defaultValue": "",
        "selectItems": [
          { "displayValue": "", "value": "" },
          { "displayValue": "Desktop", "value": "DESKTOP" },
          { "displayValue": "Games Console", "value": "Console" },
          { "displayValue": "Set Top Box", "value": "Settop" },
          { "displayValue": "Mobile", "value": "Mobile" },
          { "displayValue": "Tablet", "value": "Tablet" },
          { "displayValue": "Smart TV", "value": "SmartTV" },
          { "displayValue": "Vehicle", "value": "Vehicle" },
          { "displayValue": "Other", "value": "Other" }
        ]
      },
      {
        "displayName": "Device Version",
        "simpleValueType": true,
        "name": "deviceVersion",
        "type": "TEXT",
        "valueHint": "e.g. NAForMac"
      },
      {
        "displayName": "Operating System Name",
        "simpleValueType": true,
        "name": "deviceOsName",
        "type": "TEXT",
        "valueHint": "e.g. MAC, WINDOWS, LINUX, IOS, ANDROID"
      },
      {
        "displayName": "Operating System Version",
        "simpleValueType": true,
        "name": "deviceOsVersion",
        "type": "TEXT",
        "valueHint": "e.g. 10.13.6, 8.1"
      },
      {
        "displayName": "Device Category",
        "simpleValueType": true,
        "name": "deviceCategory",
        "type": "SELECT",
        "defaultValue": "",
        "selectItems": [
          { "displayValue": "", "value": "" },
          { "displayValue": "Android Device (AND)", "value": "AND" },
          { "displayValue": "Apple Device (APL)", "value": "APL" },
          { "displayValue": "Chromecast (CHR)", "value": "CHR" },
          { "displayValue": "Desktop App (DSKAPP)", "value": "DSKAPP" },
          { "displayValue": "Device Simulator (SIMULATOR)", "value": "SIMULATOR" },
          { "displayValue": "LG TV (LGTV)", "value": "LGTV" },
          { "displayValue": "Nintendo (NINTENDO)", "value": "NINTENDO" },
          { "displayValue": "PlayStation (PS)", "value": "PS" },
          { "displayValue": "Roku (RK)", "value": "RK" },
          { "displayValue": "Samsung TV (SAMSUNGTV)", "value": "SAMSUNGTV" },
          { "displayValue": "Smart TV (TV)", "value": "TV" },
          { "displayValue": "Set Top Box (STB)", "value": "STB" },
          { "displayValue": "TiVo (TIVO)", "value": "TIVO" },
          { "displayValue": "Web (WEB)", "value": "WEB" },
          { "displayValue": "Windows Device (WIN)", "value": "WIN" },
          { "displayValue": "Xbox (XB)", "value": "XB" },
          { "displayValue": "KaiOS Device (KAIOS)", "value": "KAIOS" },
          { "displayValue": "Linux (LNX)", "value": "LNX" }
        ]
      },
      {
        "displayName": "Framework Name",
        "simpleValueType": true,
        "name": "deviceFrameworkName",
        "type": "TEXT",
        "valueHint": "e.g. Web"
      },
      {
        "displayName": "Framework Version",
        "simpleValueType": true,
        "name": "deviceFrameworkVersion",
        "type": "TEXT",
        "valueHint": "e.g. 1.0.0"
      }
    ]
  },
  {
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "displayName": "User ID*",
    "simpleValueType": true,
    "name": "setUserId",
    "type": "TEXT",
    "enablingConditions": [
      {
        "paramName": "type",
        "paramValue": "setUserId",
        "type": "EQUALS"
      }
    ]
  },
  {
    "displayName": "Page Title Override",
    "simpleValueType": true,
    "name": "trackPageViewTitle",
    "type": "TEXT",
    "enablingConditions": [
      {
        "paramName": "type",
        "paramValue": "trackPageView",
        "type": "EQUALS"
      }
    ]
  },
  {
    "defaultValue": true,
    "simpleValueType": true,
    "name": "trackPageViewOnlyIfInitialized",
    "checkboxText": "Only fire if initialized",
    "type": "CHECKBOX",
    "enablingConditions": [
      {
        "paramName": "type",
        "paramValue": "trackPageView",
        "type": "EQUALS"
      }
    ]
  },
  {
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "displayName": "Event Name*",
    "simpleValueType": true,
    "name": "eventName",
    "type": "TEXT",
    "enablingConditions": [
      {
        "paramName": "type",
        "paramValue": "trackCustomEvent",
        "type": "EQUALS"
      }
    ]
  },
  {
    "displayName": "Event Data",
    "name": "eventData",
    "simpleTableColumns": [
      {
        "defaultValue": "",
        "displayName": "Name",
        "name": "name",
        "type": "TEXT"
      },
      {
        "defaultValue": "",
        "displayName": "Value",
        "name": "value",
        "type": "TEXT"
      }
    ],
    "type": "SIMPLE_TABLE",
    "newRowButtonText": "Add Property",
    "enablingConditions": [
      {
        "paramName": "type",
        "paramValue": "trackCustomEvent",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "SELECT",
    "name": "eventDataObject",
    "displayName": "Event Data Object (variable)",
    "macrosInSelect": true,
    "selectItems": [],
    "simpleValueType": true,
    "help": "Optional: select a GTM variable that returns an object. Merged with table above if both set.",
    "notSetText": "Don't set",
    "enablingConditions": [
      {
        "paramName": "type",
        "paramValue": "trackCustomEvent",
        "type": "EQUALS"
      }
    ]
  },
  {
    "defaultValue": true,
    "simpleValueType": true,
    "name": "trackCustomEventOnlyIfInitialized",
    "checkboxText": "Only fire if initialized",
    "type": "CHECKBOX",
    "enablingConditions": [
      {
        "paramName": "type",
        "paramValue": "trackCustomEvent",
        "type": "EQUALS"
      }
    ]
  },
  {
    "help": "Total order amount (required for revenue metrics).",
    "valueValidators": [{ "type": "NON_EMPTY" }],
    "displayName": "Total order amount*",
    "simpleValueType": true,
    "name": "revenueTotalOrderAmount",
    "type": "TEXT",
    "valueHint": "e.g. 99.99",
    "enablingConditions": [
      { "paramName": "type", "paramValue": "trackRevenue", "type": "EQUALS" }
    ]
  },
  {
    "help": "Order ID / transaction ID (required).",
    "valueValidators": [{ "type": "NON_EMPTY" }],
    "displayName": "Order ID (transaction ID)*",
    "simpleValueType": true,
    "name": "revenueOrderId",
    "type": "TEXT",
    "valueHint": "e.g. ord_12345",
    "enablingConditions": [
      { "paramName": "type", "paramValue": "trackRevenue", "type": "EQUALS" }
    ]
  },
  {
    "displayName": "Currency",
    "simpleValueType": true,
    "name": "revenueCurrency",
    "type": "TEXT",
    "valueHint": "e.g. USD",
    "enablingConditions": [
      { "paramName": "type", "paramValue": "trackRevenue", "type": "EQUALS" }
    ]
  },
  {
    "displayName": "Tax amount",
    "simpleValueType": true,
    "name": "revenueTaxAmount",
    "type": "TEXT",
    "enablingConditions": [
      { "paramName": "type", "paramValue": "trackRevenue", "type": "EQUALS" }
    ]
  },
  {
    "displayName": "Shipping cost",
    "simpleValueType": true,
    "name": "revenueShippingCost",
    "type": "TEXT",
    "enablingConditions": [
      { "paramName": "type", "paramValue": "trackRevenue", "type": "EQUALS" }
    ]
  },
  {
    "displayName": "Discount / coupon value",
    "simpleValueType": true,
    "name": "revenueDiscount",
    "type": "TEXT",
    "enablingConditions": [
      { "paramName": "type", "paramValue": "trackRevenue", "type": "EQUALS" }
    ]
  },
  {
    "displayName": "Cart size (number of items)",
    "simpleValueType": true,
    "name": "revenueCartSize",
    "type": "TEXT",
    "valueHint": "e.g. 3",
    "enablingConditions": [
      { "paramName": "type", "paramValue": "trackRevenue", "type": "EQUALS" }
    ]
  },
  {
    "type": "SELECT",
    "name": "revenueItemsList",
    "displayName": "Purchased items (variable)",
    "macrosInSelect": true,
    "selectItems": [],
    "simpleValueType": true,
    "notSetText": "Don't set",
    "help": "GTM variable that returns an array of line-item objects. Passed through as-is to the event. Recommended keys per item (for backend): productId, name, sku, category, unitPrice, quantity, discount, brand, variant; other keys are sent as-is and can be mapped in the backend.",
    "enablingConditions": [
      { "paramName": "type", "paramValue": "trackRevenue", "type": "EQUALS" }
    ]
  },
  {
    "displayName": "Payment method",
    "simpleValueType": true,
    "name": "revenuePaymentMethod",
    "type": "TEXT",
    "valueHint": "e.g. card, ApplePay, PayPal",
    "enablingConditions": [
      { "paramName": "type", "paramValue": "trackRevenue", "type": "EQUALS" }
    ]
  },
  {
    "displayName": "Payment provider",
    "simpleValueType": true,
    "name": "revenuePaymentProvider",
    "type": "TEXT",
    "valueHint": "e.g. Stripe, Adyen",
    "enablingConditions": [
      { "paramName": "type", "paramValue": "trackRevenue", "type": "EQUALS" }
    ]
  },
  {
    "displayName": "Order status",
    "simpleValueType": true,
    "name": "revenueOrderStatus",
    "type": "TEXT",
    "enablingConditions": [
      { "paramName": "type", "paramValue": "trackRevenue", "type": "EQUALS" }
    ]
  },
  {
    "displayName": "Additional metadata",
    "name": "revenueExtraMetadata",
    "simpleTableColumns": [
      { "defaultValue": "", "displayName": "Key", "name": "key", "type": "TEXT" },
      { "defaultValue": "", "displayName": "Value", "name": "value", "type": "TEXT" }
    ],
    "type": "SIMPLE_TABLE",
    "newRowButtonText": "Add row",
    "help": "Extra key/value pairs to include in the revenue event payload.",
    "enablingConditions": [
      { "paramName": "type", "paramValue": "trackRevenue", "type": "EQUALS" }
    ]
  },
  {
    "type": "SELECT",
    "name": "revenueDataObject",
    "displayName": "Revenue data object (variable)",
    "macrosInSelect": true,
    "selectItems": [],
    "simpleValueType": true,
    "help": "Optional: GTM variable returning an object. Merged with the fields above.",
    "notSetText": "Don't set",
    "enablingConditions": [
      { "paramName": "type", "paramValue": "trackRevenue", "type": "EQUALS" }
    ]
  },
  {
    "defaultValue": true,
    "simpleValueType": true,
    "name": "trackRevenueOnlyIfInitialized",
    "checkboxText": "Only fire if initialized",
    "type": "CHECKBOX",
    "enablingConditions": [
      { "paramName": "type", "paramValue": "trackRevenue", "type": "EQUALS" }
    ]
  },
  {
    "displayName": "Custom Tags",
    "name": "setCustomTagsTable",
    "simpleTableColumns": [
      {
        "defaultValue": "",
        "displayName": "Key",
        "name": "key",
        "type": "TEXT"
      },
      {
        "defaultValue": "",
        "displayName": "Value",
        "name": "value",
        "type": "TEXT"
      }
    ],
    "type": "SIMPLE_TABLE",
    "newRowButtonText": "Add Tag",
    "enablingConditions": [
      {
        "paramName": "type",
        "paramValue": "setCustomTags",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "SELECT",
    "name": "setCustomTagsObject",
    "displayName": "Custom Tags (variable)",
    "macrosInSelect": true,
    "selectItems": [],
    "simpleValueType": true,
    "help": "Optional: select a GTM variable that returns an object (e.g. {{Conviva – Custom Tags}}). Merged with the table above if both set.",
    "notSetText": "Don't set",
    "enablingConditions": [
      {
        "paramName": "type",
        "paramValue": "setCustomTags",
        "type": "EQUALS"
      }
    ]
  },
  {
    "help": "Comma-separated list of tag keys to unset, e.g. tagKey1, tagKey2",
    "displayName": "Tag Keys to Unset",
    "simpleValueType": true,
    "name": "unsetCustomTagsKeys",
    "type": "TEXT",
    "enablingConditions": [
      {
        "paramName": "type",
        "paramValue": "unsetCustomTags",
        "type": "EQUALS"
      }
    ]
  },
  {
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "displayName": "Error Message*",
    "simpleValueType": true,
    "name": "trackErrorMessage",
    "type": "TEXT",
    "enablingConditions": [
      {
        "paramName": "type",
        "paramValue": "trackError",
        "type": "EQUALS"
      }
    ]
  },
  {
    "displayName": "Filename (optional)",
    "simpleValueType": true,
    "name": "trackErrorFilename",
    "type": "TEXT",
    "enablingConditions": [
      {
        "paramName": "type",
        "paramValue": "trackError",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "SELECT",
    "name": "trackErrorObject",
    "displayName": "Error object (variable)",
    "macrosInSelect": true,
    "selectItems": [],
    "simpleValueType": true,
    "notSetText": "Don't set",
    "enablingConditions": [
      {
        "paramName": "type",
        "paramValue": "trackError",
        "type": "EQUALS"
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___
// APIs
const copyFromWindow = require('copyFromWindow');
const getType = require('getType');
const injectScript = require('injectScript');
const log = require('logToConsole');
const makeTableMap = require('makeTableMap');
const JSON = require('JSON');
const Object = require('Object');

// Constants – Conviva script creates window.apptracker; Conviva-hosted URL built from version (jsDelivr CDN)
const CONVIVA_SCRIPT_BASE = 'https://cdn.jsdelivr.net/gh/Conviva/conviva-js-script-appanalytics@';
const CONVIVA_SCRIPT_FILE = '/convivaAppTracker.js';
const DEFAULT_VERSION = '1.5.5';
const TRACKER_NAMESPACE = 'apptracker';
const LOG_PREFIX = '[Conviva AppAnalytics / GTM] ';
// Cohort Replay – must load and init before main SDK (same jsDelivr pattern)
const REPLAY_SCRIPT_BASE = 'https://cdn.jsdelivr.net/gh/Conviva/conviva-js-replay@';
const REPLAY_SCRIPT_FILE = '/conviva-replay.umd.min.js';
const REPLAY_DEFAULT_VERSION = '1.0.1';
const REPLAY_NAMESPACE = 'ConvivaReplay';

const fail = function(msg) {
  log(LOG_PREFIX + 'Error: ' + msg);
  return data.gtmOnFailure();
};

const isObject = function(input) {
  return input !== null && getType(input) === 'object';
};

// Parse comma-separated keys into array of trimmed strings
const stringToArrayAndTrim = function(str) {
  if (!str || typeof str !== 'string') return [];
  return str.split(',').map(function(s) { return s.trim(); }).filter(function(s) { return s !== ''; });
};

const onScriptFailure = function() {
  return fail('Failed to load Conviva AppAnalytics script');
};

const onReplayFailure = function() {
  return fail('Failed to load Conviva Replay script');
};

const runNonInit = function() {
  const tracker = copyFromWindow(TRACKER_NAMESPACE);
  if (!tracker || typeof tracker !== 'function') {
    return fail('Conviva tracker not found. Ensure the Initialize tag has run.');
  }

  switch (data.type) {
    case 'setUserId':
      tracker('setUserId', data.setUserId);
      break;
    case 'trackPageView':
      if (data.trackPageViewTitle) {
        tracker('trackPageView', { title: data.trackPageViewTitle });
      } else {
        tracker('trackPageView');
      }
      break;
    case 'trackCustomEvent': {
      const tableData = makeTableMap(data.eventData || [], 'name', 'value');
      let eventDataObj = tableData && isObject(tableData) ? tableData : {};
      if (data.eventDataObject && isObject(data.eventDataObject)) {
        const obj = data.eventDataObject;
        for (var k in obj) { if (obj.hasOwnProperty(k)) eventDataObj[k] = obj[k]; }
      }
      tracker('trackCustomEvent', { name: data.eventName, data: eventDataObj });
      break;
    }
    case 'trackRevenue': {
      const revenueData = {};
      revenueData.transactionId = data.revenueOrderId;
      revenueData.totalOrderAmount = data.revenueTotalOrderAmount;
      if (data.revenueCurrency) revenueData.currency = data.revenueCurrency;
      if (data.revenueTaxAmount) revenueData.taxAmount = data.revenueTaxAmount;
      if (data.revenueShippingCost) revenueData.shippingCost = data.revenueShippingCost;
      if (data.revenueDiscount) revenueData.discount = data.revenueDiscount;
      if (data.revenueCartSize) revenueData.cartSize = data.revenueCartSize;
      if (data.revenuePaymentMethod) revenueData.paymentMethod = data.revenuePaymentMethod;
      if (data.revenuePaymentProvider) revenueData.paymentProvider = data.revenuePaymentProvider;
      if (data.revenueOrderStatus) revenueData.orderStatus = data.revenueOrderStatus;
      if (data.revenueItemsList && getType(data.revenueItemsList) === 'array' && data.revenueItemsList.length > 0) {
        revenueData.items = data.revenueItemsList;
      }
      var extraMeta = makeTableMap(data.revenueExtraMetadata || [], 'key', 'value');
      if (extraMeta && isObject(extraMeta) && Object.keys(extraMeta).length > 0) {
        for (var ek in extraMeta) { if (extraMeta.hasOwnProperty(ek)) revenueData[ek] = extraMeta[ek]; }
      }
      if (data.revenueDataObject && isObject(data.revenueDataObject)) {
        var robj = data.revenueDataObject;
        for (var rk in robj) { if (robj.hasOwnProperty(rk)) revenueData[rk] = robj[rk]; }
      }
      tracker('trackCustomEvent', { name: 'conviva_revenue_event', data: revenueData });
      break;
    }
    case 'setCustomTags': {
      var tags = makeTableMap(data.setCustomTagsTable || [], 'key', 'value') || {};
      if (!isObject(tags)) tags = {};
      if (data.setCustomTagsObject && isObject(data.setCustomTagsObject)) {
        var cobj = data.setCustomTagsObject;
        for (var ck in cobj) { if (cobj.hasOwnProperty(ck)) tags[ck] = cobj[ck]; }
      }
      if (Object.keys(tags).length > 0) tracker('setCustomTags', tags);
      break;
    }
    case 'unsetCustomTags': {
      const keys = stringToArrayAndTrim(data.unsetCustomTagsKeys || '');
      if (keys.length > 0) tracker('unsetCustomTags', keys);
      break;
    }
    case 'trackError': {
      const errPayload = { message: data.trackErrorMessage };
      if (data.trackErrorFilename) errPayload.filename = data.trackErrorFilename;
      if (data.trackErrorObject != null) errPayload.error = data.trackErrorObject;
      tracker('trackError', errPayload);
      break;
    }
    default:
      return fail('Unknown tag type: ' + data.type);
  }
  data.gtmOnSuccess();
};

// Build init config: appId, convivaCustomerKey, appVersion, optional enableClIdInCookies, optional deviceMetadata
const buildInitConfig = function() {
  const config = {
    appId: data.appId,
    convivaCustomerKey: data.convivaCustomerKey,
    appVersion: data.appVersion || undefined
  };
  if (data.enableClIdInCookies === true) {
    config.enableClIdInCookies = true;
  }
  const deviceMetadata = {};
  if (data.deviceBrand) deviceMetadata.DeviceBrand = data.deviceBrand;
  if (data.deviceManufacturer) deviceMetadata.DeviceManufacturer = data.deviceManufacturer;
  if (data.deviceModel) deviceMetadata.DeviceModel = data.deviceModel;
  if (data.deviceType) deviceMetadata.DeviceType = data.deviceType;
  if (data.deviceVersion) deviceMetadata.DeviceVersion = data.deviceVersion;
  if (data.deviceOsName) deviceMetadata.OperatingSystemName = data.deviceOsName;
  if (data.deviceOsVersion) deviceMetadata.OperatingSystemVersion = data.deviceOsVersion;
  if (data.deviceCategory) deviceMetadata.DeviceCategory = data.deviceCategory;
  if (data.deviceFrameworkName) deviceMetadata.FrameworkName = data.deviceFrameworkName;
  if (data.deviceFrameworkVersion) deviceMetadata.FrameworkVersion = data.deviceFrameworkVersion;
  if (Object.keys(deviceMetadata).length > 0) config.deviceMetadata = deviceMetadata;
  return config;
};

const onScriptSuccess = function() {
  const tracker = copyFromWindow(TRACKER_NAMESPACE);
  if (!tracker || typeof tracker !== 'function') return fail('Conviva tracker not loaded');

  // Init: call convivaAppTracker with config, then optional setUserId and setCustomTags
  tracker('convivaAppTracker', buildInitConfig());

  if (data.initUserId) tracker('setUserId', data.initUserId);
  const initTags = makeTableMap(data.initCustomTags || [], 'key', 'value');
  if (initTags && isObject(initTags) && Object.keys(initTags).length > 0) tracker('setCustomTags', initTags);

  data.gtmOnSuccess();
};

if (data.type === 'init') {
  var scriptUrl;
  if (data.scriptSource === 'customer_hosted') {
    scriptUrl = data.scriptUrl;
    if (!scriptUrl) return fail('Script URL is required for Customer-hosted source');
  } else {
    var version = (data.scriptVersionCustom && data.scriptVersionCustom.trim() !== '') ? data.scriptVersionCustom.trim() : (data.scriptVersion || DEFAULT_VERSION);
    scriptUrl = CONVIVA_SCRIPT_BASE + version + CONVIVA_SCRIPT_FILE;
  }
  if (data.initWithCohortReplay === true) {
    var replayVersion = (data.replayScriptVersionCustom && data.replayScriptVersionCustom.trim() !== '') ? data.replayScriptVersionCustom.trim() : (data.replayScriptVersion || REPLAY_DEFAULT_VERSION);
    var replayUrl = REPLAY_SCRIPT_BASE + replayVersion + REPLAY_SCRIPT_FILE;
    var onReplaySuccess = function() {
      var ConvivaReplay = copyFromWindow(REPLAY_NAMESPACE);
      if (ConvivaReplay && typeof ConvivaReplay.init === 'function') {
        ConvivaReplay.init(data.convivaCustomerKey);
      }
      injectScript(scriptUrl, onScriptSuccess, onScriptFailure, 'conviva_appanalytics');
    };
    injectScript(replayUrl, onReplaySuccess, onReplayFailure, 'conviva_replay');
  } else {
    injectScript(scriptUrl, onScriptSuccess, onScriptFailure, 'conviva_appanalytics');
  }
} else {
  runNonInit();
}


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
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
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "apptracker"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  { "type": 1, "string": "key" },
                  { "type": 1, "string": "read" },
                  { "type": 1, "string": "execute" }
                ],
                "mapValue": [
                  { "type": 1, "string": "ConvivaReplay" },
                  { "type": 8, "boolean": true },
                  { "type": 8, "boolean": true }
                ]
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
  },
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://cdn.jsdelivr.net/gh/Conviva/conviva-js-script-appanalytics/*"
              },
              {
                "type": 1,
                "string": "https://cdn.jsdelivr.net/gh/Conviva/conviva-js-replay/*"
              },
              {
                "type": 1,
                "string": "https://*.conviva.com/*"
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

setup: "const mockData = {};"
scenarios:
- name: Init tag loads script and calls convivaAppTracker
  code: |-
    mockData.type = 'init';
    mockData.convivaCustomerKey = 'test_customer_key';
    mockData.appId = 'WEB App';
    mockData.appVersion = '1.0.0';
    mockData.scriptSource = 'conviva_hosted';

    var injectUrl;
    var onSuccess;
    mock('injectScript', function(url, success, failure) {
      injectUrl = url;
      onSuccess = success;
      success();
    });
    mock('copyFromWindow', function(key) {
      return function(cmd, arg) {
        if (cmd === 'convivaAppTracker') {
          assertThat(arg.appId).isEqualTo('WEB App');
          assertThat(arg.convivaCustomerKey).isEqualTo('test_customer_key');
          assertThat(arg.appVersion).isEqualTo('1.0.0');
        }
      };
    });

    runCode(mockData);
    assertApi('gtmOnSuccess').wasCalled();
- name: setUserId tag calls tracker with setUserId
  code: |-
    mockData.type = 'setUserId';
    mockData.setUserId = 'user_123';
    mock('copyFromWindow', function(key) {
      return function(cmd, val) {
        assertThat(cmd).isEqualTo('setUserId');
        assertThat(val).isEqualTo('user_123');
      };
    });
    runCode(mockData);
    assertApi('gtmOnSuccess').wasCalled();
- name: trackPageView tag calls tracker with no arg
  code: |-
    mockData.type = 'trackPageView';
    mockData.trackPageViewTitle = '';
    mock('copyFromWindow', function(key) {
      return function(cmd, arg) {
        assertThat(cmd).isEqualTo('trackPageView');
        assertThat(arg).isEqualTo(undefined);
      };
    });
    runCode(mockData);
    assertApi('gtmOnSuccess').wasCalled();
- name: trackPageView with title override
  code: |-
    mockData.type = 'trackPageView';
    mockData.trackPageViewTitle = 'My Page';
    mock('copyFromWindow', function(key) {
      return function(cmd, arg) {
        assertThat(cmd).isEqualTo('trackPageView');
        assertThat(arg).isEqualTo({ title: 'My Page' });
      };
    });
    runCode(mockData);
    assertApi('gtmOnSuccess').wasCalled();
- name: trackCustomEvent tag calls tracker with name and data
  code: |-
    mockData.type = 'trackCustomEvent';
    mockData.eventName = 'test_event';
    mockData.eventData = [{ name: 'k', value: 'v' }];
    mock('copyFromWindow', function(key) {
      return function(cmd, arg) {
        assertThat(cmd).isEqualTo('trackCustomEvent');
        assertThat(arg.name).isEqualTo('test_event');
        assertThat(arg.data).isEqualTo({ k: 'v' });
      };
    });
    runCode(mockData);
    assertApi('gtmOnSuccess').wasCalled();
- name: trackRevenue tag calls tracker with conviva_revenue_event
  code: |-
    mockData.type = 'trackRevenue';
    mockData.revenueOrderId = 'ord_123';
    mockData.revenueTotalOrderAmount = '99.99';
    mockData.revenueCurrency = 'USD';
    mock('copyFromWindow', function(key) {
      return function(cmd, arg) {
        assertThat(cmd).isEqualTo('trackCustomEvent');
        assertThat(arg.name).isEqualTo('conviva_revenue_event');
        assertThat(arg.data.transactionId).isEqualTo('ord_123');
        assertThat(arg.data.totalOrderAmount).isEqualTo('99.99');
        assertThat(arg.data.currency).isEqualTo('USD');
      };
    });
    runCode(mockData);
    assertApi('gtmOnSuccess').wasCalled();
- name: setCustomTags tag calls tracker with tags object
  code: |-
    mockData.type = 'setCustomTags';
    mockData.setCustomTagsTable = [{ key: 'a', value: '1' }];
    mock('copyFromWindow', function(key) {
      return function(cmd, arg) {
        assertThat(cmd).isEqualTo('setCustomTags');
        assertThat(arg).isEqualTo({ a: '1' });
      };
    });
    runCode(mockData);
    assertApi('gtmOnSuccess').wasCalled();
- name: unsetCustomTags tag calls tracker with array of keys
  code: |-
    mockData.type = 'unsetCustomTags';
    mockData.unsetCustomTagsKeys = 'key1, key2';
    mock('copyFromWindow', function(key) {
      return function(cmd, arg) {
        assertThat(cmd).isEqualTo('unsetCustomTags');
        assertThat(arg).isEqualTo(['key1', 'key2']);
      };
    });
    runCode(mockData);
    assertApi('gtmOnSuccess').wasCalled();
- name: trackError tag calls tracker with message
  code: |-
    mockData.type = 'trackError';
    mockData.trackErrorMessage = 'Test error';
    mock('copyFromWindow', function(key) {
      return function(cmd, arg) {
        assertThat(cmd).isEqualTo('trackError');
        assertThat(arg.message).isEqualTo('Test error');
      };
    });
    runCode(mockData);
    assertApi('gtmOnSuccess').wasCalled();
- name: Non-init tag when tracker missing fails
  code: |-
    mockData.type = 'trackPageView';
    mock('copyFromWindow', function(key) {
      return undefined;
    });
    runCode(mockData);
    assertApi('gtmOnFailure').wasCalled();


___NOTES___

Conviva AppAnalytics GTM Template. Created for Community Template Gallery.
