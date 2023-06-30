//
//  ExpensesHorizontalScrollView.swift
//  MC2-United-Hands
//
//  Created by Leonard Theodorus on 25/06/23.
//

import SwiftUI

struct ExpensesHorizontalScrollView: View {
    @EnvironmentObject var coreDataVm : CoreDataViewModel
    @EnvironmentObject var expenseVm : ExpensesViewModel
    @Binding var expenseAtDate: Date
    var body: some View {
        HStack{
            ForEach(coreDataVm.userExpenses.filter({dayOfDate(for: $0.timestamp ?? Date()) == dayOfDate(for: expenseAtDate)}), id: \.id) { expense in
                ExpenseCard(expenseData: expense)
                    .onTapGesture {
                        withAnimation {
                            expenseVm.isDetailExpense.toggle()
                            coreDataVm.expenseToBeEdited = expense
                        }
                    }
            }
        }
        .ignoresSafeArea()
    }
}

struct ExpensesHorizontalScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ExpensesHorizontalScrollView(expenseAtDate: .constant(Date()))
            .environmentObject(CoreDataViewModel())
    }
}
