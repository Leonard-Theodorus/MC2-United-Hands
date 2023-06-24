//
//  TabBarPlusButton.swift
//  MC2-United-Hands
//
//  Created by Leonard Theodorus on 24/06/23.
//

import SwiftUI

struct TabBarPlusButton: View {
    @State var isActionSheetShown : Bool = false
    @State var isAddMomentViewSelected : Bool = false
    @State var isAddManuallyViewSelected : Bool = false
    @State var isAddQuickAccessViewSelected : Bool = false
    @State var width : CGFloat
    @State var height: CGFloat
    
    var body: some View {
        Button {
            isActionSheetShown.toggle()
        } label: {
            Image(systemName: "plus")
                .resizable()
                .scaledToFit()
                .padding(25)
                .foregroundColor(.white)
                .background(.blue)
                .clipShape(Circle())
                .accessibilityLabel(Text("Add"))
                .frame(width: width * 0.23, height: width * 0.23)
                .offset(y: -height * 0.06)
        }
        .actionSheet(isPresented: $isActionSheetShown) { () -> ActionSheet in
            ActionSheet(title: Text("Select Input Method"),
                        buttons: [
                            ActionSheet.Button.default( Text("Add Moment"), action: {
                                isAddMomentViewSelected.toggle()
                            }),
                            ActionSheet.Button.default(Text("Add Manually"), action: {
                                isAddManuallyViewSelected.toggle()
                            }),
                            ActionSheet.Button.default(Text("Add Quick Access"), action: {
                                isAddQuickAccessViewSelected.toggle()
                            }),
                            ActionSheet.Button.cancel()
                        ])
        }
        
        .navigationDestination(isPresented: $isAddMomentViewSelected) {
            AddMomentView(width: width, height: height)
        }
        
        .navigationDestination(isPresented: $isAddManuallyViewSelected) {
            FormView()
        }
        
        .navigationDestination(isPresented: $isAddQuickAccessViewSelected) {
            //TODO: Move to QuickAcessView
        }
    }
}

struct TabBarPlusButton_Previews: PreviewProvider {
    static var previews: some View {
        TabBarPlusButton(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
}
