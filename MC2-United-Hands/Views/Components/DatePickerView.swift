//
//  DatePickerView.swift
//  MC2-United-Hands
//
//  Created by Priskilla Adriani on 24/06/23.
//

import SwiftUI

struct DatePickerView: View {
    @Binding var date: Date
    @Binding var isDatePicker: Bool
    
    var body: some View {
        ZStack{
            Color(.black)
                .opacity(0.3)
                .onTapGesture {
                    isDatePicker.toggle()
                }
            
            DatePicker(
                "Date",
                selection: $date,
                displayedComponents: [.date]
            )
            .datePickerStyle(.graphical)
            .background(.white)
            .cornerRadius(20)
            .padding()
        }
        .ignoresSafeArea()
    }
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView(date: .constant(Date.now), isDatePicker: .constant(true))
    }
}
