//
//  DatePickerItem.swift
//  MC2-United-Hands
//
//  Created by Priskilla Adriani on 26/06/23.
//

import SwiftUI

struct DatePickerItem: View {
    @Binding var monthIndex: Int
    @Binding var yearIndex: Int
    
    let monthSymbols: [String]
    let years: [Int]
    
    
    var body: some View {
        HStack(spacing: .zero) {
            Picker("Month", selection: $monthIndex) {
                ForEach(0..<monthSymbols.count) { index in
                    Text(monthSymbols[index]).tag(index)
                }
            }
            
            Picker("Year" ,selection: $yearIndex) {
                ForEach(0..<years.count) { index in
                    Text(String(self.years[index])).tag(index)
                }
            }
        }
        .pickerStyle(.wheel)
        .background(.white)
        .cornerRadius(20)
        .padding(.horizontal, 35)
        .padding(.bottom, 10)
    }
}
