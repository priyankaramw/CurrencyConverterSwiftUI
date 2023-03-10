//
//  ContentView.swift
//  CurrencyConverterSwiftUI
//
//  Created by Sasith Priyankara on 10/3/23.
//

import SwiftUI
import CoreData



struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var baseSelection = 0
    @State private var quoteSelection = 1
    
    @State private var baseAmount : String = ""
    @State private var quoteAmount : String = ""
    
    private let currencies = ["USD", "EUR", "GBP"]
    

    var body: some View {
        
        NavigationStack{
            List{
                Section{
                    TextField("Enter amount", text: $baseAmount)
                    Picker(selection: $baseSelection, label: Text(currencies[baseSelection])) {
                        ForEach(0 ..< currencies.count) {
                            index in Text(self.currencies[index]).tag(index)
                        }
                    }.pickerStyle(.navigationLink)
                } header: {
                    Text("Base Currency")
                }
                Section{
                    TextField("Enter amount", text: $baseAmount)
                    Picker(selection: $quoteSelection, label: Text(currencies[quoteSelection])) {
                        ForEach(0 ..< currencies.count) {
                            index in Text(self.currencies[index]).tag(index)
                        }
                    }.pickerStyle(.navigationLink)
                } header: {
                    Text("Target Currency")
                }
                Section{
                    Text("1 USD is equal to 1.55 EUR")
                    Text("Read more about GBP/USD")
                } header: {
                    Text("More Info")
                }
                
            }
            .navigationTitle("Currency Converter")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
    
    func calculate (convert: String) -> String {
        var conversion: Double = 1.0
        let amount = Double(convert) ?? 0.0
        let selectedCurrency = currencies[baseSelection]
        let to = currencies[quoteSelection]
        
        let usdRates = ["USD": 1.0, "EUR": 0.87, "GBP": 0.73]
        let eurRates = ["USD": 1.15, "EUR": 1.0, "GBP": 0.84]
        let gbpRates = ["USD": 1.37, "EUR": 1.18, "GBP": 1.0]
        
        // do the logic here.
        
        return String(format: "%.2f", 20.6)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
