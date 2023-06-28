//
//  ExpenseContent.swift
//  MC2-United-Hands
//
//  Created by Leonard Theodorus on 26/06/23.
//

import SwiftUI
struct ExpenseContent: View {
    @Binding var isDetailExpenses: Bool
    @Binding var expenses : [ExpenseData]
    @EnvironmentObject var coreDataVm : CoreDataViewModel
    @EnvironmentObject var expenseVm : ExpensesViewModel
    var body: some View {
        ScrollView{
            //Today
            if expenses.filter({dayOfDate(for: $0.timestamp ?? Date()) == dayOfDate(for: Date.now)}).count != 0{
                DailyExpenseView(expenses: expenses, for: Date(), nominal: expenses.map({$0.amount ?? 0}).reduce(0, +))
            }
            //H-1
            if expenses.filter({dayOfDate(for: $0.timestamp ?? Date())  ==
                dayOfDate(for: Calendar.current.date(byAdding: .day, value: -1, to: Date.now) ?? Date()) }).count != 0{
                DailyExpenseView(expenses: expenses, for: Calendar.current.date(byAdding: .day, value: -1, to: Date()) ?? Date(), nominal: expenses.map({$0.amount ?? 0}).reduce(0, +))
            }
            //H-2
            if expenses.filter({dayOfDate(for: $0.timestamp ?? Date()) == dayOfDate(for: Calendar.current.date(byAdding: .day, value: -2, to: Date.now) ?? Date()) }).count != 0{
                DailyExpenseView(expenses: expenses, for: Calendar.current.date(byAdding: .day, value: -2, to: Date()) ?? Date(), nominal: expenses.map({$0.amount ?? 0}).reduce(0, +))
            }
            //H-3
            if expenses.filter({dayOfDate(for: $0.timestamp ?? Date()) == dayOfDate(for: Calendar.current.date(byAdding: .day, value: -3, to: Date.now) ?? Date())}).count != 0{
                DailyExpenseView(expenses: expenses, for: Calendar.current.date(byAdding: .day, value: -3, to: Date()) ?? Date(), nominal: expenses.map({$0.amount ?? 0}).reduce(0, +))
            }
            //H-4
            if expenses.filter({dayOfDate(for: $0.timestamp ?? Date()) == dayOfDate(for: Calendar.current.date(byAdding: .day, value: -4, to: Date.now) ?? Date())}).count != 0{
                DailyExpenseView(expenses: expenses, for: Calendar.current.date(byAdding: .day, value: -4, to: Date()) ?? Date(), nominal: expenses.map({$0.amount ?? 0}).reduce(0, +))
            }
            //H-5
            if expenses.filter({dayOfDate(for: $0.timestamp ?? Date()) == dayOfDate(for: Calendar.current.date(byAdding: .day, value: -5, to: Date.now) ?? Date())}).count != 0{
                DailyExpenseView(expenses: expenses, for: Calendar.current.date(byAdding: .day, value: -5, to: Date()) ?? Date(), nominal: expenses.map({$0.amount ?? 0}).reduce(0, +))
            }
            //H-6
            if expenses.filter({dayOfDate(for: $0.timestamp ?? Date()) == dayOfDate(for: Calendar.current.date(byAdding: .day, value: -6, to: Date.now) ?? Date())}).count != 0{
                DailyExpenseView(expenses: expenses, for: Calendar.current.date(byAdding: .day, value: -3, to: Date()) ?? Date(), nominal: expenses.map({$0.amount ?? 0}).reduce(0, +))
            }
        }
        .task {
            expenses = coreDataVm.getExpensesByDate(startDate: expenseVm.startDate, endDate: expenseVm.endDate)
        }
    }
}

struct ExpenseContent_Previews: PreviewProvider {
    static var previews: some View {

        ExpenseContent(expenses: .constant([.init(id: UUID(), image: UIImage(), category: "", amount: 0, timestamp: Date.now)]))
            .environmentObject(CoreDataViewModel())
    }
}
