//
//  FormField.swift
//  MC2-United-Hands
//
//  Created by Leonard Theodorus on 22/06/23.
//

import SwiftUI

struct FormField: View {
    @State var fieldType : fieldType = .photo
    @Binding var expenseAmount : String
    @Binding var categorySelected : CategoryModel
    @State var expenseDate : Date = Date.now
    @State var expenseImage : UIImage = UIImage()
    @State var showDate : Bool = false
    @State var showCategoryModal : Bool = false
    @State var showContextMenu : Bool = false
    @State var formForegroundColor : Color = .primaryBlue
    let categories : [ExpenseCategoryPicker.expenseCategory] = [.food, .groceries, .shopping, .entertainment, .rent, .transport, .other]
    var body: some View {
        VStack(alignment: .leading){
            Text(self.fieldType.fieldName)
                .font(.subheadline)
            self.FieldView
            
        }
        .padding(.horizontal)
        
        
    }
}

struct FormField_Previews: PreviewProvider {
    static var previews: some View {
        FormField(expenseAmount: .constant(""), categorySelected: .constant(CategoryModel()))
    }
}
