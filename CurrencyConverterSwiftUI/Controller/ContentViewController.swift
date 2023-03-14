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
    
    // API Request.
    func refreshRate () throws {
        Task {
            if (conversionRate == 0 || lastModified == .BASE_CODE || lastModified == .QUOTE_CODE) {
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
            
            // Calculatio logic based on last modified field.
            if (lastModified == .BASE_AMOUNT) {             // base amount
                quoteAmount = baseAmount * conversionRate
                
            } else if (lastModified == .BASE_CODE) {        // base code
                quoteAmount = baseAmount * conversionRate
                
            } else if (lastModified == .QUOTE_AMOUNT) {     // quote amount
                baseAmount = quoteAmount/conversionRate
                
            } else if (lastModified == .QUOTE_CODE) {       // quote code
                quoteAmount = baseAmount * conversionRate
            }
        }
    }
}
