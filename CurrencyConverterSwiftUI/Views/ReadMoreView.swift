//
//  ReadMoreView.swift
//  CurrencyConverterSwiftUI
//
//  Created by Sasith Priyankara on 13/3/23.
//

import SwiftUI
import WebKit

/*
 *  Showing "Read more..." Sheet
 */

struct WebView: UIViewRepresentable {
    var urlString: String
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }
}

/*
 *  Provide more information through google for the selected currency pair (default to USD/SGD)
 *  Works only on runtime otherwise broken page.
 */
struct ReadMoreView: View {
    var baseCode : String
    var quoteCode : String
    
    var body: some View {
        VStack {
            WebView(urlString: "https://www.google.com/finance/quote/\(baseCode)-\(quoteCode)")
        }
    }
}

struct ReadMoreView_Previews: PreviewProvider {
    static var previews: some View {
        ReadMoreView(baseCode: "", quoteCode: "")
    }
}



