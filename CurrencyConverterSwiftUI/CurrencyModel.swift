//
//  CurrencyModel.swift
//  CurrencyConverterSwiftUI
//
//  Created by Sasith Priyankara on 11/3/23.
//

import UIKit

struct CurrencyData: Hashable {
    var id: Int
    var code: String
    var description: String
}

class CurrencyModel: NSObject {
    static let currencyData: [CurrencyData] = [
        CurrencyData(id: 1, code: "USD", description: "United States Dollar"),
        CurrencyData(id: 2, code: "USD", description: "United States Dollar"),
    ]
}
