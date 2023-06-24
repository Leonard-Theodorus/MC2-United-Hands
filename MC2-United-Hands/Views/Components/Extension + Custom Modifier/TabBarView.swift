//
//  TapBarView.swift
//  MC2-United-Hands
//
//  Created by Priskilla Adriani on 23/06/23.
//

import SwiftUI

struct TabBarView: View {
    var width: CGFloat
    var height: CGFloat
    
    @State private var isActionSheetShown: Bool = false
    @State private var isAddMomentViewSelected: Bool = false
    @State private var isAddManuallyViewSelected: Bool = false
    @State private var isAddQuickAccessViewSelected: Bool = false
    @Binding var isExpenseActive: Bool
    
    var body: some View {
        VStack {
            Divider()
                .frame(minHeight: 2)
                .background(.quaternary)
            
            HStack {
                VStack {
                    Image(systemName: "list.bullet.rectangle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: width * 0.08, height: width * 0.08)
                    
                    Text("Expenses")
                        .fontWeight(.semibold)
                }
                .foregroundColor(isExpenseActive ? Color.blue: Color.gray)
                .padding(.leading, width * 0.08)
                .onTapGesture {
                    if !isExpenseActive {
                        isExpenseActive.toggle()
                    }
                }
                
                Spacer()
                
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
                
                Spacer()
                
                VStack {
                    Image(systemName: "doc.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: width * 0.08, height: width * 0.08)
                    
                    Text("Report")
                        .fontWeight(.semibold)
                }
                .foregroundColor(!isExpenseActive ? Color.blue : Color.gray)
                .padding(.trailing, width * 0.08)
                .onTapGesture {
                    if isExpenseActive{
                        isExpenseActive.toggle()
                    }
                }

            }
            .frame(width: width, height: height * 0.1)
        }
        .ignoresSafeArea()
    }
}
