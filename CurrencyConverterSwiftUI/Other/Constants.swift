//
//  Constants.swift
//  CurrencyConverterSwiftUI
//
//  Created by Sasith Priyankara on 12/3/23.
//

import Foundation

/*
 *  Constants.
 */


// Current API key for testing.
//var apiKey = "1c4fbaf27a0a42978eee5f1c"

// Un-used new API key for submision.
var apiKey = "Aa0d9833ad573f09811d60ea"


struct CurrencyPairRate: Codable {
    let result: String // "success" or "error"
    let conversion_rate: Double
}

var strFetchingErrorConst = "Fetching error."

var aboutTxt_title = "About"
var aboutTxt_1 = "This application has been made for Rakuten Viki as an assignment by Sasith Priyankara."

var instructionTxt_title = "Functionality"
var instructionTxt_1 = "Conversion works bi-directionally similar to the Google currency calculator."
var instructionTxt_2 = "Change of 'any amount' will reflect on other currency amount."
var instructionTxt_3 = "Change of the 'base currency code' will reflect on target currency amount."
var instructionTxt_4 = "But, change of 'target currency code' will reflect on its 'own amount'. (First amount remain intact)."
var instructionTxt_5 = "The 'Read more about [pair]' button redirects to respective google page for selected pair. (This is an additional work and not a requirement of the assignment)."

var systemTxt_title = "Currency Service"
var systemTxt_1 = "App uses https://app.exchangerate-api.com/ and, free license is being used."
var systemTxt_2 = "The app fetch conversion rate on app loading and on either currency code change only."

var thankTxt = "Thank you...!"

/*
 *  Please note that I have used this object list because I wanted to use the country name as well which is not provided by the API calls but on their website directly.
 *  This list is almost static. Only North Korea not privided.
 */

