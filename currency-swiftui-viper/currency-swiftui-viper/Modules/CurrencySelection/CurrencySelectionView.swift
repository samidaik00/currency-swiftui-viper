//
//  CurrencySelectionView.swift
//  currency-swiftui-viper
//
//  Created by Sami Daik on 20/07/2022.
//

import Foundation
import SwiftUI

public struct CurrencySelectionView: View {
    
    @StateObject var presenter: CurrencySelectionPresenter
    
    init(presenter: CurrencySelectionPresenter) {
        _presenter = StateObject(wrappedValue: presenter)
    }
    
    public var body: some View {
        NavigationView {
            VStack {
                Picker("", selection: $selectedColor) {
                    ForEach(presenter.currencies, id: \.self) { Text($0) }
                }
                
                Text("Currency Selection")
                
                presenter.showConfirmation {
                    Text("Route to confirm Screen")
                }
            }
        }
        .onAppear {
            Task(priority: .background) {
                await presenter.onAppear()
            }
            
        }
    }
}
