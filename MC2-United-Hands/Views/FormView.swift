//
//  FormView.swift
//  MC2-United-Hands
//
//  Created by Leonard Theodorus on 22/06/23.
//

import SwiftUI
struct FormView: View {
    @Binding var isManualInput : Bool
    @State private var formTypes : [FormField.fieldType] = [.nominal, .category, .photo, .date]
    var capturedImage : UIImage?
    var body: some View {
        VStack(spacing: 24) {
            Group{
                ForEach(formTypes, id: \.fieldName){field in
                    FormField(fieldType: field)
                }
            }
            Spacer()
            ConfirmationButton(buttonDescription: "Done", buttonBackgroundColor: Color.primaryBlue){}
            if !isManualInput{
                ConfirmationButton(buttonDescription: "Cancel", buttonBackgroundColor: Color.red){
                    NavigationUtil.popToRootView()
                }
                
            }
            
        }
        .onAppear{
            if !isManualInput{
                formTypes = [.nominal, .category]
            }
        }
    }
}

struct ManualInputFormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView(isManualInput: .constant(true), capturedImage: UIImage())
    }
}
