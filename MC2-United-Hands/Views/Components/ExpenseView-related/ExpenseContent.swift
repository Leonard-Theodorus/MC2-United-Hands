//
//  ExpenseContent.swift
//  MC2-United-Hands
//
//  Created by Leonard Theodorus on 26/06/23.
//

import SwiftUI
struct ExpenseContent: View {
    @EnvironmentObject var coreDataVm : CoreDataViewModel
    @EnvironmentObject var expenseVm : ExpensesViewModel
    var body: some View {
        ScrollView(showsIndicators : false){
            //Today
            if coreDataVm.userExpenses.filter({dayOfDate(for: $0.timestamp ?? Date()) == dayOfDate(for: Date.now)}).count != 0{
                DailyExpenseView(date: Date.now, nominal: coreDataVm.userExpenses.filter({dayOfDate(for: $0.timestamp ?? Date()) == dayOfDate(for: Date.now)}).map({$0.amount ?? 0}).reduce(0, +))
            }
            //H-1
            if coreDataVm.userExpenses.filter({dayOfDate(for: $0.timestamp ?? Date())  ==
                dayOfDate(for: Calendar.current.date(byAdding: .day, value: -1, to: Date.now) ?? Date())}).count != 0{
                DailyExpenseView(date: Calendar.current.date(byAdding: .day, value: -1, to: Date()) ?? Date(), nominal: coreDataVm.userExpenses.filter({dayOfDate(for: $0.timestamp ?? Date())  ==
                    dayOfDate(for: Calendar.current.date(byAdding: .day, value: -1, to: Date.now) ?? Date())}).map({$0.amount ?? 0}).reduce(0, +))
            }
            //H-2
            if coreDataVm.userExpenses.filter({dayOfDate(for: $0.timestamp ?? Date()) == dayOfDate(for: Calendar.current.date(byAdding: .day, value: -2, to: Date.now) ?? Date()) }).count != 0{
                DailyExpenseView(date: Calendar.current.date(byAdding: .day, value: -2, to: Date()) ?? Date(), nominal: coreDataVm.userExpenses.filter({dayOfDate(for: $0.timestamp ?? Date())  ==
                    dayOfDate(for: Calendar.current.date(byAdding: .day, value: -2, to: Date.now) ?? Date())}).map({$0.amount ?? 0}).reduce(0, +))
            }
            //H-3
            if coreDataVm.userExpenses.filter({dayOfDate(for: $0.timestamp ?? Date()) == dayOfDate(for: Calendar.current.date(byAdding: .day, value: -3, to: Date.now) ?? Date())}).count != 0{
                DailyExpenseView(date: Calendar.current.date(byAdding: .day, value: -3, to: Date()) ?? Date(), nominal: coreDataVm.userExpenses.filter({dayOfDate(for: $0.timestamp ?? Date()) == dayOfDate(for: Calendar.current.date(byAdding: .day, value: -3, to: Date.now) ?? Date())}).map({$0.amount ?? 0}).reduce(0, +))
            }
            //H-4
            if coreDataVm.userExpenses.filter({dayOfDate(for: $0.timestamp ?? Date()) == dayOfDate(for: Calendar.current.date(byAdding: .day, value: -4, to: Date.now) ?? Date())}).count != 0{
                DailyExpenseView(date: Calendar.current.date(byAdding: .day, value: -4, to: Date()) ?? Date(), nominal: coreDataVm.userExpenses.filter({dayOfDate(for: $0.timestamp ?? Date()) == dayOfDate(for: Calendar.current.date(byAdding: .day, value: -4, to: Date.now) ?? Date())}).map({$0.amount ?? 0}).reduce(0, +))
            }
            //H-5
            if coreDataVm.userExpenses.filter({dayOfDate(for: $0.timestamp ?? Date()) == dayOfDate(for: Calendar.current.date(byAdding: .day, value: -5, to: Date.now) ?? Date())}).count != 0{
                DailyExpenseView(date: Calendar.current.date(byAdding: .day, value: -5, to: Date()) ?? Date(), nominal: coreDataVm.userExpenses.filter({dayOfDate(for: $0.timestamp ?? Date()) == dayOfDate(for: Calendar.current.date(byAdding: .day, value: -5, to: Date.now) ?? Date())}).map({$0.amount ?? 0}).reduce(0, +))
            }
            //H-6
            if coreDataVm.userExpenses.filter({dayOfDate(for: $0.timestamp ?? Date()) == dayOfDate(for: Calendar.current.date(byAdding: .day, value: -6, to: Date.now) ?? Date())}).count != 0{
                DailyExpenseView(date: Calendar.current.date(byAdding: .day, value: -6, to: Date()) ?? Date(), nominal: coreDataVm.userExpenses.filter({dayOfDate(for: $0.timestamp ?? Date()) == dayOfDate(for: Calendar.current.date(byAdding: .day, value: -6, to: Date.now) ?? Date())}).map({$0.amount ?? 0}).reduce(0, +))
            }
        }
        
        
    }
}

struct ExpenseContent_Previews: PreviewProvider {
    static var previews: some View {

        ExpenseContent()
            .environmentObject(CoreDataViewModel())
    }
}
