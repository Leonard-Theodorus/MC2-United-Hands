//
//  ExpenseCard.swift
//  MC2-United-Hands
//
//  Created by Leonard Theodorus on 22/06/23.
//

import SwiftUI

struct ExpenseCard: View {
    var expenseData : ExpenseData
    
    var body: some View {
        HStack{
            RoundedImage(expenseImage: expenseData.image ?? UIImage(), width: 80, height: 80)
            VStack(alignment: .leading){
                if let amount = expenseData.amount as? NSNumber{
                    if let nominal = Formatter.currencyFormatter.string(from: amount){
                        Text(nominal == "0" ? "No Input" : "Rp. " + nominal)
                            .bold()
                            
                            .accessibilityLabel(Text("Expense Nominal"))
                    }
                }
                if let timeStamp = expenseData.timestamp{
                    Text(Formatter.timeFormatter.string(from: timeStamp))
                        .font(.caption)
                        .padding(.trailing)
                        .accessibilityLabel(Text("Time added"))
                }
                CategoryLabel(stringLabel: expenseData.category ?? "")
                    
                    .accessibilityLabel(Text("Expense Category"))
                    .accessibilityValue(Text(expenseData.category ?? ""))
            }
            .padding(.leading, 10)
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Color.expenseCardBorder)
        )
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(Color.expenseCardGrey.opacity(0.4))
                
        )
    }
}

struct ExpenseCard_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseCard(expenseData: ExpenseData(id: UUID(), image: UIImage(systemName: "trash"), category: "", amount: 0, timestamp: Date.now))
    }
}
