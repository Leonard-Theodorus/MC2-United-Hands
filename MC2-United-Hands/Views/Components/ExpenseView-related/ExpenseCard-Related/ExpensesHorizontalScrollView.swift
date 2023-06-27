//
//  ExpensesHorizontalScrollView.swift
//  MC2-United-Hands
//
//  Created by Leonard Theodorus on 25/06/23.
//

import SwiftUI

struct ExpensesHorizontalScrollView: View {
    @State var expenses : [ExpenseData] = [
        .init(id: UUID(), image: UIImage(systemName: "trash"), category: "Food & Drink", amount: 12000, timestamp: Date.now),
        .init(id: UUID(),image: UIImage(systemName: "signature"), category: "Others", amount: 12000, timestamp: Date.now),
        .init(id: UUID(),image: UIImage(systemName: "allergens"), category: "Entertainment", amount: 12000, timestamp: Date.now)
    ]
    var body: some View {
        HStack{
            ForEach(expenses, id: \.id) { expense in
                ExpenseCard(expenseData: expense)
            }
        }
    }
}

struct ExpensesHorizontalScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ExpensesHorizontalScrollView()
    }
}
