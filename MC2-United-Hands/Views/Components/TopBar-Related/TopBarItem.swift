//
//  TopBarItem.swift
//  MC2-United-Hands
//
//  Created by Priskilla Adriani on 24/06/23.
//

import SwiftUI

struct TopBarItem: View {
    var width: CGFloat
    var height: CGFloat
    var title: String
    var dateInterval: String
    var pagenavigator: PageNavigation
    
    @Binding var totalExpenses: Int
    @Binding var isDatePicker: Bool
    
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text( title)
                    .font(.title2)
                    .frame(height: height * 0.02)
                
                Text("Rp.\(Formatter.currencyFormatter.string(from: totalExpenses as NSNumber)!)")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 1)
                
                if pagenavigator == .report {
                    Button {
                        isDatePicker.toggle()
                    } label: {
                        Text("\(Image(systemName: "calendar.badge.clock")) \(dateInterval)")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .padding(8)
                            .background(.quaternary)
                            .cornerRadius(50)
                    }
                    .foregroundColor(.blue)
                } else {
                    Text("\(dateInterval)")
                        .foregroundColor(.blue)
                        .padding(.vertical, 7)
                }
            }
            Spacer()
        }
        .padding(.vertical)
        .padding(.leading)
        .frame(width: width)
    }
}
