//
//  currency_swiftui_viperApp.swift
//  currency-swiftui-viper
//
//  Created by Sami Daik on 20/07/2022.
//

import SwiftUI

@main
struct currency_swiftui_viperApp: App {
    var body: some Scene {
        WindowGroup {
            AnyView(Route.currencySelection.view)
        }
    }
}
