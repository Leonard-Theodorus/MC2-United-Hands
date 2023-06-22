//
//  CategoryLabel.swift
//  MC2-United-Hands
//
//  Created by Leonard Theodorus on 22/06/23.
//

import SwiftUI

struct CategoryLabel: View {
    @State var stringLabel : String = ""
    var body: some View {
        Text(stringLabel)
            .font(.body)
            .foregroundColor(.blue)
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(
                RoundedRectangle(cornerRadius: 200).foregroundColor(.primaryBlue.opacity(0.1))
                    
            )
    }
}

struct CategoryLabel_Previews: PreviewProvider {
    static var previews: some View {
        CategoryLabel()
    }
}
