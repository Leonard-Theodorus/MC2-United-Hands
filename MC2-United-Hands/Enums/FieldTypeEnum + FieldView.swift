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
    var textFieldView : some View{
        switch self.fieldType{
        case .nominal:
            HStack {
                Text("Rp.").foregroundColor(formForegroundColor)
                ZStack(alignment: .leading){
                    TextField("", text: $expenseAmount)
                        .keyboardType(.numberPad)
                }
                
            }.modifier(BorderedFieldStyle(cornerRadius: 8, strokeColor: formForegroundColor))
        case .category:
            HStack {
                HStack{
                    Text("? Select Category").foregroundColor(formForegroundColor)
                    Spacer()
                    Image(systemName: "chevron.down").foregroundColor(formForegroundColor)
                }
                
                Spacer()
            }
            .onTapGesture {
                withAnimation {
                    showCategoryModal.toggle()
                }
            }
            .modifier(BorderedFieldStyle(cornerRadius: 8, strokeColor: formForegroundColor))
            .sheet(isPresented: $showCategoryModal) {
                ForEach(categories, id: \.categoryText){category in
                    VStack(spacing: 16){
                        ExpenseCategoryPicker(categoryType: category)
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
//            if showDate{
//                HStack{
//                    DatePicker("", selection: $expenseDate, displayedComponents: .date).datePickerStyle(.graphical)
//                }
//
//
//            }
        }
    }
    
}
