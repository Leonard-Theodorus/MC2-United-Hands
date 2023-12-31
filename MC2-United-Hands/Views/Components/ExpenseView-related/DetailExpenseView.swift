//
//  DetailExpenseView.swift
//  MC2-United-Hands
//
//  Created by Priskilla Adriani on 27/06/23.
//

import SwiftUI

struct DetailExpenseView: View {
    var width: CGFloat
    var height: CGFloat
    @EnvironmentObject var coreDataVm : CoreDataViewModel
    @EnvironmentObject var expenseVm : ExpensesViewModel
    var body: some View {
        ZStack {
            // background item
            Color.black
                .opacity(0.3)
                .onTapGesture {
                    withAnimation {
                        expenseVm.isDetailExpense.toggle()
                    }
                }
            
            // komponen popup
            ZStack {
                //card dan close button
                VStack {
                    HStack {
                        Spacer()
                        CloseButton(width: width, foregroundColor: .white, backgroundColor: .gray) {
                            //TODO: Close pop up
                            withAnimation {
                                expenseVm.isDetailExpense.toggle()
                            }
                        }
                    }
                    Spacer()
                }
                .frame(height: height * 0.5)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.top, height * 0.12)
                .padding(.horizontal, width * 0.05)
                .zIndex(1)
                
                // komponen dalemnya
                VStack {
                    Image(uiImage: coreDataVm.expenseToBeEdited?.image ?? UIImage())
                        .resizable()
                        .scaledToFill()
                        .frame(width: width * 0.4, height: width * 0.4)
                        .clipShape(Circle())
                        .background(
                            Image(systemName: "photo.on.rectangle.angled")
                                .resizable()
                                .scaledToFit()
                                .frame(width: width * 0.4, height: width * 0.4)
                                .background(Color.expenseCardGrey)
                                .clipShape(Circle())
                        )
                    
                    if let amount = coreDataVm.expenseToBeEdited?.amount as? NSNumber{
                        if let nominal = Formatter.currencyFormatter.string(from: amount){
                            Text(nominal == "0" ? "No Input" : nominal)
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                        }
                    }
                    
                    
                    Divider()
                    
                    HStack {
                        Spacer()
                        
                        if let category = coreDataVm.expenseToBeEdited?.category{
                            CategoryLabel(stringLabel: category)
                        }
                        Spacer()
                        
                        VStack (alignment: .leading) {
                            if let timeStamp = coreDataVm.expenseToBeEdited?.timestamp{
                                Text(Formatter.dayFormatter.string(from: timeStamp))
                                    .foregroundColor(.secondary)
                                    .fontWeight(.semibold)
                                    .padding(.bottom, 1)
                                
                                Text(Formatter.timeFormatter.string(from: timeStamp))
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                    .fontWeight(.semibold)
                                
                            }
                        }
                        
                        Spacer()
                    }
                    .frame(width: width * 0.9)
                    .padding(.vertical)
                    
                    //TODO: Move to edit expenses
                    CapsuleConfirmationButton(buttonDescription: "Edit Expenses", width: width * 0.8, dest: FormView(isManualInput: .constant(true), editingMode: true))
                    
                    Button {
                        //TODO: Delete expense
                        coreDataVm.deleteExpense(withUUID: coreDataVm.expenseToBeEdited?.id ?? UUID())
                        coreDataVm.getExpensesByDateNoArray()
                        coreDataVm.getExpensesByMonthAndYear(date: coreDataVm.reportDate)
                        coreDataVm.totalReportExpense = coreDataVm.reportExpenses.map({$0.amount ?? 0}).reduce(0, +)
                        withAnimation {
                            expenseVm.isDetailExpense.toggle()
                            
                        }
                    } label: {
                        Text("Delete")
                            .foregroundColor(.red)
                            .cornerRadius(30)
                            .padding(.bottom)
                    }
                }
                .frame(width: width * 0.8)
                .zIndex(2)
            }
        }
        .ignoresSafeArea()
        .transition(.move(edge: .bottom))
    }
}

struct DetailExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        DetailExpenseView(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .environmentObject(CoreDataViewModel())
    }
}
