//
//  CurrencyConverterSwiftUIApp.swift
//  CurrencyConverterSwiftUI
//
//  Created by Sasith Priyankara on 10/3/23.
//

import SwiftUI

@main
struct CurrencyConverterSwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
