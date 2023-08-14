//
//  FormatStyle-LocalCurrency.swift
//  iExpense
//
//  Created by Mathieu Dubart on 14/08/2023.
//

import Foundation

extension FormatStyle where Self == FloatingPointFormatStyle<Double>.Currency {
    static var localCurrency: Self {
        .currency(code: Locale.current.currency?.identifier ?? "USD")
    }
}
