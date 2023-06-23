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
    
    @State private var isExpenseActive: Bool = true
    
    var body: some View {
        VStack {
            Spacer()
            TabBarView(width: width, height: height, isExpenseActive: $isExpenseActive)
        }
    }
}
