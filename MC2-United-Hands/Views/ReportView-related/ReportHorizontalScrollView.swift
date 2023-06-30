//
//  ReportHorizontalScrollView.swift
//  MC2-United-Hands
//
//  Created by Jason Leonardo on 30/06/23.
//

import SwiftUI

import SwiftUI

struct ReportHorizontalScrollView: View {
    @EnvironmentObject var coreDataVm : CoreDataViewModel
    @EnvironmentObject var expenseVm : ExpensesViewModel
    @Binding var expenseAtCategory: String
    var body: some View {
        HStack{
            ForEach(coreDataVm.reportExpenses.filter({ $0.category == expenseAtCategory }), id: \.id) { expense in
                RoundedImage(expenseImage: expense.image ?? UIImage(), width: 120, height: 120)
                    .onTapGesture {
                        withAnimation {
                            expenseVm.isDetailExpense.toggle()
                            coreDataVm.expenseToBeEdited = expense
                        }
                    }
            }
        }
    }
}

struct ReportHorizontalScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ExpensesHorizontalScrollView(expenseAtDate: .constant(Date()))
            .environmentObject(CoreDataViewModel())
    }
}
