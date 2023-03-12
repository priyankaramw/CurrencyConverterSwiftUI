//
//  CurrencyDataModel.swift
//  CurrencyConverterSwiftUI
//
//  Created by Sasith Priyankara on 12/3/23.
//

import UIKit

class CurrencyDataModel: NSObject {

}

struct CurrencyItem: Identifiable, Hashable{
//    let id = UUID()
    var id: Int
    var code: String
    var currency: String
//    var flagEmoji: String
}

let currencyOptions = [
    CurrencyItem(id: 1, code: "AED", currency: "AE Dirham"),
    CurrencyItem(id: 2, code: "AFN", currency: "Afghan Afghani"),
    CurrencyItem(id: 3, code: "ALL", currency: "Albanian Lek"),
    CurrencyItem(id: 4, code: "AMD", currency: "Armenian Dram"),
    CurrencyItem(id: 5, code: "ANG", currency: "Netherlands Antillian Guilder"),
    CurrencyItem(id: 6, code: "AOA", currency: "Angolan Kwanza"),
    CurrencyItem(id: 7, code: "ARS", currency: "Argentine Peso"),
    CurrencyItem(id: 8, code: "AUD", currency: "Australian Dollar"),
    CurrencyItem(id: 9, code: "AWG", currency: "Aruban Florin"),
    CurrencyItem(id: 10, code: "AZN", currency: "Azerbaijani Manat"),
    CurrencyItem(id: 11, code: "BAM", currency: "Bosnia and Herzegovina Mark"),
    CurrencyItem(id: 12, code: "BBD", currency: "Barbados Dollar"),
    CurrencyItem(id: 13, code: "BDT", currency: "Bangladeshi Taka"),
    CurrencyItem(id: 14, code: "BGN", currency: "Bulgarian Lev"),
    CurrencyItem(id: 15, code: "BHD", currency: "Bahraini Dinar"),
    CurrencyItem(id: 16, code: "BIF", currency: "Burundian Franc"),
    CurrencyItem(id: 17, code: "BMD", currency: "Bermudian Dollar"),
    CurrencyItem(id: 18, code: "BND", currency: "Brunei Dollar"),
]
