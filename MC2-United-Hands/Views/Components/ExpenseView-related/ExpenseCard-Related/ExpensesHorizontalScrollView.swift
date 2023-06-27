//
//  ExpensesHorizontalScrollView.swift
//  MC2-United-Hands
//
//  Created by Leonard Theodorus on 25/06/23.
//

import SwiftUI

struct ExpensesHorizontalScrollView: View {
    @State var expenses : [ExpenseData] = []
    var body: some View {
        HStack{
            ForEach(expenses, id: \.id) { expense in
                ExpenseCard(expenseData: expense)
            }
        }
    }
}

struct ExpensesHorizontalScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ExpensesHorizontalScrollView()
    }
}
