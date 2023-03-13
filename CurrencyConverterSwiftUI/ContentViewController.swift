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
            
            // Checking if api call limitation occured or success.
            if (decodedResponse?.result == "success") {
                infoOrErrorString = "1 \(baseCode) is equal to \(conversionRate) \(quoteCode)"
            } else {
                infoOrErrorString = "Conversion rate fetching error."
            }
        }
    }
    
    // Devide by 0 never happens on this logic. But I have added error handling for other possibilities. 
    func onBaseAmountChange () throws {
        // Refresh only if null.
        if (conversionRate == 0) {
            refreshRate()
        }
        quoteAmount = baseAmount * conversionRate
    }
    func onQuoteAmountChange () throws {
        // Refresh only if null.
        if (conversionRate == 0) {
            refreshRate()
        }
        baseAmount = quoteAmount/conversionRate
    }
    func onBaseCodeChange () throws {
        // Refreshing only when currency code change. 
        refreshRate()
        quoteAmount = baseAmount * conversionRate
    }
    func onQuoteCodeChange () throws {
        // Refreshing only when currency code change.
        refreshRate()
        baseAmount = quoteAmount/conversionRate
    }
}


