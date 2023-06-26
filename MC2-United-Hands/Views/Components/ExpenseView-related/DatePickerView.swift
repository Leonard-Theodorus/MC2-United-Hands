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
    
    @Binding var date: Date
    @EnvironmentObject var sheetManager: SheetManager
    @State var monthIndex: Int = Calendar.current.component(.month, from: Date())-1
    @State var yearIndex: Int = 10
    
    let monthSymbols = Calendar.current.monthSymbols
    let currentYear = Calendar.current.component(.year, from: Date())
    let years = Array(Calendar.current.component(.year, from: Date())-10..<Calendar.current.component(.year, from: Date())+1)
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                // bagian 1
                HStack {
                    Text("Choose Month")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding()
                    Spacer()
                    
                    Button {
                        withAnimation {
                            sheetManager.dismiss()
                        }
                    } label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: width * 0.03)
                            .padding(10)
                            .foregroundColor(.secondary)
                            .fontWeight(.bold)
                            .background(Color.datePickerCloseGray)
                            .clipShape(Circle())
                            .padding()
                    }
                    
                }
                
                // bagian 2
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
                
                // bagian 3
                FormDoneButton()
                    .padding(.bottom)
            }
            .padding(.vertical)
            .frame(width: width, height: height * 0.4)
            
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                }
                    .foregroundColor(Color.datePickerGray)
            )
            .transition(.move(edge: .bottom))
        }
        .ignoresSafeArea()
        .transition(.move(edge: .bottom))
    }
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, date: .constant(Date.now))
    }
}
