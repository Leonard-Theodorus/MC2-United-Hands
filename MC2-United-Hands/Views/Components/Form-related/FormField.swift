//
//  FormField.swift
//  MC2-United-Hands
//
//  Created by Leonard Theodorus on 22/06/23.
//

import SwiftUI
import PhotosUI
struct FormField: View {
    @FocusState var focusField : FocusField?
    @State var fieldType : FieldType = .photo
    @Binding var expenseAmount : String
    @Binding var categorySelected : CategoryModel
    @Binding var expenseDate : Date
    @Binding var selectedItemFromPhotos: PhotosPickerItem?
    @Binding var selectedImageDataFromPhotos: Data?
    @State var expenseImage : UIImage = UIImage()
    @State var showDate : Bool = false
    @State var showCategoryModal : Bool = false
    @State var showContextMenu : Bool = false
    @State var formForegroundColor : Color = .primaryBlue
    @Binding var amountValid : Bool
    @State var temporaryAmount : Int = 0
    @State var showPhotoPicker : Bool = false
    @State var firstTime : Bool = true
    @Binding var shouldShowHelperText : Bool
    let categories : [ExpenseCategory] = [.food, .groceries, .shopping, .entertainment, .rent, .transport, .other]
    var body: some View {
        VStack(alignment: .leading){
            Text(self.fieldType.fieldName)
                .font(.subheadline)
            FieldView
            
        }
        .onAppear{
            if shouldShowHelperText{
                focusField = .nominal
            }
        }
        .padding(.horizontal)
        
        
    }
}

//struct FormField_Previews: PreviewProvider {
//    static var previews: some View {
//        FormField(expenseAmount: .constant(""), categorySelected: .constant(CategoryModel()), expenseDate: .constant(Date()), amountValid: .constant(false))
//    }
//}
