//
//  CurrencySelectionInteractor.swift
//  currency-swiftui-viper
//
//  Created by Sami Daik on 20/07/2022.
//

import Foundation

public class CurrencySelectionInteractor {
    let networkingManager: NetworkingManager
    let persistenceManger: PersistenceManager
    
    init(networkingManager: NetworkingManager, persistenceManger: PersistenceManager) {
        self.networkingManager = networkingManager
        self.persistenceManger = persistenceManger
    }
    
    func getExchangeRates() async {
        let response = await networkingManager.getExchangeRates(baseCcy: "USD")
        print(response)
    }
}
