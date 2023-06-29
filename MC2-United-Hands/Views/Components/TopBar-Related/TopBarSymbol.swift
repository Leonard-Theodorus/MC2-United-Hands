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
    @Binding var pageNavigator : PageNavigation
    
    var body: some View {
        HStack {
            Spacer()
            VStack{
                Spacer()
                if !isCatButtonClicked {
                    if pageNavigator == .expenses {
                        Image(uiImage: UIImage(named: "CatHead2") ?? UIImage())
                            .resizable()
                            .scaledToFit()
                            .frame(width: width * 0.4)
                            .offset(x: -width * 0.03)
                            .padding(.trailing)
                            .padding(.bottom, 5)
                            .onTapGesture {
                                isCatButtonClicked.toggle()
                            }
                    } else {
                        Image(uiImage: UIImage(named: "CatHead1") ?? UIImage())
                            .resizable()
                            .scaledToFit()
                            .frame(width: width * 0.45)
                            .offset(x: -width * 0.06)
                            .padding(.trailing)
                            .padding(.bottom, 5)
                            .onTapGesture {
                                isCatButtonClicked.toggle()
                            }
                    }
                    
                }
                else {
                    Image(uiImage: UIImage(named: "CatHead3") ?? UIImage())
                        .resizable()
                        .scaledToFit()
                        .frame(width: width * 0.32)
                        .padding(.trailing)
                        .padding(.bottom, 5)
                        .onTapGesture {
                            isCatButtonClicked.toggle()
                        }
                }
            }
            .frame(width: width * 0.4)
        }
    }
}
