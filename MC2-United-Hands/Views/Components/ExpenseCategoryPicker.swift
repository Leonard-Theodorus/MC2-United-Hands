//
//  ExpenseCategoryPicker.swift
//  MC2-United-Hands
//
//  Created by Leonard Theodorus on 22/06/23.
//

import SwiftUI

struct ExpenseCategoryPicker: View {
    @State var categoryType : expenseCategory = .shopping
    var body: some View {
        HStack{
            HStack{
                Image(systemName: categoryType.icon).foregroundColor(categoryType.foregroundColor)
                Text(categoryType.categoryText)
                    .bold()
                    .foregroundColor(categoryType.foregroundColor)
            }
            
            Spacer()
        }
        .modifier(BorderedFieldStyle(cornerRadius: 8, strokeColor: categoryType.foregroundColor))
        .padding(.horizontal)
    }
}

struct ExpenseCategoryPicker_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseCategoryPicker()
    }
}