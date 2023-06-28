//
//  CloseButton.swift
//  MC2-United-Hands
//
//  Created by Priskilla Adriani on 27/06/23.
//

import SwiftUI

struct CloseButton: View {
    var width: CGFloat
    var foregroundColor: Color
    var backgroundColor: Color
    var action: () -> Void
    
    var body: some View {
        Button (action: action) {
            Image(systemName: "xmark")
                .resizable()
                .scaledToFit()
                .frame(width: width * 0.03)
                .padding(10)
                .foregroundColor(foregroundColor)
                .fontWeight(.bold)
                .background(backgroundColor)
                .clipShape(Circle())
                .padding()
        }
    }
}

struct CloseButton_Previews: PreviewProvider {
    static var previews: some View {
        CloseButton(width: UIScreen.main.bounds.width, foregroundColor: .secondary, backgroundColor: .datePickerGray, action: {})
    }
}
