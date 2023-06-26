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
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(sheetManager)
                .environmentObject(onBoardingVm)
                .onAppear{
                    onBoardingVm.firstTime = onBoardingVm.isAppAlreadyLaunchedOnce()
                }
                
        }
    }
}
