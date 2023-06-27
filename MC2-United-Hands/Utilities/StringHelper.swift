//
//  StringHelper.swift
//  MC2-United-Hands
//
//  Created by Leonard Theodorus on 27/06/23.
//

import Foundation

func expenseAmountFromString(for expenseAmount : String) -> Int{
    let cleaned = expenseAmount.replacingOccurrences(of: ".", with: "")
    return Int(cleaned) ?? 0
}
