//
//  CurrencyListItem.swift
//  CurrencyConverterSwiftUI
//
//  Created by Sasith Priyankara on 10/3/23.
//

import SwiftUI

struct CurrencyListItem: View {
    var body: some View {
        HStack{
            Text("USD")
            Text(" - ")
            Text("United States Dollar")
        }
        
    }
}

struct CurrencyListItem_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyListItem()
    }
}
