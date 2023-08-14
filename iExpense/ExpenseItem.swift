//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Mathieu Dubart on 11/08/2023.
//

import Foundation

// ----- le protocol Identifiable permet de dire àSwift que ce type peut être identifié de manière unique avec pour seul prérequi d'avoir une variable id qui contient un UUID()
struct ExpenseItem: Identifiable, Codable, Equatable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
