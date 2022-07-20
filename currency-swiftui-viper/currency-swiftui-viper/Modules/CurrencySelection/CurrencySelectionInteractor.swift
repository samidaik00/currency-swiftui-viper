//
//  CurrencySelectionInteractor.swift
//  currency-swiftui-viper
//
//  Created by Sami Daik on 20/07/2022.
//

import Foundation

public class CurrencySelectionInteractor {
    let networkingManager: NetworkingManagerType
    let persistenceManager: Persistable
    
    init(networkingManager: NetworkingManagerType, persistenceManager: Persistable) {
        self.networkingManager = networkingManager
        self.persistenceManager = persistenceManager
    }
    
    ///
    /// Only request the data from the Server every 5 hours.
    /// The function returns local persited data so if latest refresh timestamp is less than 5 hours
    ///
    func getExchangeRates() async throws -> [Currency] {
        return try await refreshExchangeRates()
    }
    
    ///
    /// Request to the server
    ///
    private func refreshExchangeRates() async throws -> [Currency] {
        let result = await networkingManager.getExchangeRates(baseCcy: "USD")
    
        switch result {
        case .success(let success):
            let currencies = mapResponseToCurrencies(success as ExchangeRateResponse)
            persist(currencies: currencies)
            
        case .failure(let failure):
            throw failure as Error
        }
        
        return persistenceManager.fetchCurrencies()
    }
    
    private func mapResponseToCurrencies(_ response: ExchangeRateResponse) -> [Currency] {
        return response.rates.map { Currency(code: $0.key, exchangeRate: $0.value)}
    }
    
    private func persist(currencies: [Currency]) {
        persistenceManager.save(currencies: currencies)
    }
}
