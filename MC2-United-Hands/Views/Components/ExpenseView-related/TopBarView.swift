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
    var date: String
    
    @Binding var pageNavigator : PageNavigation
    @State var isCatButtonClicked: Bool = false
    
    var body: some View {
        VStack {
            ZStack {
                TopBarItem(width: width, height: height, title: pageNavigator.topBarTitle, dateInterval: date, pagenavigator: pageNavigator)
                
                TopBarSymbol(width: width, height: height, isCatButtonClicked: $isCatButtonClicked, pageNavigator: $pageNavigator)
            }
            Divider()
        }
        .padding(.top, 20)
        .frame(width: width, height: height * 0.16)
    }
}

struct TopBarView_Preview : PreviewProvider{
    static var previews: some View{
        TopBarView(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, date: "June 2023", pageNavigator: .constant(.expenses))
            .environmentObject(CoreDataViewModel())
    }
    
}
