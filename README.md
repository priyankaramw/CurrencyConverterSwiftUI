# CurrencyConverterSwiftUI

*   The currency conversion works bi-directionally.
*   Any change done to either section will reflect on other currency.
*   App uses https://app.exchangerate-api.com/ and, free license is being used.
*   The app sends API calls on view loading (once) and only on either currency code change.
*   If the currency codes are intact and only the amounts changed, it uses last fetched rate.
*   No use of fetching “on amounts only” changes since since API provides up to 24 hours accurate data.
*   The “Read more about [pair]” button redirects to respective google page for selected pair. (This is an additional work and not a requirement of the assignment).
*   SwiftUI is used for the development with Xcode version 14.2 (target SDK is latest by 12th March 2023).
*   This application has been made for Rakuten Viki as an assignment.\n\n© Sasith Priyankara.\n\n"
