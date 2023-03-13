//
//  SelectLIstItemView.swift
//  CurrencyConverterSwiftUI
//
//  Created by Sasith Priyankara on 13/3/23.
//

import SwiftUI

/*
 *  Showing single list item for currency code and name. 
 */

struct SelectLIstItemView: View {
    
    var code : String
    var currency : String
    
    var body: some View {
        // "PLACEHOLDER"s change on runtime. (added just for more visibility)
        HStack {
            Text("\(code) - \(currency)")
            Spacer()
        }
    }
}

struct SelectLIstItemView_Previews: PreviewProvider {
        
    static var previews: some View {
        SelectLIstItemView(code: "PLACEHOLDER", currency: "PLACEHOLDER")
    }
}
