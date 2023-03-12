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
                    Text("1 \(baseCode) is equal to \(conversionRate) \(quoteCode)")
//                    ExchangeRateView(
//                        baseCode: $baseCode,
//                        quoteCode: $quoteCode,
//                        baseCodePrevious: $baseCodePrevious,
//                        quoteCodePrevious: $quoteCodePrevious,
//                        baseAmount: $baseAmount,
//                        quoteAmount: $quoteAmount,
//                        conversionRate: $conversionRate,
//                        conversionRatePrevious: $conversionRatePrevious,
//                        baseAmountPrevious: $baseAmountPrevious,
//                        quoteAmountPrevious: $quoteAmountPrevious
//                    )
//                    Text("Read more about")
                } header: {
                    Text("More Info")
                }
                
            }
            .navigationTitle("Converter")
            .navigationBarTitleDisplayMode(.automatic)
        }.onChange(of: baseAmount) { newValue in
            calculate()
        }.onChange(of: baseCode) { newValue in
            calculate()
        }.onChange(of: quoteAmount) { newValue in
            calculate()
        }.onChange(of: quoteCode) { newValue in
            calculate()
        }
        
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



// code for onChange

//    .onChange(of: baseCode, perform: { newValue in
//        calculate()
//    })
