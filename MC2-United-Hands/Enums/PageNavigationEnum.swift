//
//  PageNavigationEnum.swift
//  MC2-United-Hands
//
//  Created by Leonard Theodorus on 24/06/23.
//

import Foundation
enum PageNavigation : Int{
    case expenses
    case report
    
    var tabBarItemImageName : String {
        switch self{
        case .expenses:
            return "list.bullet.rectangle.fill"
        case .report:
            return "doc.fill"
        }
    }
    
    var tabBarItemDescription : String {
        switch self{
        case .expenses:
            return "Expenses"
        case .report:
            return "Report"
        }
    }
    
    var topBarTitle : String {
        switch self {
        case .expenses:
            return "Your Weekly Expenses"
        case .report:
            return "Your Expenses Report"
        }
    }
}
