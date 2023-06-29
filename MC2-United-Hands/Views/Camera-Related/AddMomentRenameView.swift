//
//  AddMomentRenameView.swift
//  MC2-United-Hands
//
//  Created by Priskilla Adriani on 23/06/23.
//

import SwiftUI

struct AddMomentRenameView: View {
    
    @Binding var isEditMomentsViewPresented: Bool
    
    var capturedImage: UIImage
    var width: CGFloat
    var height: CGFloat
    @Binding var isManualInput : Bool
    var body: some View {
        ZStack {
            Image(uiImage: capturedImage)
                .resizable()
                .scaledToFill()
                .frame(width: width, height: height)
            
            VStack {
                HStack { }
                .padding(.bottom)
                .frame(width: width, height: height * 0.1)
                .background(.black)
                
                Spacer()
                
                HStack {
                    VStack {
                        CapsuleConfirmationButton(buttonDescription: "Done", width: width, dest: FormView(isManualInput: $isManualInput, capturedImage: capturedImage))
                            .simultaneousGesture(TapGesture().onEnded{
                                isEditMomentsViewPresented.toggle()
                            })
                        
                        Button {
                            //MARK: Retake Photo
                            isEditMomentsViewPresented.toggle()
                        } label: {
                            Text("Retake Photo")
                                .padding(10)
                                .frame(width: width * 0.9)
                                .foregroundColor(.white)
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 50)
                                .stroke(.blue, lineWidth: 3)
                        )
                    }
                }
                .frame(width: width, height: height * 0.2)
                .background(.black)
            }
        }
        .navigationBarBackButtonHidden()
    }
}
