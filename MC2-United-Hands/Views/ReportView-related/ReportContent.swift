//
//  ReportContent.swift
//  MC2-United-Hands
//
//  Created by Jason Leonardo on 30/06/23.
//

import SwiftUI

struct ReportContent: View {
    @EnvironmentObject var coreDataVm : CoreDataViewModel
    @EnvironmentObject var expenseVm : ExpensesViewModel
    var body: some View {
        ScrollView(showsIndicators : false){
            //1. Food and Drink
            if coreDataVm.reportExpenses.filter({ $0.category == ExpenseCategory.food.categoryText }).count != 0
            {
                CategoryExpenseView(category: ExpenseCategory.food.categoryText, nominal: coreDataVm.reportExpenses.filter({ $0.category == ExpenseCategory.food.categoryText }).map({$0.amount ?? 0}).reduce(0, +), expenseAtCategory: ExpenseCategory.food.categoryText)
            }
            
            //2. Groceries
            if coreDataVm.reportExpenses.filter({ $0.category == ExpenseCategory.groceries.categoryText }).count != 0
            {
                CategoryExpenseView(category: ExpenseCategory.groceries.categoryText, nominal: coreDataVm.reportExpenses.filter({ $0.category == ExpenseCategory.groceries.categoryText }).map({$0.amount ?? 0}).reduce(0, +), expenseAtCategory: ExpenseCategory.groceries.categoryText)
            }
            
            // 3. Shopping
            
            if coreDataVm.reportExpenses.filter({ $0.category == ExpenseCategory.shopping.categoryText }).count != 0
            {
                CategoryExpenseView(category: ExpenseCategory.shopping.categoryText, nominal: coreDataVm.reportExpenses.filter({ $0.category == ExpenseCategory.shopping.categoryText }).map({$0.amount ?? 0}).reduce(0, +), expenseAtCategory: ExpenseCategory.shopping.categoryText)
            }
            
            // 4. Entertainment
            if coreDataVm.reportExpenses.filter({ $0.category == ExpenseCategory.entertainment.categoryText }).count != 0
            {
                CategoryExpenseView(category: ExpenseCategory.entertainment.categoryText, nominal: coreDataVm.reportExpenses.filter({ $0.category == ExpenseCategory.entertainment.categoryText }).map({$0.amount ?? 0}).reduce(0, +), expenseAtCategory: ExpenseCategory.entertainment.categoryText)
            }
            
            // 5. Rent
            if coreDataVm.reportExpenses.filter({ $0.category == ExpenseCategory.rent.categoryText }).count != 0
            {
                CategoryExpenseView(category: ExpenseCategory.rent.categoryText, nominal: coreDataVm.reportExpenses.filter({ $0.category == ExpenseCategory.rent.categoryText }).map({$0.amount ?? 0}).reduce(0, +), expenseAtCategory: ExpenseCategory.rent.categoryText)
            }
            
            // 6. Transport
            if coreDataVm.reportExpenses.filter({ $0.category == ExpenseCategory.transport.categoryText }).count != 0
            {
                CategoryExpenseView(category: ExpenseCategory.transport.categoryText, nominal: coreDataVm.reportExpenses.filter({ $0.category == ExpenseCategory.transport.categoryText }).map({$0.amount ?? 0}).reduce(0, +), expenseAtCategory: ExpenseCategory.transport
                    .categoryText)
            }
            
            //7. Other
            if coreDataVm.reportExpenses.filter({ $0.category == ExpenseCategory.other.categoryText }).count != 0
            {
                CategoryExpenseView(category: ExpenseCategory.other.categoryText, nominal: coreDataVm.reportExpenses.filter({ $0.category == ExpenseCategory.other.categoryText }).map({$0.amount ?? 0}).reduce(0, +), expenseAtCategory: ExpenseCategory.other
                    .categoryText)
            }
        }
    }
}

struct ReportContent_Previews: PreviewProvider {
    static var previews: some View {
        ReportContent()
            .environmentObject(CoreDataViewModel())
    }
}
