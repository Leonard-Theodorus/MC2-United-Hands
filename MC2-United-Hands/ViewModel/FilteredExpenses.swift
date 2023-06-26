//
//  ExpensesFilter.swift
//  MC2-United-Hands
//
//  Created by Cris on 25/06/23.
//

import Foundation
import CoreData

class FilteredExpenses {
    static let shared = FilteredExpenses()
    
    func categoryFilter(expenses: [expenseData], category: String) -> (filteredExpenses: [expenseData], totalAmount: Int) {
        var filteredExpenses = [expenseData]()
        var totalAmount = 0
        
        for expense in expenses {
            if expense.category == category {
                filteredExpenses.append(expense)
                if let amount = expense.amount {
                    totalAmount += amount
                }
            }
        }
        
        return (filteredExpenses, totalAmount)
    }
    
    func dateFilter(expenses: [expenseData], startDate: Date, endDate: Date) -> (filteredExpenses: [expenseData], totalAmount: Int) {
        var filteredExpenses = [expenseData]()
        var totalAmount = 0
        
        for expense in expenses {
            if let timestamp = expense.timestamp {
                if startDate <= timestamp && timestamp <= endDate {
                    filteredExpenses.append(expense)
                    if let amount = expense.amount {
                        totalAmount += amount
                    }
                }
            }
        }
        
        return (filteredExpenses, totalAmount)
    }

    func totalAmountMonthly(expenses: [expenseData]) -> Int {
        let currentDate = Date()
        let calendar = Calendar.current
        let startOfMonth = calendar.dateInterval(of: .month, for: currentDate)?.start

        let monthlyExpenses = expenses.filter { expense in
            if let timestamp = expense.timestamp {
                return calendar.isDate(timestamp, inSameDayAs: currentDate) || (startOfMonth != nil && calendar.isDate(timestamp, inSameDayAs: startOfMonth!))
            }
            return false
        }

        let totalAmount = monthlyExpenses.reduce(0) { $0 + ($1.amount ?? 0) }
        return totalAmount
    }

    
    func totalAmountWeekly(expenses: [expenseData]) -> Int {
        let currentDate = Date()
        let calendar = Calendar.current
        let startOfWeek = calendar.dateInterval(of: .weekOfYear, for: currentDate)?.start
        
        let weeklyExpenses = expenses.filter { expense in
            if let timestamp = expense.timestamp {
                return calendar.isDate(timestamp, inSameDayAs: currentDate) || (startOfWeek != nil && calendar.isDate(timestamp, inSameDayAs: startOfWeek!))
            }
            return false
        }
        
        let totalAmount = weeklyExpenses.reduce(0) { $0 + ($1.amount ?? 0) }
        return totalAmount
    }

    
    func totalAmountDaily(expenses: [expenseData]) -> Int {
        let currentDate = Date()
        let calendar = Calendar.current

        let dailyExpenses = expenses.filter { expense in
            if let timestamp = expense.timestamp {
                return calendar.isDate(timestamp, inSameDayAs: currentDate)
            }
            return false
        }

        let totalAmount = dailyExpenses.reduce(0) { $0 + ($1.amount ?? 0) }
        return totalAmount
    }

}
