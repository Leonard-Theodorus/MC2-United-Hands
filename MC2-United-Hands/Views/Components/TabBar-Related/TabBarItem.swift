//
//  TabBarItem.swift
//  MC2-United-Hands
//
//  Created by Leonard Theodorus on 24/06/23.
//

import SwiftUI
@ViewBuilder
func tabBarItem(for tab : PageNavigation, width : CGFloat, height : CGFloat, currentTab : PageNavigation) -> some View{
    if tab == .expenses{
        VStack {
            Image(systemName: tab.tabBarItemImageName)
                .resizable()
                .scaledToFit()
                .frame(width: width * 0.06, height: width * 0.06)
                .accessibilityHidden(true)
            
            Text(tab.tabBarItemDescription)
                .fontWeight(.semibold)
        }
        .accessibilityLabel(Text(tab.tabBarItemDescription + "Tab"))
        .accessibilityValue(Text("1 of 2"))
        .accessibilityAddTraits(currentTab == tab ? .isSelected : .playsSound)
        .foregroundColor(currentTab == tab ? Color.primaryBlue : Color.gray)
        .padding(.leading, width * 0.08)
        
    }
    else if tab == .report{
        VStack {
            Image(systemName: tab.tabBarItemImageName)
                .resizable()
                .scaledToFit()
                .frame(width: width * 0.06, height: width * 0.06)
                .accessibilityHidden(true)
            
            Text(tab.tabBarItemDescription)
                .fontWeight(.semibold)
        }
        .accessibilityLabel(Text(tab.tabBarItemDescription + "Tab"))
        .accessibilityValue(Text("2 of 2"))
        .accessibilityAddTraits(currentTab == tab ? .isSelected : .playsSound)
        .foregroundColor(currentTab == tab ? Color.primaryBlue : Color.gray)
        .padding(.trailing, width * 0.08)
    }
}
