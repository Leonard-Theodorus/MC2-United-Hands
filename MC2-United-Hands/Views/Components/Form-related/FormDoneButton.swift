//
//  FormDoneButton.swift
//  MC2-United-Hands
//
//  Created by Leonard Theodorus on 22/06/23.
//

import SwiftUI

struct FormDoneButton: View {
    var action: () -> Void
    
    var body: some View {
        Button (action: action){
            HStack {
                Spacer()
                HStack{
                    Text("Done")
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.white)
                    
                }
                Spacer()
            }
            .background(
                RoundedRectangle(cornerRadius: 20).fill(Color.primaryBlue)
            )
            .padding(.horizontal)
        }
        .accessibilityLabel(Text("Done"))
        
    }
}

struct FormDoneButton_Previews: PreviewProvider {
    static var previews: some View {
        FormDoneButton(action: {})
    }
}
