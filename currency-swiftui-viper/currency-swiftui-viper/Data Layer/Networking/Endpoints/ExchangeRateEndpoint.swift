//
//  ExchangeRateEndpoint.swift
//  currency-swiftui-viper
//
//  Created by Sami Daik on 20/07/2022.
//

import Foundation

enum ExchangeRateEndpoint {
    case latest(baseCcy: String)
    
    static let API_KEY = "74af6c39047b16bbb877a732" // ideally this would be encrypted :)
}

extension ExchangeRateEndpoint: EndpointType {
    var host: String {
        return "v6.exchangerate-api.com/v6"
    }
    
    var path: String {
        switch self {
        case .latest(let baseCcy):
            return "\(host)/\(ExchangeRateEndpoint.API_KEY)/latest/\(baseCcy)"
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .latest:
            return .get
        }
    }
    
    var header: [String : String]? {
        return nil
    }
    
    var body: [String : String]? {
        return nil
    }
    
}
