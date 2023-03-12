//
//  ContentView.swift
//  CurrencyConverterSwiftUI
//
//  Created by Sasith Priyankara on 10/3/23.
//

import SwiftUI
import CoreData



struct ContentView: View {
    
    @State var baseCode: String = "USD"
    @State var quoteCode: String = "LKR"
    
    @State var baseAmount : Double = 0.0
    @State var quoteAmount : Double = 0.0
    
    @State var conversionRate : Double = 0.0
    
    var body: some View {
        
        NavigationStack{
            List{
                Section{
                    TextField("Enter value", value: $baseAmount, formatter: numberFormatter)
                        .keyboardType(.decimalPad)
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
//                    Text("Read more about")
                } header: {
                    Text("More Info")
                }
                
            }
            .navigationTitle("Converter")
            .navigationBarTitleDisplayMode(.automatic)
        }.onAppear() {
            refreshRate()
        }.onChange(of: baseAmount) { newValue in
            onBaseAmountChange()
        }.onChange(of: quoteAmount) { newValue in
            onQuoteAmountChange()
        }.onChange(of: baseCode) { newValue in
            onBaseCodeChange()
        }.onChange(of: quoteCode) { newValue in
            onQuoteCodeChange()
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
        baseAmount = quoteAmount * 1/conversionRate
    }
    func onBaseCodeChange () {
        refreshRate()
        quoteAmount = baseAmount * conversionRate
    }
    func onQuoteCodeChange () {
        refreshRate()
        baseAmount = quoteAmount * 1/conversionRate
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
