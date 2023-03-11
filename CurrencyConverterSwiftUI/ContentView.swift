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
      
    @State private var baseSelected: Item?
    @State private var quoteSelected: Item?
    
    @State var baseAmount : Double = 0.0
    @State var quoteAmount : Double = 0.0
    @State var conversionRate : Double = 0.0
    
//    var baseAmountTemp;
//    var quoteAmountTemp;
    
    struct Item: Identifiable, Hashable{
        let id = UUID()
        let name: String
        let value: String
    }
    
    let items = [
        Item(name: "AED", value: "AE Dirham"),
        Item(name: "AFN", value: "Afghan Afghani"),
        Item(name: "ALL", value: "Albanian Lek"),
        Item(name: "AMD", value: "Armenian Dram"),
        Item(name: "ANG", value: "Netherlands Antillian Guilder"),
        Item(name: "AOA", value: "Angolan Kwanza"),
        Item(name: "ARS", value: "Argentine Peso"),
        Item(name: "AUD", value: "Australian Dollar"),
        Item(name: "AWG", value: "Aruban Florin"),
        Item(name: "AZN", value: "Azerbaijani Manat"),
        Item(name: "BAM", value: "Bosnia and Herzegovina Mark"),
        Item(name: "BBD", value: "Barbados Dollar"),
        Item(name: "BDT", value: "Bangladeshi Taka"),
        Item(name: "BGN", value: "Bulgarian Lev"),
        Item(name: "BHD", value: "Bahraini Dinar"),
        Item(name: "BIF", value: "Burundian Franc"),
        Item(name: "BMD", value: "Bermudian Dollar"),
        Item(name: "BND", value: "Brunei Dollar"),
    ]

    var body: some View {
        
        NavigationStack{
            List{
                Section{
                    //TextField("Enter value", text: $baseAmount).keyboardType(.decimalPad)
                    Picker("Select Currency", selection: $baseSelected) {
                        ForEach(items) { item in
                            Text(item.name).tag(item as Item?)
                        }
                    }.pickerStyle(.navigationLink)
                } header: {
                    Text("Base Currency")
                }
                Section{
                    //TextField("Enter amount", text: $quoteAmount).keyboardType(.decimalPad)
                    Picker("Select Currency", selection: $quoteSelected) {
                        ForEach(items) { item in
                            Text(item.name).tag(item as Item?)
                        }
                    }.pickerStyle(.navigationLink)
                } header: {
                    Text("Target Currency")
                }
                Section{
                    //Text("1 USD is equal to 1.55 EUR")
                  GetRateApiCall(
                    baseCode: baseSelected?.name ?? "USD",
                    quoteCode: quoteSelected?.name ?? "SGD",
                        
                    baseAmount: $baseAmount,
                    quoteAmount: $quoteAmount,
                    conversionRate: $conversionRate)
                    
                    Text("Read more about")
                } header: {
                    Text("More Info")
                }
                
            }
            .navigationTitle("Converter")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}


/* Old function */

//    func populateArrays () {
//        for x in CurrencyModel.currencyData {
//            currencyCodesArray.append(x.code)
//            print(x.code)
//        }
//    }
    
//    func calculate (convert: String) -> String {
//        var conversion: Double = 1.0
//        let amount = Double(convert) ?? 0.0
//        let selectedCurrency = currencies[baseSelection]
//        let to = currencies[quoteSelection]
//
//        let usdRates = ["USD": 1.0, "EUR": 0.87, "GBP": 0.73]
//        let eurRates = ["USD": 1.15, "EUR": 1.0, "GBP": 0.84]
//        let gbpRates = ["USD": 1.37, "EUR": 1.18, "GBP": 1.0]
//
//        // do the logic here.
//
//        return String(format: "%.2f", 20.6)
//    }




/* old picker item

Picker(selection: $quoteSelection, label: Text(currencies[baseSelection])) {
    ForEach(0 ..< currencies.count) {
        index in Text(self.currencies[index]).tag(index)
    }
}.pickerStyle(.navigationLink)

*/
