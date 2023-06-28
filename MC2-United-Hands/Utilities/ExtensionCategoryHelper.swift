//
//  ExtensionCategoryHelper.swift
//  MC2-United-Hands
//
//  Created by Leonard Theodorus on 27/06/23.
//

import Foundation

extension CategoryModel{
    func categoryStyleFromString() -> ExpenseCategoryPicker.expenseCategory{
        switch self.category{
        case "Food & Drink":
            return .food
        case "Groceries":
            return .groceries
        case "Shopping":
            return .shopping
        case "Entertainment":
            return .entertainment
        case "Rent":
            return .rent
        case "Transport":
            return .transport
        case "Other":
            return .other
        default:
            return .other
        }
    }
}
