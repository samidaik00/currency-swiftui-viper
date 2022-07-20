//
//  PersistenceManager.swift
//  currency-swiftui-viper
//
//  Created by Sami Daik on 20/07/2022.
//

import Foundation

public final class PersistenceManager: Persistable {
    
    public func save(currencies: [Currency]) {
        AppUserDefaults.shared.currencies = currencies
    }
    
    public func fetchCurrencies() -> [Currency] {
        return AppUserDefaults.shared.currencies
    }

    public func getLatestRefreshTimeStamp() -> Date? {
        return AppUserDefaults.shared.lastRefreshTimestamp
    }
}
