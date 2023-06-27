//
//  DateHelpr.swift
//  MC2-United-Hands
//
//  Created by Leonard Theodorus on 27/06/23.
//

import Foundation

func dayOfDate(for date : Date) -> Int{
    let day = Calendar.current.component(.day, from: date)
    return day
}
