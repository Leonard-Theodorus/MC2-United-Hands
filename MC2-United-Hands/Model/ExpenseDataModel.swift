//
//  Placeholder.swift
//  MC2-United-Hands
//
//  Created by Leonard Theodorus on 23/06/23.
//

import Foundation
import UIKit

struct ExpenseData: Identifiable{
    var id : UUID
    var image: UIImage?
    var category: String?
    var amount: Int?
    var timestamp: Date?
}
