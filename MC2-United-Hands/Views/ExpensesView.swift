//
//  ExpensesView.swift
//  MC2-United-Hands
//
//  Created by Priskilla Adriani on 24/06/23.
//

import SwiftUI

struct ExpensesView: View {
    var width: CGFloat
    var height: CGFloat
    @Binding var pageNavigator: PageNavigation
    @Binding var totalExpenses: Int
    @State var expensesVM = ExpensesViewModel()
    @Binding var isDetailExpenses: Bool
    
    @Binding var expenses : [ExpenseData]
    @EnvironmentObject var coreDataVm : CoreDataViewModel
    var body: some View {
        VStack {
            if expenses.count == 0 {
                EmptyExpenseView(height: height)
            }
            else {
                TopBarView(width: width, height: height, date: expensesVM.dateInterval(), pageNavigator: $pageNavigator, totalExpenses: $totalExpenses)
                ExpenseContent(isDetailExpenses: $isDetailExpenses, expenses: $expenses)
                //ExpenseContent(isDetailExpenses: $isDetailExpenses)
                    .padding()
                Spacer()
            }
        }
        .onAppear {
            expenses = coreDataVm.getExpensesByDate(startDate: expensesVM.startDate, endDate: expensesVM.endDate)
        }
    }
}

struct ExpensesView_Preview : PreviewProvider{
    static var previews: some View {
        ExpensesView(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, pageNavigator: .constant(.expenses), totalExpenses: .constant(10), isDetailExpenses: .constant(false), expenses: .constant([.init(id: UUID(), image: UIImage(), category: "", amount: 0, timestamp: Date.now)]))
            .environmentObject(CoreDataViewModel())
    }
    
    
}
