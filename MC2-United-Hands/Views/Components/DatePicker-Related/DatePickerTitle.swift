//
//  DatePickerTitle.swift
//  MC2-United-Hands
//
//  Created by Priskilla Adriani on 26/06/23.
//

import SwiftUI

struct DatePickerTitle: View {
    @EnvironmentObject var sheetManager: SheetManager
    var width: CGFloat
    
    var body: some View {
        HStack {
            Text("Choose Month")
                .font(.title2)
                .fontWeight(.semibold)
                .padding()
            Spacer()
            
            CloseButton(width: width, foregroundColor: .secondary, backgroundColor: .datePickerCloseGray) {
                withAnimation {
                    sheetManager.dismiss()
                }
            }
        }
    }
}
struct DatePickerTitle_Previews : PreviewProvider{
    static var previews: some View{
        DatePickerTitle(width: UIScreen.main.bounds.width)
    }
}
