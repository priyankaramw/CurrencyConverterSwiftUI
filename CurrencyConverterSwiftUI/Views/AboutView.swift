//
//  AboutView.swift
//  CurrencyConverterSwiftUI
//
//  Created by Sasith Priyankara on 13/3/23.
//

import SwiftUI

/*
 *  Showing "About application" Sheet
 */

struct AboutView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("About Application").padding().font(.title)
                Group {
                    // Fetching text from constants.
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
