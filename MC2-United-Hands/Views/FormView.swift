//
//  FormView.swift
//  MC2-United-Hands
//
//  Created by Leonard Theodorus on 22/06/23.
//

import SwiftUI
struct FormView: View {
    @Binding var isManualInput : Bool
    @State private var formTypes : [FormField.fieldType] = [.nominal, .category, .photo, .date]
    @EnvironmentObject var coreDataViewModel : CoreDataViewModel
    @State var expenseAmount : String = ""
    @State var categorySelected : CategoryModel = CategoryModel()
    var capturedImage : UIImage?
    var body: some View {
        VStack(spacing: 24) {
            Group{
                ForEach(formTypes, id: \.fieldName){field in
                    FormField(fieldType: field, expenseAmount: $expenseAmount, categorySelected: $categorySelected)
                }
            }
            Spacer()
            ConfirmationButton(buttonDescription: "Done", buttonBackgroundColor: Color.primaryBlue){
                print(categorySelected.category)
                if let imageData = capturedImage?.pngData(){
                    coreDataViewModel.addExpense(image: imageData, amount: expenseAmountFromString(for: expenseAmount), category: categorySelected.category, timestamp: Date.now)
                    NavigationUtil.popToRootView()
                }
                else{
                    coreDataViewModel.addExpense(image: UIImage(systemName: "photo.on.rectangle.angled")?.pngData() ?? Data(), amount: expenseAmountFromString(for: expenseAmount), category: categorySelected.category, timestamp: Date.now)
                }
            }
            if !isManualInput{
                ConfirmationButton(buttonDescription: "Cancel", buttonBackgroundColor: Color.red){
                    NavigationUtil.popToRootView()
                }
                
            }
        }
        .onAppear{
            if !isManualInput{
                formTypes = [.nominal, .category]
            }
        }
        
    }
}

struct ManualInputFormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView(isManualInput: .constant(true), capturedImage: UIImage())
            .environmentObject(CoreDataViewModel())
    }
}
