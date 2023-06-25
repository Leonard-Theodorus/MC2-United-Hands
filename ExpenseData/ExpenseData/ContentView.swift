//
//  ContentView.swift
//  ExpenseData
//
//  Created by Jason Leonardo on 21/06/23.
//

import SwiftUI
import CoreData

struct ExpenseView: View {
    @State private var category = ""
    @State private var amount = ""
    @State private var timestamp = Date()
    @State private var selectedImage = UIImage(systemName: "carrot.fill")
    
    @State private var expenses: [expenseData] = []
    
    var body: some View {
        VStack {
            HStack {
                Text("Category:")
                TextField("Enter category", text: $category)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            HStack {
                Text("Amount:")
                TextField("Enter amount", text: $amount)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
            }
            Button(action: {
                addExpense()
            }) {
                Text("Add Expense")
            }
            .padding()
            
            List(expenses, id: \.id) { expense in
                VStack {
                    if let image = expense.image {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 100)
                    }
                    Text(expense.category ?? "")
                    Text("\(expense.amount ?? 0)")
                    Text(expense.timestamp ?? Date(), formatter: itemFormatter)
                }
            }
            
        }
        .padding()
        .onAppear {
            expenses = CoreDataManager.shared.fetchExpenses()
        }
    }
    
    func addExpense() {
        guard let amount = Int(amount) else { return }
        guard let selectedImage = selectedImage else { return }
        let timestamp = timestamp
        
        if let newExpense = CoreDataManager.shared.saveExpenseData(imageData: selectedImage.pngData()!, category: category, amount: amount, timestamp: timestamp) {
            expenses.append(CoreDataManager.shared.retrieveExpenseData(expenseEntity: newExpense)!)
        }
        
        category = ""
        self.amount = ""
        expenses = CoreDataManager.shared.fetchExpenses()
        
    }

}

struct ExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseView()
    }
}
