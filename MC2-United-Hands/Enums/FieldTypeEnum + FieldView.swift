//
//  FieldTypeEnum + FieldView.swift
//  MC2-United-Hands
//
//  Created by Leonard Theodorus on 22/06/23.
//

import SwiftUI
import PhotosUI

extension FormField{
    enum FocusField : Hashable{
        case nominal
        case nonNominal
    }
    
    enum FieldType : Int{
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
            //TODO: Add currency formatter + validasi biar gak nol
            HStack {
                Text("Rp.").foregroundColor(formForegroundColor)
                ZStack(alignment: .leading){
                    TextField("", text: $expenseAmount)
                        .focused($focusField, equals: .nominal)
                        .keyboardType(.numberPad)
                        .accessibilityLabel(Text("Expense Nominal"))
                        .accessibilityAddTraits(.isKeyboardKey)
                        .onChange(of: expenseAmount) { newValue in
                            let numberString = newValue.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
                            if let number = Int(numberString){
                                expenseAmount = Formatter.currencyFormatter.string(from: number as NSNumber) ?? ""
                            }
                            if (numberString != "0"){
                                amountValid = true
                            }
                            else{
                                amountValid = false
                            }
                        }
                }
                
            }
            .modifier(BorderedFieldStyle(cornerRadius: 8, strokeColor: formForegroundColor, verticalPadding: 14))
        case .category:
            if categorySelected.category == ""{
                HStack{
                    Text("? Select Category").foregroundColor(formForegroundColor)
                    Spacer()
                    Image(systemName: "chevron.down").foregroundColor(formForegroundColor)
                }
                
                .accessibilityAddTraits([.isButton, .isModal])
                .onTapGesture {
                    focusField = .nonNominal
                    withAnimation {
                        showCategoryModal.toggle()
                    }
                }
                .modifier(BorderedFieldStyle(cornerRadius: 8, strokeColor: formForegroundColor, verticalPadding: 18))
                .sheet(isPresented: $showCategoryModal) {
                    VStack {
                        ForEach(categories, id: \.categoryText){category in
                            VStack(spacing: 16){
                                ExpenseCategoryPicker(categoryType: category,showCategoryModal: $showCategoryModal, categorySelected: $categorySelected)
                                    .accessibilityLabel(Text("category"))
                                    .accessibilityValue(Text(category.categoryText))
                                    .accessibilityAddTraits(.isButton)
                                    .padding(.bottom, 12)
                            }
                            .padding(.horizontal)
                        }
                    }
                    .presentationDetents([.fraction(0.75)])
                    .presentationDragIndicator(.visible)
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
                .modifier(BorderedFieldStyle(cornerRadius: 8, strokeColor: categorySelected.categoryStyleFromString().foregroundColor, verticalPadding: 18))
                .accessibilityAddTraits([.isButton, .isModal])
                .onTapGesture {
                    firstTime = false
                    withAnimation {
                        showCategoryModal.toggle()
                    }
                }
                .sheet(isPresented: $showCategoryModal) {
                    VStack{
                        ForEach(categories, id: \.categoryText){category in
                            VStack(spacing: 16){
                                ExpenseCategoryPicker(categoryType: category,showCategoryModal: $showCategoryModal, categorySelected: $categorySelected)
                                    .accessibilityLabel(Text("category"))
                                    .accessibilityValue(Text(category.categoryText))
                                    .accessibilityAddTraits(.isButton)
                                    .padding(.bottom, 12)
                            }
                            .padding(.horizontal)
                        }
                        
                    }
                    .presentationDetents([.fraction(0.75)])
                    .presentationDragIndicator(.visible)
                    
                }
            }
        case .photo:
            NavigationLink{
                AddMomentView(isManualInput: true, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, shouldShowCamera: false, expenseAmount: expenseAmount, categorySelected: categorySelected, expenseDate: expenseDate)
            } label: {
                HStack {
                    Text("Add Image").foregroundColor(formForegroundColor)
                    Spacer()
                    Image(uiImage: expenseImage)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 30)
                }
                .modifier(BorderedFieldStyle(cornerRadius: 8, strokeColor: formForegroundColor, verticalPadding: 12))
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
                DatePicker("", selection: $expenseDate, in: ...Date(), displayedComponents: .date).accentColor(formForegroundColor)
                
            }
            .modifier(BorderedFieldStyle(cornerRadius: 8, strokeColor: formForegroundColor, verticalPadding: 12))
           
        }
    }
    
}