let currencyOptions = [
    CurrencyItem(id: 1, code: "AED", currency: "UAE Dirham", country: "United Arab Emirates"),
    CurrencyItem(id: 2, code: "AFN", currency: "Afghan Afghani", country: "Afghanistan"),
    CurrencyItem(id: 3, code: "ALL", currency: "Albanian Lek", country: "Albania"),
    CurrencyItem(id: 4, code: "AMD", currency: "Armenian Dram", country: "Armenia"),
    CurrencyItem(id: 5, code: "ANG", currency: "Netherlands Antillian Guilder", country: "Netherlands Antilles"),
    CurrencyItem(id: 6, code: "AOA", currency: "Angolan Kwanza", country: "Angola"),
    CurrencyItem(id: 7, code: "ARS", currency: "Argentine Peso", country: "Argentina"),
    CurrencyItem(id: 8, code: "AUD", currency: "Australian Dollar", country: "Australia"),
    CurrencyItem(id: 9, code: "AWG", currency: "Aruban Florin", country: "Aruba"),
    CurrencyItem(id: 10, code: "AZN", currency: "Azerbaijani Manat", country: "Azerbaijan"),
    CurrencyItem(id: 11, code: "BAM", currency: "Bosnia and Herzegovina Mark", country: "Bosnia and Herzegovina"),
    CurrencyItem(id: 12, code: "BBD", currency: "Barbados Dollar", country: "Barbados"),
    CurrencyItem(id: 13, code: "BDT", currency: "Bangladeshi Taka", country: "Bangladesh"),
    CurrencyItem(id: 14, code: "BGN", currency: "Bulgarian Lev", country: "Bulgaria"),
    CurrencyItem(id: 15, code: "BHD", currency: "Bahraini Dinar", country: "Bahrain"),
    CurrencyItem(id: 16, code: "BIF", currency: "Burundian Franc", country: "Burundi"),
    CurrencyItem(id: 17, code: "BMD", currency: "Bermudian Dollar", country: "Bermuda"),
    CurrencyItem(id: 18, code: "BND", currency: "Brunei Dollar", country: "Brunei"),
    CurrencyItem(id: 19, code: "BOB", currency: "Bolivian Boliviano", country: "Bolivia"),
    CurrencyItem(id: 20, code: "BRL", currency: "Brazilian Real", country: "Brazil"),
    CurrencyItem(id: 21, code: "BSD", currency: "Bahamian Dollar", country: "Bahamas"),
    CurrencyItem(id: 22, code: "BTN", currency: "Bhutanese Ngultrum", country: "Bhutan"),
    CurrencyItem(id: 23, code: "BWP", currency: "Botswana Pula", country: "Botswana"),
    CurrencyItem(id: 24, code: "BYN", currency: "Belarusian Ruble", country: "Belarus"),
    CurrencyItem(id: 25, code: "BZD", currency: "Belize Dollar", country: "Belize"),
    CurrencyItem(id: 26, code: "CAD", currency: "Canadian Dollar", country: "Canada"),
    CurrencyItem(id: 27, code: "CDF", currency: "Congolese Franc", country: "Democratic Republic of the Congo"),
    CurrencyItem(id: 28, code: "CHF", currency: "Swiss Franc", country: "Switzerland"),
    CurrencyItem(id: 29, code: "CLP", currency: "Chilean Peso", country: "Chile"),
    CurrencyItem(id: 30, code: "CNY", currency: "Chinese Renminbi", country: "China"),
    CurrencyItem(id: 31, code: "COP", currency: "Colombian Peso", country: "Colombia"),
    CurrencyItem(id: 32, code: "CRC", currency: "Costa Rican Colon", country: "Costa Rica"),
    CurrencyItem(id: 33, code: "CUP", currency: "Cuban Peso", country: "Cuba"),
    CurrencyItem(id: 34, code: "CVE", currency: "Cape Verdean Escudo", country: "Cape Verde"),
    CurrencyItem(id: 35, code: "CZK", currency: "Czech Koruna", country: "Czech Republic"),
    CurrencyItem(id: 36, code: "DJF", currency: "Djiboutian Franc", country: "Djibouti"),
    CurrencyItem(id: 37, code: "DKK", currency: "Danish Krone", country: "Denmark"),
    CurrencyItem(id: 38, code: "DOP", currency: "Dominican Peso", country: "Dominican Republic"),
    CurrencyItem(id: 39, code: "DZD", currency: "Algerian Dinar", country: "Algeria"),
    CurrencyItem(id: 40, code: "EGP", currency: "Egyptian Pound", country: "Egypt"),
    CurrencyItem(id: 41, code: "ERN", currency: "Eritrean Nakfa", country: "Eritrea"),
    CurrencyItem(id: 42, code: "ETB", currency: "Ethiopian Birr", country: "Ethiopia"),
    CurrencyItem(id: 43, code: "EUR", currency: "Euro", country: "European Union"),
    CurrencyItem(id: 44, code: "FJD", currency: "Fiji Dollar", country: "Fiji"),
    CurrencyItem(id: 45, code: "FKP", currency: "Falkland Islands Pound", country: "Falkland Islands"),
    CurrencyItem(id: 46, code: "FOK", currency: "Faroese Króna", country: "Faroe Islands"),
    CurrencyItem(id: 47, code: "GBP", currency: "Pound Sterling", country: "United Kingdom"),
    CurrencyItem(id: 48, code: "GEL", currency: "Georgian Lari", country: "Georgia"),
    CurrencyItem(id: 49, code: "GGP", currency: "Guernsey Pound", country: "Guernsey"),
    CurrencyItem(id: 50, code: "GHS", currency: "Ghanaian Cedi", country: "Ghana"),
    CurrencyItem(id: 51, code: "GIP", currency: "Gibraltar Pound", country: "Gibraltar"),
    CurrencyItem(id: 52, code: "GMD", currency: "Gambian Dalasi", country: "The Gambia"),
    CurrencyItem(id: 53, code: "GNF", currency: "Guinean Franc", country: "Guinea"),
    CurrencyItem(id: 54, code: "GTQ", currency: "Guatemalan Quetzal", country: "Guatemala"),
    CurrencyItem(id: 55, code: "GYD", currency: "Guyanese Dollar", country: "Guyana"),
    CurrencyItem(id: 56, code: "HKD", currency: "Hong Kong Dollar", country: "Hong Kong"),
    CurrencyItem(id: 57, code: "HNL", currency: "Honduran Lempira", country: "Honduras"),
    CurrencyItem(id: 58, code: "HRK", currency: "Croatian Kuna", country: "Croatia"),
    CurrencyItem(id: 59, code: "HTG", currency: "Haitian Gourde", country: "Haiti"),
    CurrencyItem(id: 60, code: "HUF", currency: "Hungarian Forint", country: "Hungary"),
    CurrencyItem(id: 61, code: "IDR", currency: "Indonesian Rupiah", country: "Indonesia"),
    CurrencyItem(id: 62, code: "ILS", currency: "Israeli New Shekel", country: "Israel"),
    CurrencyItem(id: 63, code: "IMP", currency: "Manx Pound", country: "Isle of Man"),
    CurrencyItem(id: 64, code: "INR", currency: "Indian Rupee", country: "India"),
    CurrencyItem(id: 65, code: "IQD", currency: "Iraqi Dinar", country: "Iraq"),
    CurrencyItem(id: 66, code: "IRR", currency: "Iranian Rial", country: "Iran"),
    CurrencyItem(id: 67, code: "ISK", currency: "Icelandic Króna", country: "Iceland"),
    CurrencyItem(id: 68, code: "JEP", currency: "Jersey Pound", country: "Jersey"),
    CurrencyItem(id: 69, code: "JMD", currency: "Jamaican Dollar", country: "Jamaica"),
    CurrencyItem(id: 70, code: "JOD", currency: "Jordanian Dinar", country: "Jordan"),
    CurrencyItem(id: 71, code: "JPY", currency: "Japanese Yen", country: "Japan"),
    CurrencyItem(id: 72, code: "KES", currency: "Kenyan Shilling", country: "Kenya"),
    CurrencyItem(id: 73, code: "KGS", currency: "Kyrgyzstani Som", country: "Kyrgyzstan"),
    CurrencyItem(id: 74, code: "KHR", currency: "Cambodian Riel", country: "Cambodia"),
    CurrencyItem(id: 75, code: "KID", currency: "Kiribati Dollar", country: "Kiribati"),
    CurrencyItem(id: 76, code: "KMF", currency: "Comorian Franc", country: "Comoros"),
    CurrencyItem(id: 77, code: "KRW", currency: "South Korean Won", country: "South Korea"),
    CurrencyItem(id: 78, code: "KWD", currency: "Kuwaiti Dinar", country: "Kuwait"),
    CurrencyItem(id: 79, code: "KYD", currency: "Cayman Islands Dollar", country: "Cayman Islands"),
    CurrencyItem(id: 80, code: "KZT", currency: "Kazakhstani Tenge", country: "Kazakhstan"),
    CurrencyItem(id: 81, code: "LAK", currency: "Lao Kip", country: "Laos"),
    CurrencyItem(id: 82, code: "LBP", currency: "Lebanese Pound", country: "Lebanon"),
    CurrencyItem(id: 83, code: "LKR", currency: "Sri Lanka Rupee", country: "Sri Lanka"),
    CurrencyItem(id: 84, code: "LRD", currency: "Liberian Dollar", country: "Liberia"),
    CurrencyItem(id: 85, code: "LSL", currency: "Lesotho Loti", country: "Lesotho"),
    CurrencyItem(id: 86, code: "LYD", currency: "Libyan Dinar", country: "Libya"),
    CurrencyItem(id: 87, code: "MAD", currency: "Moroccan Dirham", country: "Morocco"),
    CurrencyItem(id: 88, code: "MDL", currency: "Moldovan Leu", country: "Moldova"),
    CurrencyItem(id: 89, code: "MGA", currency: "Malagasy Ariary", country: "Madagascar"),
    CurrencyItem(id: 90, code: "MKD", currency: "Macedonian Denar", country: "North Macedonia"),
    CurrencyItem(id: 91, code: "MMK", currency: "Burmese Kyat", country: "Myanmar"),
    CurrencyItem(id: 92, code: "MNT", currency: "Mongolian Tögrög", country: "Mongolia"),
    CurrencyItem(id: 93, code: "MOP", currency: "Macanese Pataca", country: "Macau"),
    CurrencyItem(id: 94, code: "MRU", currency: "Mauritanian Ouguiya", country: "Mauritania"),
    CurrencyItem(id: 95, code: "MUR", currency: "Mauritian Rupee", country: "Mauritius"),
    CurrencyItem(id: 96, code: "MVR", currency: "Maldivian Rufiyaa", country: "Maldives"),
    CurrencyItem(id: 97, code: "MWK", currency: "Malawian Kwacha", country: "Malawi"),
    CurrencyItem(id: 98, code: "MXN", currency: "Mexican Peso", country: "Mexico"),
    CurrencyItem(id: 99, code: "MYR", currency: "Malaysian Ringgit", country: "Malaysia"),
    CurrencyItem(id: 100, code: "MZN", currency: "Mozambican Metical", country: "Mozambique"),
    CurrencyItem(id: 101, code: "NAD", currency: "Namibian Dollar", country: "Namibia"),
    CurrencyItem(id: 102, code: "NGN", currency: "Nigerian Naira", country: "Nigeria"),
    CurrencyItem(id: 103, code: "NIO", currency: "Nicaraguan Córdoba", country: "Nicaragua"),
    CurrencyItem(id: 104, code: "NOK", currency: "Norwegian Krone", country: "Norway"),
    CurrencyItem(id: 105, code: "NPR", currency: "Nepalese Rupee", country: "Nepal"),
    CurrencyItem(id: 106, code: "NZD", currency: "New Zealand Dollar", country: "New Zealand"),
    CurrencyItem(id: 107, code: "OMR", currency: "Omani Rial", country: "Oman"),
    CurrencyItem(id: 108, code: "PAB", currency: "Panamanian Balboa", country: "Panama"),
    CurrencyItem(id: 109, code: "PEN", currency: "Peruvian Sol", country: "Peru"),
    CurrencyItem(id: 110, code: "PGK", currency: "Papua New Guinean Kina", country: "Papua New Guinea"),
    CurrencyItem(id: 111, code: "PHP", currency: "Philippine Peso", country: "Philippines"),
    CurrencyItem(id: 112, code: "PKR", currency: "Pakistani Rupee", country: "Pakistan"),
    CurrencyItem(id: 113, code: "PLN", currency: "Polish Złoty", country: "Poland"),
    CurrencyItem(id: 114, code: "PYG", currency: "Paraguayan Guaraní", country: "Paraguay"),
    CurrencyItem(id: 115, code: "QAR", currency: "Qatari Riyal", country: "Qatar"),
    CurrencyItem(id: 116, code: "RON", currency: "Romanian Leu", country: "Romania"),
    CurrencyItem(id: 117, code: "RSD", currency: "Serbian Dinar", country: "Serbia"),
    CurrencyItem(id: 118, code: "RUB", currency: "Russian Ruble", country: "Russia"),
    CurrencyItem(id: 119, code: "RWF", currency: "Rwandan Franc", country: "Rwanda"),
    CurrencyItem(id: 120, code: "SAR", currency: "Saudi Riyal", country: "Saudi Arabia"),
    CurrencyItem(id: 121, code: "SBD", currency: "Solomon Islands Dollar", country: "Solomon Islands"),
    CurrencyItem(id: 122, code: "SCR", currency: "Seychellois Rupee", country: "Seychelles"),
    CurrencyItem(id: 123, code: "SDG", currency: "Sudanese Pound", country: "Sudan"),
    CurrencyItem(id: 124, code: "SEK", currency: "Swedish Krona", country: "Sweden"),
    CurrencyItem(id: 125, code: "SGD", currency: "Singapore Dollar", country: "Singapore"),
    CurrencyItem(id: 126, code: "SHP", currency: "Saint Helena Pound", country: "Saint Helena"),
    CurrencyItem(id: 127, code: "SLE", currency: "Sierra Leonean Leone", country: "Sierra Leone"),
    CurrencyItem(id: 128, code: "SOS", currency: "Somali Shilling", country: "Somalia"),
    CurrencyItem(id: 129, code: "SRD", currency: "Surinamese Dollar", country: "Suriname"),
    CurrencyItem(id: 130, code: "SSP", currency: "South Sudanese Pound", country: "South Sudan"),
    CurrencyItem(id: 131, code: "STN", currency: "São Tomé and Príncipe Dobra", country: "São Tomé and Príncipe"),
    CurrencyItem(id: 132, code: "SYP", currency: "Syrian Pound", country: "Syria"),
    CurrencyItem(id: 133, code: "SZL", currency: "Eswatini Lilangeni", country: "Eswatini"),
    CurrencyItem(id: 134, code: "THB", currency: "Thai Baht", country: "Thailand"),
    CurrencyItem(id: 135, code: "TJS", currency: "Tajikistani Somoni", country: "Tajikistan"),
    CurrencyItem(id: 136, code: "TMT", currency: "Turkmenistan Manat", country: "Turkmenistan"),
    CurrencyItem(id: 137, code: "TND", currency: "Tunisian Dinar", country: "Tunisia"),
    CurrencyItem(id: 138, code: "TOP", currency: "Tongan Paʻanga", country: "Tonga"),
    CurrencyItem(id: 139, code: "TRY", currency: "Turkish Lira", country: "Turkey"),
    CurrencyItem(id: 140, code: "TTD", currency: "Trinidad and Tobago Dollar", country: "Trinidad and Tobago"),
    CurrencyItem(id: 141, code: "TVD", currency: "Tuvaluan Dollar", country: "Tuvalu"),
    CurrencyItem(id: 142, code: "TWD", currency: "New Taiwan Dollar", country: "Taiwan"),
    CurrencyItem(id: 143, code: "TZS", currency: "Tanzanian Shilling", country: "Tanzania"),
    CurrencyItem(id: 144, code: "UAH", currency: "Ukrainian Hryvnia", country: "Ukraine"),
    CurrencyItem(id: 145, code: "UGX", currency: "Ugandan Shilling", country: "Uganda"),
    CurrencyItem(id: 146, code: "USD", currency: "United States Dollar", country: "United States"),
    CurrencyItem(id: 147, code: "UYU", currency: "Uruguayan Peso", country: "Uruguay"),
    CurrencyItem(id: 148, code: "UZS", currency: "Uzbekistani So'm", country: "Uzbekistan"),
    CurrencyItem(id: 149, code: "VES", currency: "Venezuelan Bolívar Soberano", country: "Venezuela"),
    CurrencyItem(id: 150, code: "VND", currency: "Vietnamese Đồng", country: "Vietnam"),
    CurrencyItem(id: 151, code: "VUV", currency: "Vanuatu Vatu", country: "Vanuatu"),
    CurrencyItem(id: 152, code: "WST", currency: "Samoan Tālā", country: "Samoa"),
    CurrencyItem(id: 153, code: "XAF", currency: "Central African CFA Franc", country: "CEMAC"),
    CurrencyItem(id: 154, code: "XCD", currency: "East Caribbean Dollar", country: "Organisation of Eastern Caribbean States"),
    CurrencyItem(id: 155, code: "XDR", currency: "Special Drawing Rights", country: "International Monetary Fund"),
    CurrencyItem(id: 156, code: "XOF", currency: "West African CFA franc", country: "CFA"),
    CurrencyItem(id: 157, code: "XPF", currency: "CFP Franc", country: "Collectivités d'Outre-Mer"),
    CurrencyItem(id: 158, code: "YER", currency: "Yemeni Rial", country: "Yemen"),
    CurrencyItem(id: 159, code: "ZAR", currency: "South African Rand", country: "South Africa"),
    CurrencyItem(id: 160, code: "ZMW", currency: "Zambian Kwacha", country: "Zambia"),
    CurrencyItem(id: 161, code: "ZWL", currency: "Zimbabwean Dollar", country: "Zimbabwe"),
]


// Number formatter documentation
// https:developer.apple.com/documentation/swiftui/textfield/init(_:value:formatter:prompt:)-8kpfa





