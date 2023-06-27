//
//  ExpenseContent.swift
//  MC2-United-Hands
//
//  Created by Leonard Theodorus on 26/06/23.
//

import SwiftUI
struct ExpenseContent: View {
    @State var expenses : [ExpenseData] = [
        ExpenseData(id: UUID(), image: UIImage(systemName: "trash"), category: "F&B", amount: 10, timestamp: Date.now),
        ExpenseData(id: UUID(), image: UIImage(systemName: "signature"), category: "F&B", amount: 10, timestamp: Date.now),
        ExpenseData(id: UUID(), image: UIImage(systemName: "trash"), category: "BLO", amount: 100000, timestamp: Calendar.current.date(byAdding: .day, value: -1, to: Date.now)),
        ExpenseData(id: UUID(), image: UIImage(systemName: "trash"), category: "BLE", amount: 10, timestamp: Calendar.current.date(byAdding: .day, value: -2, to: Date.now)),
        ExpenseData(id: UUID(), image: UIImage(systemName: "trash"), category: "F&B", amount: 10, timestamp: Calendar.current.date(byAdding: .day, value: -3, to: Date.now)),
        ExpenseData(id: UUID(), image: UIImage(systemName: "trash"), category: "F&B", amount: 10, timestamp: Calendar.current.date(byAdding: .day, value: -4, to: Date.now)),
        ExpenseData(id: UUID(), image: UIImage(systemName: "trash"), category: "F&B", amount: 10, timestamp: Calendar.current.date(byAdding: .day, value: -5, to: Date.now)),
        ExpenseData(id: UUID(), image: UIImage(systemName: "trash"), category: "F&B", amount: 10, timestamp: Calendar.current.date(byAdding: .day, value: -6, to: Date.now)),
    ]
    @EnvironmentObject var coreDataVm : CoreDataViewModel
    @EnvironmentObject var expenseVm : ExpensesViewModel
    var body: some View {
        ScrollView{
            //Today
            if expenses.filter({dayOfDate(for: $0.timestamp ?? Date()) == dayOfDate(for: Date.now)}).count != 0{
                DailyExpenseView(expenses: expenses, for: Date(), nominal: 25000)
            }
            //H-1
            if expenses.filter({dayOfDate(for: $0.timestamp ?? Date())  ==
                dayOfDate(for: Calendar.current.date(byAdding: .day, value: -1, to: Date.now) ?? Date()) }).count != 0{
                DailyExpenseView(expenses: expenses, for: Calendar.current.date(byAdding: .day, value: -1, to: Date()) ?? Date(), nominal: 300000)
            }
            //H-2
            if expenses.filter({dayOfDate(for: $0.timestamp ?? Date()) == dayOfDate(for: Calendar.current.date(byAdding: .day, value: -2, to: Date.now) ?? Date()) }).count != 0{
                DailyExpenseView(expenses: expenses, for: Calendar.current.date(byAdding: .day, value: -2, to: Date()) ?? Date(), nominal: 120000)
            }
            //H-3
            if expenses.filter({dayOfDate(for: $0.timestamp ?? Date()) == dayOfDate(for: Calendar.current.date(byAdding: .day, value: -3, to: Date.now) ?? Date())}).count != 0{
                DailyExpenseView(expenses: expenses, for: Calendar.current.date(byAdding: .day, value: -3, to: Date()) ?? Date(), nominal: 2500000)
            }
            //H-4
            if expenses.filter({dayOfDate(for: $0.timestamp ?? Date()) == dayOfDate(for: Calendar.current.date(byAdding: .day, value: -4, to: Date.now) ?? Date())}).count != 0{
                DailyExpenseView(expenses: expenses, for: Calendar.current.date(byAdding: .day, value: -4, to: Date()) ?? Date(), nominal: 9000000)
            }
            //H-5
            if expenses.filter({dayOfDate(for: $0.timestamp ?? Date()) == dayOfDate(for: Calendar.current.date(byAdding: .day, value: -5, to: Date.now) ?? Date())}).count != 0{
                DailyExpenseView(expenses: expenses, for: Calendar.current.date(byAdding: .day, value: -5, to: Date()) ?? Date(), nominal: 88238381)
            }
            //H-6
            if expenses.filter({dayOfDate(for: $0.timestamp ?? Date()) == dayOfDate(for: Calendar.current.date(byAdding: .day, value: -6, to: Date.now) ?? Date())}).count != 0{
                DailyExpenseView(expenses: expenses, for: Calendar.current.date(byAdding: .day, value: -3, to: Date()) ?? Date(), nominal: 1233312321)
            }
        }
//        .task {
//            expenses = coreDataVm.getExpensesByDate(startDate: expenseVm.startDate, endDate: expenseVm.endDate)
//        }
    }
}

struct ExpenseContent_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseContent()
            .environmentObject(CoreDataViewModel())
    }
}
