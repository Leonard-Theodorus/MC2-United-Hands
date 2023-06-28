//
//  DailyExpense.swift
//  MC2-United-Hands
//
//  Created by Leonard Theodorus on 27/06/23.
//

import Foundation
import SwiftUI


struct DailyExpenseView: View {
    var expenses: [ExpenseData]
    var date: Date
    var nominal: Int
    
    @Binding var isDetailExpenses: Bool
    
    var body: some View {
        VStack(alignment: .leading){
            if dayOfDate(for: date) == dayOfDate(for: Date()){
                Text("Today")
                    .font(.subheadline).foregroundColor(.secondary)
            }
            else{
                Text(Formatter.dayFormatter.string(from: date))
                    .font(.subheadline).foregroundColor(.secondary)
            }
            Text("Rp. " + (Formatter.currencyFormatter.string(from: nominal as NSNumber) ?? "0"))
                .bold()
                .padding(.top, 2)
            ScrollView(.horizontal) {
                ExpensesHorizontalScrollView(isDetailExpenses: $isDetailExpenses, expenses: expenses.filter({dayOfDate(for: $0.timestamp ?? Date())  == dayOfDate(for: date)}))
            }
        }
        .padding(.top)
    }
}
