//
//  CurrencySelectionPresenter.swift
//  currency-swiftui-viper
//
//  Created by Sami Daik on 20/07/2022.
//

import Foundation
import SwiftUI

public class CurrencySelectionPresenter: ObservableObject {
    let router: CurrencySelectionRouter
    let interactor: CurrencySelectionInteractor
    
    init(router: CurrencySelectionRouter, interactor: CurrencySelectionInteractor) {
        self.router = router
        self.interactor = interactor
    }
    
    func onAppear() async {
        await interactor.getExchangeRates()
    }
    
    func showConfirmation<Content: View>(@ViewBuilder content: ()-> Content) -> some View {
        NavigationLink(destination: router.routeToConfirmation()) {
            content()
        }
        .buttonStyle(BlueButton())
    }
}

struct BlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color(red: 0, green: 0, blue: 0.5))
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
}
