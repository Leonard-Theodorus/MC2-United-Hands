//
//  MC2_United_HandsApp.swift
//  MC2-United-Hands
//
//  Created by Leonard Theodorus on 22/06/23.
//

import SwiftUI

@main
struct MC2_United_HandsApp: App {
    
    @StateObject var sheetManager = SheetManager()
    @StateObject var onBoardingVm = OnboardingViewModel()
    @StateObject var coreDataViewModel = CoreDataViewModel()
    @StateObject var expenseVm = ExpensesViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(sheetManager)
                .environmentObject(onBoardingVm)
                .environmentObject(coreDataViewModel)
                .environmentObject(expenseVm)
                
        }
    }
}
