//
//  AboutView.swift
//  CurrencyConverterSwiftUI
//
//  Created by Sasith Priyankara on 13/3/23.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("About the App").padding().font(.title)
                Group {
                    Text(aboutText).padding()
                }.padding()
            }
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
