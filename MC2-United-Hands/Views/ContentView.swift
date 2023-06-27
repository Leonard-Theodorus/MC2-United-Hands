//
//  ContentView.swift
//  MC2-United-Hands
//
//  Created by Leonard Theodorus on 22/06/23.
//

import SwiftUI
struct ContentView: View {
    @State var pageNavigator : PageNavigation = .expenses
    @EnvironmentObject var onBoardingVm : OnboardingViewModel
    @EnvironmentObject var expenseVM : ExpensesViewModel
    //    var width : CGFloat = 393.0
    //    var height : CGFloat = 667.0
    var body: some View {
        NavigationStack{
            GeometryReader { geo in
                VStack {
                    HomeView(width: geo.size.width, height: geo.size.height, pageNavigator: $pageNavigator)
                }
            }
        }
        
        
        //        VStack{
        //            ExpensesHorizontalScrollView()
        //            if !onBoardingVm.firstTime{
        //                Text("FirstTIme")
        //            }
        //
        //        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(SheetManager())
            .environmentObject(OnboardingViewModel())
            .environmentObject(ExpensesViewModel())
    }
}
