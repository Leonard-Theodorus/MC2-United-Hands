//
//  DailyExpense.swift
//  MC2-United-Hands
//
//  Created by Leonard Theodorus on 27/06/23.
//

import Foundation
import SwiftUI

@ViewBuilder
func DailyExpenseView(expenses : [ExpenseData], for date : Date, nominal : Int) -> some View{
    VStack(alignment: .leading){
        if dayOfDate(for: date) == dayOfDate(for: Date()){
            Text("Today")
                .font(.subheadline).foregroundColor(.secondary)
        }
        else{
            Text(Formatter.dayFormatter.string(from: date))
                .font(.subheadline).foregroundColor(.secondary)
        }
        //Total nominal hari itu
        Text("Rp. " + (Formatter.currencyFormatter.string(from: nominal as NSNumber) ?? "0"))
            .bold()
            .padding(.top, 2)
        ScrollView(.horizontal) {
            ExpensesHorizontalScrollView(expenses: expenses.filter({dayOfDate(for: $0.timestamp ?? Date())  == dayOfDate(for: date)}))
        }
    }
    .padding(.top)
}
