//
//  ExpensesView.swift
//  MC2-United-Hands
//
//  Created by Priskilla Adriani on 24/06/23.
//

import SwiftUI

struct ExpensesView: View {
    var width: CGFloat
    var height: CGFloat
    @Binding var pageNavigator: PageNavigation
    @Binding var isDatePicker: Bool
    @Binding var totalExpenses: Int
    
    var body: some View {
        VStack {
            if totalExpenses == 0 {
                Image("CatExpenses")
                    .resizable()
                    .scaledToFit()
                    .frame(height: height * 0.32)
                
                Text("You haven't added any expense yet")
                    .fontWeight(.bold)
                    .font(.headline)
                    .padding(.top)
                
                Text("Go take a moment of your expense by")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.vertical, 1)
                
                Text("tapping plus button below")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            else {
                TopBarView(width: width, height: height, date: dateInterval, pageNavigator: $pageNavigator, isDatePicker: $isDatePicker, totalExpenses: $totalExpenses)
                Spacer()
//                Text(dateInterval)
            }
        }
    }
}
