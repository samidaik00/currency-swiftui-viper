//
//  ExchangeRateResponse.swift
//  currency-swiftui-viper
//
//  Created by Sami Daik on 20/07/2022.
//

import Foundation

public struct ExchangeRateResponse: Codable {
    let baseCode: String
    let rates: [String: Double]
    
    enum CodingKeys: String, CodingKey {
        case rates = "conversion_rates"
        case baseCode = "base_code"
    }
}
