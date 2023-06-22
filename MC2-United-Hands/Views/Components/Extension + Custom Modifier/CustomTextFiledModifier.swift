//
//  CustomTextFiledModifier.swift
//  MC2-United-Hands
//
//  Created by Leonard Theodorus on 22/06/23.
//

import SwiftUI

struct BorderedFieldStyle : ViewModifier{
    var cornerRadius : CGFloat
    var strokeColor : Color
    func body(content: Content) -> some View {
        content
            .padding()
            .cornerRadius(cornerRadius)
            .overlay(RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(strokeColor, lineWidth: 1.5)
            )
    }
    
}
