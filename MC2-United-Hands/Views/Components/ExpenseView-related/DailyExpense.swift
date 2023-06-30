//
//  DailyExpense.swift
//  MC2-United-Hands
//
//  Created by Leonard Theodorus on 27/06/23.
//

import Foundation
import SwiftUI


struct DailyExpenseView: View {
    var date: Date
    var nominal: Int
    @State var expenseAtDate : Date = Date.now
    var body: some View {
        VStack(alignment: .leading){
            VStack(alignment: .leading ,spacing: 4){
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
            }
            ScrollView(.horizontal, showsIndicators: false) {
                ExpensesHorizontalScrollView(expenseAtDate: $expenseAtDate)
            }
            .edgesIgnoringSafeArea(.horizontal)
        }
        .padding(.top)
        .onAppear{
            expenseAtDate = date
        }
    }
}
