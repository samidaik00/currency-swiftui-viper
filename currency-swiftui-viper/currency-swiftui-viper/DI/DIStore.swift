//
//  DIStore.swift
//  currency-swiftui-viper
//
//  Created by Sami Daik on 20/07/2022.
//

import Foundation

///
/// Simple Struct to hold properties we would like to have injected through Dependency Injection such as Resolver for Swift
///
struct DIStore {
    static let networkManager: NetworkingManager = NetworkingManager()
    static let persistenceManager: PersistenceManager = PersistenceManager()
}
