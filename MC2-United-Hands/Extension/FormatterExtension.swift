//
//  CurrencyFormatter.swift
//  MC2-United-Hands
//
//  Created by Priskilla Adriani on 26/06/23.
//

import Foundation

extension Formatter {
    //xxx.xxx.xxx
    static let currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "id_ID")
        formatter.groupingSeparator = "."
        return formatter
    }()
    
    // June 2023
    static let monthFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter
    }()
    
    // 10.52 PM
    static let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh.mm a"
        return formatter
    }()
    
    // Jun 26 - Jul 2, 2023
    static let dateInterval: DateIntervalFormatter = {
        let formatter = DateIntervalFormatter()
        formatter.dateTemplate = "dd MMM yyyy"
        return formatter
    }()
    
    // January 16, 2023
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, dd yyyy"
        return formatter
    }()
    // Tuesday, 27 June, 2023
    static let dayFormatter : DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, dd MMMM, YYYY"
        return formatter
    }()
    
    // 6/25/23, 10:52:25 PM
    static let itemFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }()
    
    static let stringToDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy"
        return formatter
    }()
}
