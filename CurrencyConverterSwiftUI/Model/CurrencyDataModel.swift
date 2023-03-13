//
//  CurrencyDataModel.swift
//  CurrencyConverterSwiftUI
//
//  Created by Sasith Priyankara on 12/3/23.
//

import Foundation

/*
 *  Currency data model that includes country.
 */

struct CurrencyItem: Identifiable, Hashable{
    var id: Int
    var code: String
    var currency: String
    var country: String
}
