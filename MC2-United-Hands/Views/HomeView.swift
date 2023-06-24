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
    var body: some View {
        VStack {
            if pageNavigator == .expenses{
                //TODO: Expense View
            }
            else{
                //TODO: Report View
            }
            Spacer()
            TabBarView(width: width, height: height, pageNavigator: $pageNavigator)
        }
    }
}
