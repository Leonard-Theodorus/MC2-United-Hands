//
//  FieldTypeEnum + FieldView.swift
//  MC2-United-Hands
//
//  Created by Leonard Theodorus on 22/06/23.
//

import SwiftUI

extension FormField{
    enum fieldType : Int{
        case nominal
        case category
        case photo
        case date
        var fieldName : String{
            switch self{
            case .nominal:
                return "Nominal"
            case .category:
                return "Category"
            case .photo:
                return "Photo"
            case .date:
                return "Set Date"
            }
        }
        
    }
    @ViewBuilder
    var FieldView : some View{
        switch self.fieldType{
        case .nominal:
            HStack {
                Text("Rp.").foregroundColor(formForegroundColor)
                ZStack(alignment: .leading){
                    TextField("", text: $expenseAmount)
                        .keyboardType(.numberPad)
                        .accessibilityLabel(Text("Expense Nominal"))
                        .accessibilityAddTraits(.isKeyboardKey)
                }
                
            }.modifier(BorderedFieldStyle(cornerRadius: 8, strokeColor: formForegroundColor))
        case .category:
            if categorySelected.category == ""{
                HStack{
                    Text("? Select Category").foregroundColor(formForegroundColor)
                    Spacer()
                    Image(systemName: "chevron.down").foregroundColor(formForegroundColor)
                }
                .accessibilityAddTraits([.isButton, .isModal])
                .onTapGesture {
                    withAnimation {
                        showCategoryModal.toggle()
                    }
                }
                .modifier(BorderedFieldStyle(cornerRadius: 8, strokeColor: formForegroundColor))
                .sheet(isPresented: $showCategoryModal) {
                    ForEach(categories, id: \.categoryText){category in
                        VStack(spacing: 16){
                            ExpenseCategoryPicker(categoryType: category,showCategoryModal: $showCategoryModal, categorySelected: $categorySelected)
                                .accessibilityLabel(Text("category"))
                                .accessibilityValue(Text(category.categoryText))
                                .accessibilityAddTraits(.isButton)
                        }
                        .padding(.horizontal)
                    }
                }
                
            }
            else{
                HStack{
                    Image(systemName: categorySelected.categoryStyleFromString().icon).foregroundColor(categorySelected.categoryStyleFromString().foregroundColor)
                    Text(categorySelected.categoryStyleFromString().categoryText)
                        .bold()
                        .foregroundColor(categorySelected.categoryStyleFromString().foregroundColor)
                    Spacer()
                }
                .modifier(BorderedFieldStyle(cornerRadius: 8, strokeColor: categorySelected.categoryStyleFromString().foregroundColor))
                .accessibilityAddTraits([.isButton, .isModal])
                .onTapGesture {
                    withAnimation {
                        showCategoryModal.toggle()
                    }
                }
                .sheet(isPresented: $showCategoryModal) {
                    ForEach(categories, id: \.categoryText){category in
                        VStack(spacing: 16){
                            ExpenseCategoryPicker(categoryType: category,showCategoryModal: $showCategoryModal, categorySelected: $categorySelected)
                                .accessibilityLabel(Text("category"))
                                .accessibilityValue(Text(category.categoryText))
                                .accessibilityAddTraits(.isButton)
                        }
                        .padding(.horizontal)
                    }
                }
            }
        case .photo:
            Menu {
                Button{
                    print("Take photo")
                } label: {
                    Label("Take Photo", systemImage: "photo")
                }
                Button{
                    print("photo library")
                } label: {
                    Label("Photo Library", systemImage: "photo.on.rectangle")
                }
            } label: {
                HStack {
                    Text("Add Image").foregroundColor(formForegroundColor)
                    Spacer()
                    
                }
                .onTapGesture {
                    showContextMenu.toggle()
                }
                .modifier(BorderedFieldStyle(cornerRadius: 8, strokeColor: formForegroundColor))
            }
        case .date:
            HStack {
                ZStack(alignment: .leading){
                    HStack{
                        Image(systemName: "calendar")
                            .foregroundColor(.blue)
                        Text("Date").foregroundColor(formForegroundColor)
                    }
                }
                Spacer()
                DatePicker("", selection: $expenseDate, displayedComponents: .date).accentColor(formForegroundColor)
                
            }.modifier(BorderedFieldStyle(cornerRadius: 8, strokeColor: formForegroundColor))
        }
    }
    
}
