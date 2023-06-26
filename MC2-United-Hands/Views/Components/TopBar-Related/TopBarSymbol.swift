//
//  TopBarSymbol.swift
//  MC2-United-Hands
//
//  Created by Priskilla Adriani on 24/06/23.
//

import SwiftUI

struct TopBarSymbol: View {
    var width: CGFloat
    var height: CGFloat
    @Binding var isCatButtonClicked: Bool
    
    var body: some View {
        HStack {
            Spacer()
            VStack{
                Spacer()
                if isCatButtonClicked {
                    Image("CatButton1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: width * 0.4)
                        .offset(x: -width * 0.03)
                        .padding(.trailing)
                        .padding(.bottom)
                        .onTapGesture {
                            isCatButtonClicked.toggle()
                        }
                }
                else {
                    Image("CatButton2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: width * 0.4)
                        .offset(x: -width * 0.03)
                        .padding(.trailing)
                        .padding(.bottom)
                        .onTapGesture {
                            isCatButtonClicked.toggle()
                        }
                }
            }
            .frame(width: width * 0.4)
        }
    }
}
