//
//  NetworkingManager.swift
//  currency-swiftui-viper
//
//  Created by Sami Daik on 20/07/2022.
//

import Foundation

public final class NetworkingManager: HTTPClient {
    func getExchangeRates(baseCcy: String) async -> Result<ExchangeRateResponse, RequestError> {
        return await sendRequest(endpoint: ExchangeRateEndpoint.latest(baseCcy: baseCcy), responseModel: ExchangeRateResponse.self)
    }
}
