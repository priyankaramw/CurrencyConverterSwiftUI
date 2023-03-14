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
            VStack (alignment: .leading){
                // Section About
                Group {
                    Text(aboutTxt_title).padding(.vertical).font(.title).fontWeight(.semibold)
                    Text(aboutTxt_1)
                }
                // Section Instruction
                Group {
                    Text(instructionTxt_title).padding(.vertical).font(.title).fontWeight(.semibold)
                    Text(instructionTxt_1).padding(.vertical)
                    Text(instructionTxt_2).padding(.vertical)
                    Text(instructionTxt_3).padding(.vertical)
                    Text(instructionTxt_4).padding(.vertical)
                    Text(instructionTxt_5).padding(.vertical)
                    Text(instructionTxt_6).padding(.vertical)
                    Text(instructionTxt_7).padding(.vertical)
                }
                // Section System
                Group {
                    Text(systemTxt_title).padding(.vertical).font(.title).fontWeight(.semibold)
                    Text(systemTxt_1).padding(.vertical)
                    Text(systemTxt_2).padding(.vertical)
                    Text(thankTxt).font(.title)
                }
            }.padding()
        }.padding()
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}


//VStack (alignment: .leading) {
//    Text(aboutTxt_title)
//    Text(aboutTxt_1)
//
//    // Section Instruction
//    Text(instructionTxt_title).padding(.vertical).font(.title).fontWeight(.semibold)
//    Text(instructionTxt_1).padding(.vertical)
//    Text(instructionTxt_2)
//    Text(instructionTxt_3)
//    Text(instructionTxt_4)
//    Text(instructionTxt_5)
//    Text(instructionTxt_6)
//    Text(instructionTxt_7)
//
//    // System
//    Text(systemTxt_title).padding(.vertical).font(.title).fontWeight(.semibold)
//    Text(systemTxt_1).padding(.vertical)
//    Text(systemTxt_2).padding(.vertical)
//
//    Text(thankTxt)
//}.padding()
