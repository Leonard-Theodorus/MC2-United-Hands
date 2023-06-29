//
//  AddMomentOnBoardingView.swift
//  MC2-United-Hands
//
//  Created by Leonard Theodorus on 30/06/23.
//

import SwiftUI

struct AddMomentOnBoardingView: View {
    var body: some View {
        VStack{
            Spacer()
            Image("onboardingmoment")
            VStack{
                Text("Add Expense Moment")
                    .font(.title2)
                    .bold()
                VStack(alignment: .leading){
                    Text("Forget about the long & complicated expense form, record it with photos instead!")
                        .fontWeight(.regular)
                        .padding(.vertical)
                }
                .padding(.horizontal, 20)
                VStack(alignment: .leading){
                    Text("1. Take or upload photos of your bills, food, or anything that costs you money.").foregroundColor(Color.grayText)
                    Text("2. Fill the nominal, category, and you're all done in recording your expense! (Psst, you can always edit it later too!)")
                        .foregroundColor(Color.grayText)
                    
                }
                .padding(.horizontal, 20)
            }
            Spacer()
            CapsuleConfirmationButton(buttonDescription: "Open Camera", width: UIScreen.main.bounds.width, dest: AddMomentView(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, shouldShowCamera: true, expenseAmount: "", categorySelected: CategoryModel(), expenseDate: Date()))
            
            
        }
    }
}

struct AddMomentOnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        AddMomentOnBoardingView()
    }
}
