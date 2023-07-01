//
//  HomeView.swift
//  MC2-United-Hands
//
//  Created by Priskilla Adriani on 23/06/23.
//

import SwiftUI

struct HomeView: View {
    var width: CGFloat
    var height: CGFloat
    @Binding var pageNavigator : PageNavigation
    @State var date = Date.now
    @State var monthIndex: Int = 0
    @State var yearIndex: Int = 10
    @EnvironmentObject var sheetManager: SheetManager
    @EnvironmentObject var coredataVm : CoreDataViewModel
    @EnvironmentObject var expenseVm : ExpensesViewModel
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack (spacing: .zero) {
                if pageNavigator == .expenses{
                    ExpensesView(width: width, height: height, pageNavigator: $pageNavigator)
                        .frame(width: width, height: height * 0.9)
                        .onAppear{
                            coredataVm.getExpensesByDateNoArray()
                            coredataVm.totalWeeklyExpense = coredataVm.userExpenses.map({$0.amount ?? 0}).reduce(0, +)
                            
                        }
                }
                else{
                    //TODO: Report View
                    ReportView(width: width, height: height, date: date, pageNavigator: $pageNavigator)
                        .frame(width: width, height: height * 0.9)
                        .onAppear{
                            coredataVm.getExpensesByMonthAndYear(date: coredataVm.reportDate)
                            
                            coredataVm.totalReportExpense = coredataVm.reportExpenses.map({$0.amount ?? 0}).reduce(0, +)
                            
                        }
                }
                
                TabBarView(width: width, height: height, pageNavigator: $pageNavigator)
            }
            .onChange(of: coredataVm.userExpenses.count, perform: { newValue in
                coredataVm.getExpensesByMonthAndYear(date: coredataVm.reportDate)
                coredataVm.getExpensesByDateNoArray()
                coredataVm.totalWeeklyExpense = coredataVm.userExpenses.map({$0.amount ?? 0}).reduce(0, +)
                coredataVm.totalReportExpense = coredataVm.reportExpenses.map({$0.amount ?? 0}).reduce(0, +)
            })
            .frame(width: width, height: height)
            
            if sheetManager.action.isPresented {
                DatePickerView(width: width, height: height, date: $date, yearIndex: $yearIndex, monthIndex: $monthIndex)
            }
            
            if expenseVm.isDetailExpense {
                DetailExpenseView(width: width, height: height)
            }
        }
    }
}
struct HomeView_Previews : PreviewProvider{
    static var previews: some View{
        HomeView(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, pageNavigator: .constant(.expenses))
            .environmentObject(SheetManager())
            .environmentObject(CoreDataViewModel())
            .environmentObject(ExpensesViewModel())
    }
}
