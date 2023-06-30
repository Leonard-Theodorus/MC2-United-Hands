//
//  FormView.swift
//  MC2-United-Hands
//
//  Created by Leonard Theodorus on 22/06/23.
//

import SwiftUI
import PhotosUI
struct FormView: View {
    @Binding var isManualInput : Bool
    @State var editingMode : Bool = false
    @State private var formTypes : [FormField.fieldType] = []
    @EnvironmentObject var coreDataViewModel : CoreDataViewModel
    @EnvironmentObject var expenseVm : ExpensesViewModel
    @State var expenseAmount : String = ""
    @State var categorySelected : CategoryModel = CategoryModel()
    @State var expenseDate : Date = Date()
    @State var amountValid : Bool = true
    @State var selectedItemFromPhotos: PhotosPickerItem? = nil
    @State var selectedImageDataFromPhotos: Data? = nil
    var capturedImage : UIImage?
    var body: some View {
        if isManualInput{
            ScrollView(showsIndicators : false) {
                VStack(spacing: 24) {
                    Group{
                        ForEach(formTypes, id: \.fieldName){field in
                            FormField(fieldType: field, expenseAmount: $expenseAmount, categorySelected: $categorySelected, expenseDate: $expenseDate, selectedItemFromPhotos: $selectedItemFromPhotos, selectedImageDataFromPhotos: $selectedImageDataFromPhotos, expenseImage: capturedImage ?? UIImage(), showDate: isManualInput, amountValid: $amountValid)
                            
                        }
                    }
                    Spacer()
                    
                    ConfirmationButton(buttonDescription: "Done", buttonBackgroundColor: Color.primaryBlue, enabled: $amountValid){
                        if amountValid{
                            if editingMode{
                                coreDataViewModel.editExpenseNoArray(withUUID: coreDataViewModel.expenseToBeEdited?.id ?? UUID(), newCategory: categorySelected.category, newAmount: expenseAmountFromString(for: expenseAmount), newDate: expenseDate, startDate: expenseVm.startDate, endDate: expenseVm.endDate)
                                DispatchQueue.main.async {
                                    expenseVm.isDetailExpense.toggle()
                                    
                                }
                                NavigationUtil.popToRootView()
                                
                            }
                            else{
                                if let imageData = capturedImage?.pngData(){
                                    coreDataViewModel.addExpenseNoArray(image: imageData, amount: expenseAmountFromString(for: expenseAmount), category: categorySelected.category, timestamp: expenseDate, startDate: expenseVm.startDate, endDate: expenseVm.endDate)
                                    NavigationUtil.popToRootView()
                                }
                                else{
                                    coreDataViewModel.addExpenseNoArray(image: UIImage().pngData() ?? Data(), amount: expenseAmountFromString(for: expenseAmount), category: categorySelected.category, timestamp: expenseDate, startDate: expenseVm.startDate, endDate: expenseVm.endDate)
                                    NavigationUtil.popToRootView()
                                }
                                
                            }
                            coreDataViewModel.totalReportExpense = coreDataViewModel.reportExpenses.map({$0.amount ?? 0}).reduce(0, +)
                            coreDataViewModel.getExpensesByMonthAndYear(date: coreDataViewModel.reportDate)
                        }
                    }
                    if !isManualInput{
                        ConfirmationButton(buttonDescription: "Cancel", buttonBackgroundColor: Color.red, enabled: .constant(true)){
                            NavigationUtil.popToRootView()
                        }
                        
                    }
                }
                .onAppear{
                    if !isManualInput{
                        formTypes = [.nominal, .category]
                    }
                    else{
                        formTypes = [.nominal, .category, .photo, .date]
                    }
                    if editingMode{
                        if let amount = coreDataViewModel.expenseToBeEdited?.amount{
                            expenseAmount = String(amount)
                            
                        }
                        if let category = coreDataViewModel.expenseToBeEdited?.category{
                            categorySelected = CategoryModel(category: category)
                            
                        }
                        if let dateRecorded = coreDataViewModel.expenseToBeEdited?.timestamp{
                            expenseDate = dateRecorded
                        }
                        formTypes = [.nominal, .category, .date]
                    }
                }
            }
        }
        
        else{
            VStack(spacing: 24) {
                Group{
                    ForEach(formTypes, id: \.fieldName){field in
                        FormField(fieldType: field, expenseAmount: $expenseAmount, categorySelected: $categorySelected, expenseDate: $expenseDate, selectedItemFromPhotos: $selectedItemFromPhotos, selectedImageDataFromPhotos: $selectedImageDataFromPhotos, expenseImage: capturedImage ?? UIImage(), showDate: isManualInput, amountValid: $amountValid)
                        
                    }
                }
                Spacer()
                
                ConfirmationButton(buttonDescription: "Done", buttonBackgroundColor: Color.primaryBlue, enabled: $amountValid){
                    if amountValid{
                        if editingMode{
                            coreDataViewModel.editExpenseNoArray(withUUID: coreDataViewModel.expenseToBeEdited?.id ?? UUID(), newCategory: categorySelected.category, newAmount: expenseAmountFromString(for: expenseAmount), newDate: expenseDate, startDate: expenseVm.startDate, endDate: expenseVm.endDate)
                            DispatchQueue.main.async {
                                expenseVm.isDetailExpense.toggle()
                                
                            }
                            NavigationUtil.popToRootView()
                            
                        }
                        else{
                            if let imageData = capturedImage?.pngData(){
                                coreDataViewModel.addExpenseNoArray(image: imageData, amount: expenseAmountFromString(for: expenseAmount), category: categorySelected.category, timestamp: Date(), startDate: expenseVm.startDate, endDate: expenseVm.endDate)
                                NavigationUtil.popToRootView()
                            }
                            else{
                                coreDataViewModel.addExpenseNoArray(image: UIImage(systemName: "photo.on.rectangle.angled")?.pngData() ?? Data(), amount: expenseAmountFromString(for: expenseAmount), category: categorySelected.category, timestamp: Date.now, startDate: expenseVm.startDate, endDate: expenseVm.endDate)
                            }
                            
                        }
                        
                    }
                }
                if !isManualInput{
                    ConfirmationButton(buttonDescription: "Cancel", buttonBackgroundColor: Color.red, enabled: .constant(true)){
                        NavigationUtil.popToRootView()
                    }
                    
                }
            }
            .onAppear{
                if !isManualInput{
                    formTypes = [.nominal, .category]
                }
                else{
                    formTypes = [.nominal, .category, .photo, .date]
                }
                if isManualInput && capturedImage != nil{
                    formTypes = [.nominal, .category, .date]
                }
                if editingMode{
                    if let amount = coreDataViewModel.expenseToBeEdited?.amount{
                        expenseAmount = String(amount)
                        
                    }
                    if let category = coreDataViewModel.expenseToBeEdited?.category{
                        categorySelected = CategoryModel(category: category)
                        
                    }
                    if let dateRecorded = coreDataViewModel.expenseToBeEdited?.timestamp{
                        expenseDate = dateRecorded
                    }
                    formTypes = [.nominal, .category, .date]
                }
            }
        }
        
    }
}

struct ManualInputFormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView(isManualInput: .constant(true), capturedImage: UIImage())
            .environmentObject(CoreDataViewModel())
            .environmentObject(ExpensesViewModel())
    }
}
