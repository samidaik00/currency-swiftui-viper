//
//  Route.swift
//  currency-swiftui-viper
//
//  Created by Sami Daik on 20/07/2022.
//

import Foundation
import SwiftUI

///
/// The Route enum defines the "routes" or Modules that the app can navigate to.
/// The idea is that each module can be separate SPM and don't have to know about each other.
/// The main app which will import the modules it needs is responsible for assembling the modules through the Routers from the VIPER setup.
/// `Route` is taking advantage of the new Swift 5.7 way to use `any` to simplify the return type of `view`
///
enum Route {
    case currencySelection
    case confirmTranscation
    
    //TODO: assemble later with Router
    var view: any View {
        switch self {
        case .currencySelection: return CurrencySelectionView() //TODO: assemble later with Router
        case .confirmTranscation: return ConfirmationTransactionView()
        }
    }
}
