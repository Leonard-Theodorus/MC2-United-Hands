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
    var body: some View {
        HStack{
            ForEach(coreDataVm.userExpenses, id: \.id) { expense in
                ExpenseCard(expenseData: expense)
                    .onTapGesture {
                        // TODO: Pass all parameters
                        withAnimation {
                            expenseVm.isDetailExpense.toggle()
                            coreDataVm.expenseToBeEdited = expense
                        }
                    }
            }
        }
    }
}

struct ExpensesHorizontalScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ExpensesHorizontalScrollView()
    }
}
