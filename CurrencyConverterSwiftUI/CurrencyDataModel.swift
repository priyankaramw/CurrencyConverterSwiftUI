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
    var country: String
}
