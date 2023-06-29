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
    @Binding var enabled : Bool
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
                RoundedRectangle(cornerRadius: 20).fill(!enabled ? .gray : buttonBackgroundColor)
            )
            .padding(.horizontal)
        }
        .disabled(!enabled)
        .accessibilityLabel(Text("Done"))
        
    }
}

struct CapsuleConfirmationButton: View {
    var buttonDescription : String
    var width: CGFloat
    var dest: any View
    
    var body: some View {
        NavigationLink() {
            if buttonDescription == "Done" {
                AnyView(dest)
                    .navigationBarBackButtonHidden(true)
            } else {
                AnyView(dest)
            }
        } label: {
            Text(buttonDescription)
                .padding(10)
                .frame(width: width * 0.9)
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(30)
        }
        .padding()
    }
}

struct ConfirmationButton_Previews: PreviewProvider {
    static var previews: some View {
//        ConfirmationButton(buttonDescription: "Done", buttonBackgroundColor: Color.primaryBlue, action: {})
        
        CapsuleConfirmationButton(buttonDescription: "Done", width: UIScreen.main.bounds.width, dest: EmptyView())
    }
}
