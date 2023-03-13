//
//  ContentViewController.swift
//  CurrencyConverterSwiftUI
//
//  Created by Sasith Priyankara on 13/3/23.
//

import Foundation

/*
 *  Calculations. 
 */

extension ContentView {
    func refreshRate () {
        Task {
            let customUrl = "https://v6.exchangerate-api.com/v6/\(apiKey)/pair/\(baseCode)/\(quoteCode)"
            let (data, _) = try await URLSession.shared.data(from: URL(string:"\(customUrl)")!)
            let decodedResponse = try? JSONDecoder().decode(CurrencyPairRate.self, from: data)
            conversionRate = decodedResponse?.conversion_rate ?? 0.0
        }
    }
    
    func onBaseAmountChange () {
        if (conversionRate == 0) {
            refreshRate()
        }
        quoteAmount = baseAmount * conversionRate
    }
    func onQuoteAmountChange () {
        if (conversionRate == 0) {
            refreshRate()
        }
        baseAmount = quoteAmount/conversionRate
    }
    func onBaseCodeChange () {
        refreshRate()
        quoteAmount = baseAmount * conversionRate
    }
    func onQuoteCodeChange () {
        refreshRate()
        baseAmount = quoteAmount/conversionRate
    }
}


