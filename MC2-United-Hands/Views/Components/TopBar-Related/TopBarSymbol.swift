//
//  TopBarSymbol.swift
//  MC2-United-Hands
//
//  Created by Priskilla Adriani on 24/06/23.
//

import SwiftUI

@ViewBuilder
func topBarSymbol(width: CGFloat, height: CGFloat, imageName: String) -> some View {
    HStack {
        Spacer()
        VStack{
            Spacer()
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: width * 0.4)
                .offset(x: -width * 0.03)
                .padding(.trailing)
                .padding(.bottom)
        }
        .frame(width: width * 0.4)
    }
}
