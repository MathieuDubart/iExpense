//
//  Expenses.swift
//  iExpense
//
//  Created by Mathieu Dubart on 11/08/2023.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    
    // ----- Séparer les dépenses persos des dépenses pro
    var personalItems: [ExpenseItem] {
        items.filter { $0.type == "Personal" }
    }
    
    var businessItems: [ExpenseItem] {
        items.filter { $0.type == "Business" }
    }
    
    
    init() {
        // ----- 1ere ligne lit la donnée depuis UserDefaults pour la clé "Items" -> optional
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            // ----- Si on peut lire cette donnée, on essaye de la décoder comme étant un tableau de ExpenseItem -> le .self derrière permet de dire à Swift qu'on fait référence au type du tableau, qu'on a pas d'ExpenseItem en particulier mais plutôt l'idée d'un tableau d'ExpenseItems
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}

