//
//  ContentView.swift
//  MC2-United-Hands
//
//  Created by Leonard Theodorus on 22/06/23.
//

import SwiftUI
struct ContentView: View {
    @State var pageNavigator : PageNavigation = .expenses
    var body: some View {
        NavigationStack{
            GeometryReader { geo in
                VStack {
                    HomeView(width: geo.size.width, height: geo.size.height, pageNavigator: $pageNavigator)
                }
            }
        }
//        ExpensesHorizontalScrollView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(SheetManager())
    }
}
