//
//  CurrencyDataModel.swift
//  CurrencyConverterSwiftUI
//
//  Created by Sasith Priyankara on 12/3/23.
//

import Foundation

struct CurrencyItem: Identifiable, Hashable{
//    let id = UUID()
    var id: Int
    var code: String
    var currency: String
    var country: String
}
