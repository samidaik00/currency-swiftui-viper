//
//  Persistable.swift
//  currency-swiftui-viper
//
//  Created by Sami Daik on 20/07/2022.
//

import Foundation

public protocol Persistable: AnyObject {
    func save(currencies: [Currency])
    func fetchCurrencies() -> [Currency]
    func getLatestRefreshTimeStamp() -> Date?
}
