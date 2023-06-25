//
//  DataModel.swift
//  ExpenseData
//
//  Created by Jason Leonardo on 22/06/23.
//

import Foundation
import SwiftUI

struct expenseData: Hashable {
    let id = UUID()
    let image: UIImage?
    let category: String?
    let amount: Int?
    let timestamp: Date?
    
}
