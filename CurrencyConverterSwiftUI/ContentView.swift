//
//  ContentView.swift
//  CurrencyConverterSwiftUI
//
//  Created by Sasith Priyankara on 10/3/23.
//

import SwiftUI
import CoreData



struct ContentView: View {
    //@Environment(\.managedObjectContext) private var viewContext
    
    @State var baseCode: String = "USD"
    @State var quoteCode: String = "LKR"
    
    @State var baseCodePrevious: String = "USD"
    @State var quoteCodePrevious: String = "LKR"
    
    @State var baseAmount : Double = 0.0
    @State var quoteAmount : Double = 0.0
    
    @State var baseAmountPrevious : Double = 0.0
    @State var quoteAmountPrevious : Double = 0.0
    
    @State var conversionRate : Double = 0.0
    @State var conversionRatePrevious : Double = 0.0
    
    var body: some View {
        
        NavigationStack{
            List{
                Section{
                    TextField("Enter value", value: $baseAmount, formatter: numberFormatter)
                        .keyboardType(.decimalPad)
                    //Text(baseSelectedStr)
                    Picker("Select Currency", selection: $baseCode) {
                        ForEach(currencyOptions) { item in
                            Text(item.code).tag(item.code)
                        }
                    }
                    .pickerStyle(.navigationLink)
                } header: {
                    Text("Base Currency")
                }
                Section{
                    TextField("Enter value", value: $quoteAmount, formatter: numberFormatter).keyboardType(.decimalPad)
                    //Text(quoteSelectedStr)
                    Picker("Select Currency", selection: $quoteCode) {
                        ForEach(currencyOptions) { item in
                            Text(item.code).tag(item.code)
                        }
                    }.pickerStyle(.navigationLink)
                } header: {
                    Text("Target Currency")
                }
                Section{
                    //Text("1 USD is equal to 1.55 EUR")
                    ExchangeRateView(
                        baseCode: $baseCode,
                        quoteCode: $quoteCode,
                        baseCodePrevious: $baseCodePrevious,
                        quoteCodePrevious: $quoteCodePrevious,
                        baseAmount: $baseAmount,
                        quoteAmount: $quoteAmount,
                        conversionRate: $conversionRate,
                        conversionRatePrevious: $conversionRatePrevious,
                        baseAmountPrevious: $baseAmountPrevious,
                        quoteAmountPrevious: $quoteAmountPrevious
                    )
//                    Text("Read more about")
                } header: {
                    Text("More Info")
                }
                
            }
            .navigationTitle("Converter")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
    
    @State private var numberFormatter: NumberFormatter = {
        var nf = NumberFormatter()
        nf.numberStyle = .decimal
        return nf
    }()
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


// Number formatter example link
/* https://developer.apple.com/documentation/swiftui/textfield/init(_:value:formatter:prompt:)-8kpfa
 
 TextField("Double", value: $myDouble, formatter: numberFormatter)
 Text(myDouble, format: .number)
 Text(myDouble, format: .number.precision(.significantDigits(5)))
 Text(myDouble, format: .number.notation(.scientific))
 
 */
