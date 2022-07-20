//
//  CurrencySelectionRouter.swift
//  currency-swiftui-viper
//
//  Created by Sami Daik on 20/07/2022.
//

import Foundation
import SwiftUI

public class CurrencySelectionRouter {
    static func assemble(NetworkingManager: NetworkingManager, persistenceManger: PersistenceManager) -> some View {
        let router = CurrencySelectionRouter()
        let interactor = CurrencySelectionInteractor(networkingManager: NetworkingManager, persistenceManger: persistenceManger)
        let presenter = CurrencySelectionPresenter(router: router, interactor: interactor)
        let view = CurrencySelectionView(presenter: presenter)
        return view
    }
    
    func routeToConfirmation() -> some View {
        return AnyView(Route.confirmTranscation.view)
    }
}
