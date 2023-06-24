//
//  TopBarView.swift
//  MC2-United-Hands
//
//  Created by Priskilla Adriani on 24/06/23.
//

import SwiftUI

struct TopBarView: View {
    var width: CGFloat
    var height: CGFloat
    
    @Binding var pageNavigator : PageNavigation
    @Binding var userName: String
    @Binding var isDatePicker: Bool
    @Binding var totalExpenses: Int
    
    var dateInterval: String = "16-23 June 2023"
    
    var body: some View {
        VStack {
            ZStack {
                TopBarItem(width: width, height: height, userName: userName, title: pageNavigator.topBarTitle, dateInterval: dateInterval, pagenavigator: pageNavigator, totalExpenses: $totalExpenses, isDatePicker: $isDatePicker)
                
                topBarSymbol(width: width, height: height, imageName: pageNavigator.topBarCat)
            }
            Divider()
        }
        .padding(.top, 40)
        .frame(width: width, height: height * 0.16)
    }
}

struct TopBarView_Preview : PreviewProvider{
    static var previews: some View{
        TopBarView(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, pageNavigator: .constant(.expenses), userName: .constant("Kucing"), isDatePicker: .constant(false), totalExpenses: .constant(4000000))
    }
    
}
