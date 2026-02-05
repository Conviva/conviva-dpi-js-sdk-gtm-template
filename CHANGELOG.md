# Changelog

All notable changes to the Conviva AppAnalytics GTM Template project are documented in this file.

## [1.0.0] - Initial release

### Added

- **Conviva AppAnalytics Browser SDK** tag type for Google Tag Manager.
- **Tag types:**
  - **Initialize (init)** – Load Conviva script (Conviva-hosted or Customer-hosted URL), initialize with Customer Key, App ID, App Version; optional User ID and default custom tags.
  - **Set User ID (setUserId)** – Set viewer/user ID.
  - **Track Page View (trackPageView)** – Send page view with optional title override; “Only fire if initialized” option.
  - **Track Custom Event (trackCustomEvent)** – Send custom event with name and optional data (table and/or variable); “Only fire if initialized” option.
  - **Set Custom Tags (setCustomTags)** – Set global key/value tags.
  - **Unset Custom Tags (unsetCustomTags)** – Remove tag keys (comma-separated).
  - **Track Error (trackError)** – Report error with message, optional filename, optional error object variable.
- Sandboxed JavaScript implementation using GTM APIs: `injectScript`, `copyFromWindow`, `makeTableMap`, `log`, `JSON`, `getType`.
- Web permissions: `inject_script` (Conviva/customer URLs), `access_globals` (read/execute `tracker`), optional logging.
- Unit tests for init, setUserId, trackPageView, trackCustomEvent, setCustomTags, unsetCustomTags, trackError, and failure when tracker not initialized.
- README with installation, tag types, recommended triggers, and links to SDK and Pulse.
- ConvivaLegalNotice.txt and metadata.yaml for Community Template Gallery submission.
