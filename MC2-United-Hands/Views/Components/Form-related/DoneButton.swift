//
//  FormDoneButton.swift
//  MC2-United-Hands
//
//  Created by Leonard Theodorus on 22/06/23.
//

import SwiftUI

struct ConfirmationButton: View {
    var buttonDescription : String
    var buttonBackgroundColor : Color
    var action: () -> Void
    var body: some View {
        Button (action: action){
            HStack {
                Spacer()
                HStack{
                    Text(buttonDescription)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.white)
                    
                }
                Spacer()
            }
            .background(
                RoundedRectangle(cornerRadius: 20).fill(buttonBackgroundColor)
            )
            .padding(.horizontal)
        }
        .accessibilityLabel(Text("Done"))
        
    }
}

struct ConfirmationButton_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationButton(buttonDescription: "Done", buttonBackgroundColor: Color.primaryBlue, action: {})
    }
}
