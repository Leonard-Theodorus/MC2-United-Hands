//
//  HomeView.swift
//  MC2-United-Hands
//
//  Created by Priskilla Adriani on 23/06/23.
//

import SwiftUI

struct HomeView: View {
    var width: CGFloat
    var height: CGFloat
    @Binding var pageNavigator : PageNavigation
    @State var isDatePicker: Bool = false
    @State var date = Date.now
    
    var body: some View {
        ZStack {
            VStack {
                TopBarView(width: width, height: height, pageNavigator: $pageNavigator, userName: .constant("Kucing"), isDatePicker: $isDatePicker)

                if pageNavigator == .expenses{
                    //TODO: Expense View
                    ExpensesView()
                        .frame(width: width, height: height * 0.74)
                }
                else{
                    //TODO: Report View
                    ReportView()
                        .frame(width: width, height: height * 0.74)
                }

                TabBarView(width: width, height: height, pageNavigator: $pageNavigator)
            }
            .frame(width: width, height: height)
            
            if isDatePicker {
                DatePickerView(date: $date, isDatePicker: $isDatePicker)
            }
        }
    }
}
