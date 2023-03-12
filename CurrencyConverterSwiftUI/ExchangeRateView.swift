//
//  ExchangeRateView.swift
//  CurrencyConverterSwiftUI
//
//  Created by Sasith Priyankara on 12/3/23.
//

import SwiftUI

struct CurrencyPairRate: Codable {
//    let base_code: String
//    let target_code: String
    let conversion_rate: Double
}

struct ExchangeRateView: View {
    @Binding var baseCode: String
    @Binding var quoteCode: String
    
    @Binding var baseCodePrevious: String
    @Binding var quoteCodePrevious: String
    
    @Binding var baseAmount: Double
    @Binding var quoteAmount: Double
    
    @Binding var conversionRate: Double
    @Binding var conversionRatePrevious: Double
    
    @Binding var baseAmountPrevious : Double
    @Binding var quoteAmountPrevious : Double
    
    var body: some View {
        VStack{
            Button {
                calculate()
            } label: {
                Text("Calculate")
            }.padding()
            Text("\(baseCode) / \(quoteCode)")
            Text("\(conversionRate)")
            Text("\(baseAmount) | \(baseAmountPrevious)")
            Text("\(quoteAmount) | \(quoteAmountPrevious)")
        }
        
//        .onAppear{self.calculate()}
        
    }
    
    func refreshRate () {
        Task {
            let customUrl = "https://v6.exchangerate-api.com/v6/\(apiKey)/pair/\(baseCode)/\(quoteCode)"
            
            let (data, _) = try await URLSession.shared.data(from: URL(string:"\(customUrl)")!)
            let decodedResponse = try? JSONDecoder().decode(CurrencyPairRate.self, from: data)
            
            conversionRate = decodedResponse?.conversion_rate ?? 0.0
        }
    }
    
    func calculate () {
        if (conversionRate == 0) {
            refreshRate()
        }
        
        if (baseCodePrevious != baseCode || quoteCodePrevious != quoteCode) {
            refreshRate()
        }
        
        if (baseAmountPrevious != baseAmount && baseAmount != 0) {
            quoteAmount = baseAmount * conversionRate
            baseAmountPrevious = baseAmount
        } else if (quoteAmountPrevious != quoteAmount && quoteAmount != 0) {
            baseAmount = quoteAmount * 1/conversionRate
            quoteAmountPrevious = quoteAmount
        }
    }
    
}



struct ExchangeRateView_Previews: PreviewProvider {
    @State static var baseCode = ""
    @State static var quoteCode = ""
    @State static var baseCodePrevious = ""
    @State static var quoteCodePrevious = ""
    @State static var baseAmount = 0.0
    @State static var quoteAmount = 0.0
    @State static var conversionRate = 0.0
    @State static var conversionRatePrevious = 0.0
    @State static var itemChanged = ""
    @State static var baseValNew = 0.0
    @State static var quoteValNew = 0.0
    
    static var previews: some View {
        ExchangeRateView(
            baseCode: $baseCode,
            quoteCode: $quoteCode,
            baseCodePrevious: $baseCodePrevious,
            quoteCodePrevious: $quoteCodePrevious,
            baseAmount: $baseAmount,
            quoteAmount: $quoteAmount,
            conversionRate: $conversionRate,
            conversionRatePrevious: $conversionRatePrevious,
            baseAmountPrevious: $baseValNew,
            quoteAmountPrevious: $quoteValNew
        )
    }
}
