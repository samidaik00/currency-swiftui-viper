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
                
                HStack {
                    baseCurrencyPickerView
                    exchangeIcon
                    targetCurrencyPickerView
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
    
    private var baseCurrencyPickerView: some View {
        HStack {
            Text(presenter.selectedBaseCurrency ?? "-")
                .font(.largeTitle)
            
            Picker("", selection: $presenter.selectedBaseCurrency) {
                ForEach(presenter.currencies, id: \.self) { Text($0) }
            }
            
        }
        .padding()
        .border(.green)
    }
    
    private var targetCurrencyPickerView: some View {
        HStack {
            Text(presenter.selectedCurrency ?? "-")
                .font(.largeTitle)
            
            Picker("", selection: $presenter.selectedCurrency) {
                ForEach(presenter.currencies, id: \.self) { Text($0) }
            }
        }
        .padding()
        .border(.green)
    }
    
    private var exchangeIcon: some View {
        VStack {
            Image(systemName: "arrow.forward")
            Image(systemName: "arrow.backward")
        }
    }
}
