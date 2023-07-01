//
//  AddManuallyOnBoardingView.swift
//  MC2-United-Hands
//
//  Created by Leonard Theodorus on 30/06/23.
//

import SwiftUI

struct AddManuallyOnBoardingView: View {
    @State var isManualInput : Bool = true
    var body: some View {
        VStack{
            Spacer()
            Image("onboardingmanualcat")
            VStack{
                Text("Add Expense Journal")
                    .font(.title2)
                    .bold()
                VStack(alignment: .leading){
                    Text("You want to record your expense with shorter form & flexible date? We got you!")
                        .fontWeight(.regular)
                        .padding(.vertical)
                }
                .padding(.horizontal, 20)
                VStack(alignment: .leading){
                    Text("1. Fill the expense form anytime you want, pictures are optional & you can set the date on your own!").foregroundColor(Color.grayText)
                    
                }
                .padding(.horizontal, 20)
            }
            Spacer()
            CapsuleConfirmationButton(buttonDescription: "Add Form", width: UIScreen.main.bounds.width, dest: FormView(isManualInput: $isManualInput))
        }
    }
}

struct AddManuallyOnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        AddManuallyOnBoardingView()
    }
}
