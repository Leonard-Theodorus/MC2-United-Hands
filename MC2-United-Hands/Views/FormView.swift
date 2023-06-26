//
//  FormView.swift
//  MC2-United-Hands
//
//  Created by Leonard Theodorus on 22/06/23.
//

import SwiftUI
struct FormView: View {
    @State var isManualInput : Bool = true
    @State private var formTypes : [FormField.fieldType] = [.nominal, .category, .photo, .date]
    
    var body: some View {
        VStack(spacing: 24) {
            Group{
                FormField(fieldType: .nominal)
                FormField(fieldType: .category)
                FormField(fieldType: .photo)
                FormField(fieldType: .date)
            }
            Spacer()
            FormDoneButton(){}
            
        }
        .onAppear{
            if !isManualInput{
                formTypes = formTypes.filter({$0 == .nominal || $0 == .category})
            }
        }
    }
}

struct ManualInputFormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}
