//
//  DatePickerView.swift
//  MC2-United-Hands
//
//  Created by Priskilla Adriani on 24/06/23.
//

import SwiftUI

struct DatePickerView: View {
    var width: CGFloat
    var height: CGFloat
    
    let monthSymbols = Calendar.current.monthSymbols
    let currentYear = Calendar.current.component(.year, from: Date())
    let years = Array(Calendar.current.component(.year, from: Date())-10..<Calendar.current.component(.year, from: Date())+1)
    @EnvironmentObject var coreDataVm : CoreDataViewModel
    @EnvironmentObject var sheetManager: SheetManager
    @Binding var date: Date
    @Binding var yearIndex: Int
    @Binding var monthIndex: Int
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                DatePickerTitle(width: width)
                
                DatePickerItem(monthIndex: $monthIndex, yearIndex: $yearIndex, monthSymbols: monthSymbols, years: years)
                
                ConfirmationButton(buttonDescription: "Done", buttonBackgroundColor: Color.primaryBlue, enabled: .constant(true)){
                    withAnimation {
                        sheetManager.dismiss()
                    }
                    let stringChosenDate = "01 \(monthSymbols[monthIndex]) \(years[yearIndex])"
                    date = Formatter.stringToDateFormatter.date(from: stringChosenDate) ?? Date()
                    coreDataVm.reportDate = date
                    coreDataVm.getExpensesByMonthAndYear(date: coreDataVm.reportDate)
                    coreDataVm.totalReportExpense = coreDataVm.reportExpenses.map({$0.amount ?? 0}).reduce(0, +)
                }
                    .padding(.bottom)
            }
            .padding(.vertical)
            .frame(width: width, height: height * 0.4)
            
            .background (
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                }
                    .foregroundColor(Color.datePickerGray)
            )
            .transition(.move(edge: .bottom))
        }
        .ignoresSafeArea()
        .transition(.move(edge: .bottom))
        .onAppear {
            
            monthIndex = Calendar.current.component(.month, from: date)-1
        }
    }
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, date: .constant(Date.now), yearIndex: .constant(10), monthIndex: .constant(0))
    }
}
