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
    @State var expensesVM = ExpensesViewModel()
    @EnvironmentObject var coreDataVm : CoreDataViewModel
    var body: some View {
        VStack {
            if coreDataVm.userExpenses.count == 0 {
                EmptyExpenseView(height: height)
            }
            else {
                TopBarView(width: width, height: height, date: expensesVM.dateInterval(), pageNavigator: $pageNavigator)
                ExpenseContent()
                    .padding(.top)
                Spacer()
            }
        }
    }
}

struct ExpensesView_Preview : PreviewProvider{
    static var previews: some View {
        ExpensesView(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, pageNavigator: .constant(.expenses))
            .environmentObject(CoreDataViewModel())
    }
    
    
}
