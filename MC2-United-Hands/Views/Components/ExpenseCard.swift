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
                //Jam
                Text("08.00 AM")
                    .font(.caption)
                    .padding(.trailing)
                //label
                CategoryLabel(stringLabel: expenseCategory.categoryText)
                    .padding(.leading)
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
