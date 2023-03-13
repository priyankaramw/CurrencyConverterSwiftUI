//
//  ContentView.swift
//  CurrencyConverterSwiftUI
//
//  Created by Sasith Priyankara on 10/3/23.
//

import SwiftUI

struct ContentView: View {
    
    /*
     *  Variable declaration clarification.
     *  base = first currency & value, quote = second currency & value.
     *  based on the foreign exchange standards.
     */
    
    @State var baseCode: String = "USD" // Default to USD and SGD
    @State var quoteCode: String = "SGD"
    @State var baseAmount : Double = 0.0
    @State var quoteAmount : Double = 0.0
    
    @State var conversionRate : Double = 0.0
    
    // Below variables used to present "Read more..." and, about sheet views.
    @State var isViewMorePresenting = false
    @State var isAboutPresenting = false
    
    var body: some View {
        NavigationStack{
            List{
                // SECTION FIRST CURRENCY - START
                Section{
                    TextField("Enter value", value: $baseAmount, formatter: numberFormatter).keyboardType(.decimalPad)
                    // Picker text below set to null to use currency description as the text
                    Picker("", selection: $baseCode) {
                        ForEach(currencyOptions) { item in
                            // sending currency code and name for the list item.
                            SelectLIstItemView(code: item.code, currency: item.currency).tag(item.code)
                        }
                    }
                    .pickerStyle(.navigationLink)
                } header: {
                    Text("Base Currency")
                }
                // SECTION FIRST CURRENCY - END
                
                // SECTION SECOND CURRENCY - START
                Section{
                    TextField("Enter value", value: $quoteAmount, formatter: numberFormatter).keyboardType(.decimalPad)
                    // Picker text below set to null to use currency description as the text
                    Picker("", selection: $quoteCode) {
                        ForEach(currencyOptions) { item in
                            SelectLIstItemView(code: item.code, currency: item.currency).tag(item.code)
                        }
                    }.pickerStyle(.navigationLink)
                } header: {
                    Text("Target Currency")
                }
                // SECTION SECOND CURRENCY - END
                
                // SECTION MORE INFO - START
                Section{
                    // Below, conversion rate per 1 of base is always visible so "1" no need to be dynamic.
                    Text("1 \(baseCode) is equal to \(conversionRate, format: .number) \(quoteCode)")
                    // Read more sheet.
                    Button("Read more about \(baseCode)/\(quoteCode)") {
                        isViewMorePresenting = true
                    }
                    .sheet(isPresented: $isViewMorePresenting) {
                        ReadMoreView(baseCode: baseCode, quoteCode: quoteCode)
                    }
                    // About application sheet.
                    Button("About application") {
                        isAboutPresenting = true
                    }.sheet(isPresented: $isAboutPresenting) {
                        AboutView()
                    }
                } header: {
                    Text("More Info")
                }
                // SECTION MORE INFO - END
            }
            .navigationTitle("Converter")
            .navigationBarTitleDisplayMode(.automatic)
            
            // Reminder >>>>>>> Should uncoment below two lines before submition. (to limit unnecessary api calls while coding).
        }.onAppear() {
            refreshRate()   // Used to load conversion rate on more info section.
        }.onChange(of: baseAmount) { newValue in
            onBaseAmountChange()  // Calculating target value on base change.
        }.onChange(of: baseCode) { newValue in
            onBaseCodeChange()
        }.onChange(of: quoteAmount) { newValue in
            onQuoteAmountChange()  // Calculating base value on quote change.
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
