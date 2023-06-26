//
//  OnboardingViewModel.swift
//  MC2-United-Hands
//
//  Created by Leonard Theodorus on 26/06/23.
//

import Foundation

class OnboardingViewModel : ObservableObject{
    @Published var userDefaultsInstace = UserDefaults.standard
    @Published var firstTime : Bool = false
    func isAppAlreadyLaunchedOnce() -> Bool {
        if let _ = self.userDefaultsInstace.string(forKey: "isAppAlreadyLaunchedOnce") {
            return true
        } else {
            self.userDefaultsInstace.set(true, forKey: "isAppAlreadyLaunchedOnce")
            return false
        }
    }
}
