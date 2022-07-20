//
//  currency_swiftui_viperTests.swift
//  currency-swiftui-viperTests
//
//  Created by Sami Daik on 20/07/2022.
//

import XCTest
@testable import currency_swiftui_viper

class MockPersitanceManager: Persistable {
    func save(currencies: [Currency]) {
        
    }
    
    func fetchCurrencies() -> [Currency] {
        return []
    }
}

struct MockNetworkingManager: NetworkingManagerType {
    func getExchangeRates(baseCcy: String) async -> Result<currency_swiftui_viper.ExchangeRateResponse, currency_swiftui_viper.RequestError> {
        return .failure(.unauthorized)
    }
}

struct MockDIStore {
    static let networkingManager: NetworkingManagerType = MockNetworkingManager()
    static let persistenceManager: Persistable = MockPersitanceManager()
}

final class currency_swiftui_viperTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetCurrencies() async throws {
        let interactor = CurrencySelectionInteractor(
            networkingManager: MockDIStore.networkingManager as! MockNetworkingManager,
            persistenceManager: MockDIStore.persistenceManager as! MockPersitanceManager
        )
        
    }

}
