//
//  AppUserDefaults.swift
//  currency-swiftui-viper
//
//  Created by Sami Daik on 20/07/2022.
//

import Foundation
import SwiftUI

public class AppUserDefaults: ObservableObject {
    public static let shared = AppUserDefaults()
    
    @AppStorage("lastRefreshTimestamp")
    public var lastRefreshTimestamp: Date?

    @UserDefaultCodable("currencies", defaultValue: [])
    public var currencies: [Currency]
}

@propertyWrapper
public struct UserDefaultCodable<T: Codable> {
    let key: String
    let defaultValue: T

    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    public var wrappedValue: T {
        get {
            if let data = UserDefaults.standard.data(forKey: key) {
                if let decoded = try? JSONDecoder().decode(T.self, from: data) {
                    return decoded
                }
            }
            return self.defaultValue
        }
        set {
            if let encoded = try? JSONEncoder().encode(newValue) {
                UserDefaults.standard.set(encoded, forKey: key)
            }
        }
    }
}
