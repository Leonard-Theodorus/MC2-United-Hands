//
//  ExpenseCard.swift
//  MC2-United-Hands
//
//  Created by Leonard Theodorus on 22/06/23.
//

import SwiftUI

struct ExpenseCard: View {
    @State var imageView : Image = Image(systemName: "figure.soccer")
    @State var expenseCategory : ExpenseCategoryPicker.expenseCategory = .food
    var body: some View {
        HStack{
            RoundedImage(image: $imageView)
            VStack{
                //RP
                Text("Rp. 25.000")
                    .bold()
                    .padding(.leading)
                    .accessibilityLabel(Text("Expense Nominal"))
                //Jam
                Text("08.00 AM")
                    .font(.caption)
                    .padding(.trailing)
                    .accessibilityLabel(Text("Time added"))
                //label
                CategoryLabel(stringLabel: expenseCategory.categoryText)
                    .padding(.leading)
                    .accessibilityLabel(Text("Expense Category"))
                    .accessibilityValue(Text(expenseCategory.categoryText))
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(Color.expenseCardGrey.opacity(0.2))
        )
    }
}

struct ExpenseCard_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseCard()
    }
}
