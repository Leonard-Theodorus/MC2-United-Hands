//
//  EmptyExpenseView.swift
//  MC2-United-Hands
//
//  Created by Leonard Theodorus on 25/06/23.
//

import SwiftUI

struct EmptyExpenseView: View {
    var height : CGFloat
    var body: some View {
        Image("CatExpenses")
            .resizable()
            .scaledToFit()
            .frame(height: height * 0.32)
        
        Text("You haven't added any expense yet")
            .fontWeight(.bold)
            .font(.headline)
            .padding(.top)
        
        Text("Go take a moment of your expense by")
            .font(.subheadline)
            .foregroundColor(.secondary)
            .padding(.vertical, 1)
        
        Text("tapping plus button below")
            .font(.subheadline)
            .foregroundColor(.secondary)
    }
}

struct EmptyExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyExpenseView(height: UIScreen.main.bounds.height)
    }
}
