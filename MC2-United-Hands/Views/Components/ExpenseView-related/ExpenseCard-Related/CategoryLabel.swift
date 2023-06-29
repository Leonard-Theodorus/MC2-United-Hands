//
//  CategoryLabel.swift
//  MC2-United-Hands
//
//  Created by Leonard Theodorus on 22/06/23.
//

import SwiftUI

struct CategoryLabel: View {
    var stringLabel : String
    @State var expenseCategory: ExpenseCategory = .food
    
    var body: some View {
        //TODO: Adain warna each category
        Text(stringLabel == "" ? "Draft" : stringLabel)
            .font(.footnote)
            .foregroundColor(expenseCategory.foregroundColor)
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
            .background(
                RoundedRectangle(cornerRadius: 200).foregroundColor(expenseCategory.foregroundColor.opacity(0.1))
                
            )
            .onAppear {
                switch (stringLabel) {
                case "Food & Drink":
                    expenseCategory = .food
                case "Groceries":
                    expenseCategory = .groceries
                case "Shopping":
                    expenseCategory = .shopping
                case "Entertainment":
                    expenseCategory = .entertainment
                case "Rent":
                    expenseCategory = .rent
                case "Transport":
                    expenseCategory = .transport
                default:
                    expenseCategory = .other
                }
            }
    }
}

struct CategoryLabel_Previews: PreviewProvider {
    static var previews: some View {
        CategoryLabel(stringLabel: "", expenseCategory: .food)
    }
}
