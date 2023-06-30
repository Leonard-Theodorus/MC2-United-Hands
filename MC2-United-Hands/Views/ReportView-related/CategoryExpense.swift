//
//  CategoryExpense.swift
//  MC2-United-Hands
//
//  Created by Jason Leonardo on 30/06/23.
//

import SwiftUI
import Foundation

struct CategoryExpenseView: View {
    var category: String
    var nominal: Int
    @State var expenseAtDate : Date = Date.now
    @State var expenseAtCategory: String
    var body: some View {
        VStack(alignment: .leading){
            
            Text("\(category)")
                .font(.subheadline).foregroundColor(.secondary)
            Text("Rp. " + (Formatter.currencyFormatter.string(from: nominal as NSNumber) ?? "0"))
                .bold()
                .padding(.top, 2)
            ScrollView(.horizontal, showsIndicators: false) {
                ReportHorizontalScrollView(expenseAtCategory: $expenseAtCategory)
            }
        }
        .padding(.top)
        .onAppear{
            //expenseAtDate = date
            expenseAtCategory = category
        }
    }
}
