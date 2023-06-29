//
//  ExpenseCategoryPicker.swift
//  MC2-United-Hands
//
//  Created by Leonard Theodorus on 22/06/23.
//

import SwiftUI

struct ExpenseCategoryPicker: View {
    @State var categoryType : ExpenseCategory
    @Binding var showCategoryModal : Bool
    @Binding var categorySelected : CategoryModel
    
    var body: some View {
        HStack{
            Image(systemName: categoryType.icon).foregroundColor(categoryType.foregroundColor)
            Text(categoryType.categoryText)
                .bold()
                .foregroundColor(categoryType.foregroundColor)
            Spacer()
        }
        .modifier(BorderedFieldStyle(cornerRadius: 8, strokeColor: categoryType.foregroundColor))
        .padding(showCategoryModal ? .horizontal : .horizontal, 0)
        .onTapGesture {
            categorySelected.category = categoryType.categoryText
            showCategoryModal.toggle()
        }
    }
}

struct ExpenseCategoryPicker_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseCategoryPicker(categoryType: .entertainment, showCategoryModal: .constant(false), categorySelected: .constant(CategoryModel()))
    }
}
