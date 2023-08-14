//
//  ContentView.swift
//  iExpense
//
//  Created by Mathieu Dubart on 11/08/2023.
//

import SwiftUI

struct ContentView: View {
    // ----- @StateObject dit à swift ui de regarder les changements de l'instance pour refresh le body quand une propriété @Published change (ici le tableau où on stocke les dépenses).
    // ----- le reste du temps on utilise @ObservedObject pour réutiliser une instance existante.
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    if expenses.businessItems.count > 0 {
                        ExpenseSection(title: "Business", expenses: expenses.businessItems, deleteItems: removeBusinessItems)
                    }
                    
                    if expenses.personalItems.count > 0 {
                        ExpenseSection(title: "Personal", expenses: expenses.personalItems, deleteItems: removePersonalItems)
                    }
                }
                .navigationTitle("Expenses")
                .toolbar {
                    Button {
                        showingAddExpense = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    
                    EditButton()
                }
                .sheet(isPresented: $showingAddExpense) {
                    AddView(expenses: expenses)
                }
            }
        }
    }
    
    // ----- on regarde les index du tableau (Perso ou business) passé en param, on cherche l'index de l'objet à supprimer et on l'ajoute à objectsToDelete.
    // ----- Ensuite on supprime les éléments dans le tableau principal (expenses.items)
    func removeItems(at offsets: IndexSet, in inputArray: [ExpenseItem]) {
        var objectsToDelete = IndexSet()
        
        for offset in offsets {
            let item = inputArray[offset]
            
            if let index = expenses.items.firstIndex(of: item) {
                objectsToDelete.insert(index)
            }
        }
        
        expenses.items.remove(atOffsets: objectsToDelete)
    }
    
    func removePersonalItems(at offsets: IndexSet) {
        removeItems(at: offsets, in: expenses.personalItems)
    }
    
    func removeBusinessItems(at offsets: IndexSet) {
        removeItems(at: offsets, in: expenses.businessItems)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
