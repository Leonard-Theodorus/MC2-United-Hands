//
//  ExpenseCategoryEnum.swift
//  MC2-United-Hands
//
//  Created by Leonard Theodorus on 22/06/23.
//

import SwiftUI

enum ExpenseCategory : Int {
    case food
    case groceries
    case shopping
    case entertainment
    case rent
    case transport
    case other
    
    var foregroundColor : Color {
        switch self{
        case .food:
            return .cyan
        case .groceries:
            return .orange
        case .shopping:
            return .green
        case .entertainment:
            return .primaryBlue
        case .rent:
            return .darkGreen
        case .transport:
            return .red
        case .other:
            return .black
        }
    }
    var icon : String{
        switch self{
        case .food:
            return "takeoutbag.and.cup.and.straw"
        case .groceries:
            return "cart.fill"
        case .shopping:
            return "creditcard.fill"
        case .entertainment:
            return "figure.dance"
        case .rent:
            return "house.fill"
        case .transport:
            return "car.fill"
        case .other:
            return "list.bullet.rectangle.fill"
        }
    }
    var categoryText : String{
        switch self{
        case .food:
            return "Food & Drink"
        case .groceries:
            return "Groceries"
        case .shopping:
            return "Shopping"
        case .entertainment:
            return "Entertainment"
        case .rent:
            return "Rent"
        case .transport:
            return "Transport"
        case .other:
            return "Other"
        }
    }
}
