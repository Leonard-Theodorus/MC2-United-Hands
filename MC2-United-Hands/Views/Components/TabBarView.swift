//
//  TapBarView.swift
//  MC2-United-Hands
//
//  Created by Priskilla Adriani on 23/06/23.
//

import SwiftUI

struct TabBarView: View {
    var width: CGFloat
    var height: CGFloat
    @Binding var pageNavigator : PageNavigation
    var body: some View {
        VStack {
            Divider()
                .frame(minHeight: 2)
                .background(.quaternary)
            
            HStack {
                tabBarItem(for: .expenses, width: width, height: height, currentTab: pageNavigator)
                    .onTapGesture {
                        pageNavigator = .expenses
                    }
                
                Spacer()
                
                TabBarPlusButton(width: width, height: height)
                
                Spacer()
                
                tabBarItem(for: .report, width: width, height: height, currentTab: pageNavigator)
                    .onTapGesture {
                        pageNavigator = .report
                    }
                
            }
            .frame(width: width, height: height * 0.1)
            
        }
        .ignoresSafeArea()
    }
}

struct TabBarView_Preview : PreviewProvider{
    static var previews: some View{
        TabBarView(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, pageNavigator: .constant(.expenses))
    }
    
}
