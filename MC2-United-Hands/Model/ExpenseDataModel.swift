//
//  Placeholder.swift
//  MC2-United-Hands
//
//  Created by Leonard Theodorus on 23/06/23.
//

import Foundation
import UIKit

struct expenseData : Hashable{
    let id : UUID = UUID()
    let image : UIImage?
    let category: String?
    let amount: Int?
    let timestamp: Date?
}
