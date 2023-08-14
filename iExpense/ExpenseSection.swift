//
//  ExpenseSection.swift
//  iExpense
//
//  Created by Mathieu Dubart on 14/08/2023.
//

import SwiftUI

struct ExpenseSection: View {
    let title: String
    let expenses: [ExpenseItem]
    let deleteItems:(IndexSet) -> Void
    
    var body: some View {
        Section(title) {
            // ----- id: \.id permet d'identifier chaque ligne par son nom
            // ----- comme ici id est forcément unique, on peut le retirer du ForEach, il est déduit automatiquement par Swift UI
            ForEach(expenses) { item in
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        Text(item.type)
                            .font(.subheadline)
                    }
                    
                    Spacer()
                    
                    Text(item.amount, format: .localCurrency)
                        .style(for: item)
                }
            }
            .onDelete(perform: deleteItems)
        }
    }
}

#Preview {
    ExpenseSection(title: "Example", expenses: []) {_ in }
}
