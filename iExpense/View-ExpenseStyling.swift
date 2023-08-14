//
//  View-ExpenseStyling.swift
//  iExpense
//
//  Created by Mathieu Dubart on 14/08/2023.
//

import SwiftUI

extension View {
    func style(for item: ExpenseItem) -> some View {
        if item.amount <= 10 { return self.foregroundColor(.green) }
        else if item.amount > 10 && item.amount < 100 { return self.foregroundColor(.orange) }
        else { return self.foregroundColor(.red) }
    }
}
