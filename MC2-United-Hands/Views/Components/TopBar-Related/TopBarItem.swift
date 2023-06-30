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
    @EnvironmentObject var sheetManager: SheetManager
    
    var body: some View {
        HStack(alignment: .bottom) {
            VStack (alignment: .leading) {
                Text( title)
                    .font(.title2)
                    .frame(height: height * 0.02)
                    .padding(.bottom, 0.5)
                
                Text("Rp.\(Formatter.currencyFormatter.string(from: totalExpenses as NSNumber)!)")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 0.5)
                
                if pagenavigator == .report {
                    Button {
                        withAnimation {
                            sheetManager.present()
                        }
                    } label: {
                        Text("\(Image(systemName: "calendar.badge.clock")) \(dateInterval)")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .padding(7)
                            .background(.quaternary)
                            .cornerRadius(50)
                    }
                    .foregroundColor(.blue)
                } else {
                    Text("\(dateInterval)")
                        .foregroundColor(.blue)
                }
            }
            Spacer()
        }
        .padding(.vertical)
        .padding(.leading)
        .frame(width: width, height: 120)
    }
}
struct TopBarItem_Previews : PreviewProvider{
    static var previews: some View{
        TopBarItem(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, title: "", dateInterval: "26 June - 30 June 2023", pagenavigator: .expenses, totalExpenses: .constant(0))
            .environmentObject(SheetManager())
    }
}
