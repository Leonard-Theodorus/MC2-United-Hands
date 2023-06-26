//
//  DateViewModel.swift
//  MC2-United-Hands
//
//  Created by Priskilla Adriani on 26/06/23.
//

import Foundation

class ExpensesViewModel: ObservableObject {
    @Published var startDate = Date()
    @Published var interval = TimeInterval()
    @Published var endDate = Date()
    
    func dateInterval() -> String {
        var customCalendar = Calendar(identifier: .gregorian)
        customCalendar.firstWeekday = 2
        
        startDate = Date()
        customCalendar.dateInterval(of: .weekOfMonth, start: &startDate, interval: &interval, for: Date())
        endDate = startDate.addingTimeInterval(interval - 1)
        
        return Formatter.dateInterval.string(from: startDate, to: endDate)
    }

}
