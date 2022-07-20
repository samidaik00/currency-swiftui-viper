//
//  NetworkingManagerType.swift
//  currency-swiftui-viper
//
//  Created by Sami Daik on 20/07/2022.
//

import Foundation

protocol NetworkingManagerType {
    func getExchangeRates(baseCcy: String) async -> Result<ExchangeRateResponse, RequestError>
}
