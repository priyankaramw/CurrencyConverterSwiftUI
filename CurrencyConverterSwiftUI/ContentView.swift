//
//  ContentView.swift
//  CurrencyConverterSwiftUI
//
//  Created by Sasith Priyankara on 10/3/23.
//

import SwiftUI
//import CoreData

struct ContentView: View {
    
    /*
     *  Variable declaration:
     *  base = first currency & value
     *  quote = second currency & value
     */
    
    @State var baseCode: String = "USD"
    @State var quoteCode: String = "SGD"
    @State var baseAmount : Double = 0.0
    @State var quoteAmount : Double = 0.0
    
    @State var conversionRate : Double = 0.0
    
    // Below variable is used to present the "Read more about [currency pair]" sheet.
    // Its an additional part for this test.
    @State var isViewMorePresenting = false
    
    var body: some View {
        NavigationStack{
            List{
                // Section for Base Currency
                Section{
                    TextField("Enter value", value: $baseAmount, formatter: numberFormatter)
                        .keyboardType(.decimalPad)
                    Picker("Select", selection: $baseCode) {
                        ForEach(currencyOptions) { item in
                            Text(item.code).tag(item.code)
//                            SelectLIstItemView().tag(item.code)
                        }
                    }
                    .pickerStyle(.navigationLink)
                } header: {
                    Text("Base Currency")
                }
                
                // Section for Quote Currency
                Section{
                    TextField("Enter value", value: $quoteAmount, formatter: numberFormatter).keyboardType(.decimalPad)
                    //Text(quoteSelectedStr)
                    Picker("Select", selection: $quoteCode) {
                        ForEach(currencyOptions) { item in
                            Text(item.code).tag(item.code)
                        }
                    }.pickerStyle(.navigationLink)
                } header: {
                    Text("Target Currency")
                }
                
                // Section for more info
                Section{
                    Text("1 \(baseCode) is equal to \(conversionRate, format: .number) \(quoteCode)")
                    Button("Read more about \(baseCode)/\(quoteCode)") {
                        isViewMorePresenting = true
                    }
                    .sheet(isPresented: $isViewMorePresenting) {
                        ReadMoreView(baseCode: baseCode, quoteCode: quoteCode)
                    }
                } header: {
                    Text("More Info")
                }
            }
            .navigationTitle("Converter")
            .navigationBarTitleDisplayMode(.automatic)
            
            // Reminder >>>>>>> uncoment below two lines before submiting. (to limit api calls while coding)
        }.onAppear() {
            refreshRate()   // Used to load exchange rate onLoad
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
