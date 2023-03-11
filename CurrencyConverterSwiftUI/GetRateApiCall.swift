//
//  GetRateApiCall.swift
//  CurrencyConverterSwiftUI
//
//  Created by Sasith Priyankara on 11/3/23.
//

//GET https://v6.exchangerate-api.com/v6/1c4fbaf27a0a42978eee5f1c/pair/EUR/GBP/AMOUNT

import Foundation
import SwiftUI

struct CurrencyPairRate: Codable {
    let base_code: String
    let target_code: String
    let conversion_rate: Double
    //let conversion_result: Double
}

struct GetRateApiCall: View {
    @State var baseCode: String = ""
    @State var quoteCode: String = ""
    
    @Binding var baseAmount: Double
    @Binding var quoteAmount: Double
    @Binding var conversionRate: Double
    
    var apiKey = "1c4fbaf27a0a42978eee5f1c"
    
    
    var body: some View {
        
        let customUrl = "https://v6.exchangerate-api.com/v6/\(apiKey)/pair/\(baseCode)/\(quoteCode)"
        
        // Unwrap below after completing. To save api calls.
        /*
         Text("\(baseCode)-\(quoteCode) - \(convertionRate), \(calculatedAmount)").task {
            Task {
                let (data, _) = try await URLSession.shared.data(from: URL(string:"https://v6.exchangerate-api.com/v6/1c4fbaf27a0a42978eee5f1c/pair/EUR/GBP/10")!)
                let decodedResponse = try? JSONDecoder().decode(CurrencyPairRate.self, from: data)
                baseCode = decodedResponse?.base_code ?? ""
                quoteCode = decodedResponse?.target_code ?? ""
                convertionRate = decodedResponse?.conversion_rate ?? 0.0
                calculatedAmount = decodedResponse?.conversion_result ?? 0.0
                
            }
        }
        */
        
        Text("\(baseCode)-\(quoteCode) - \(conversionRate)")
        Button {
            Task {
                let (data, _) = try await URLSession.shared.data(from: URL(string:"\(customUrl)")!)
                let decodedResponse = try? JSONDecoder().decode(CurrencyPairRate.self, from: data)
//                baseCode = decodedResponse?.base_code ?? ""
//                quoteCode = decodedResponse?.target_code ?? ""
                
//                baseAmount =
                conversionRate = decodedResponse?.conversion_rate ?? 0.0
            }
        } label: {
            Text("Calculate")
        }
    }
}


struct GetRateApiCall_Previews: PreviewProvider {
    @State static var baseCode = ""
    @State static var quoteCode = ""
    @State static var baseAmount = 0.0
    @State static var quoteAmount = 0.0
    @State static var conversionRate = 0.0
    
    static var previews: some View {
        GetRateApiCall(
            baseCode: baseCode,
            quoteCode: quoteCode,
            
            baseAmount: $baseAmount,
            quoteAmount: $quoteAmount,
            conversionRate: $conversionRate)
    }
}
