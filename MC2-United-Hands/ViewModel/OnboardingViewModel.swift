//
//  OnboardingViewModel.swift
//  MC2-United-Hands
//
//  Created by Leonard Theodorus on 26/06/23.
//

import Foundation

class OnboardingViewModel : ObservableObject{
    @Published var userDefaultsInstance = UserDefaults.standard
    func addMomentsAlreadyLaunchedOnce() -> Bool {
        if let _ = self.userDefaultsInstance.string(forKey: "addMoments") {
            return true
        } else {
            self.userDefaultsInstance.set(true, forKey: "addMoments")
            return false
        }
    }
    func addManuallyAlreadyLaunchedOnce() -> Bool {
        if let _ = self.userDefaultsInstance.string(forKey: "addManually") {
            return true
        } else {
            self.userDefaultsInstance.set(true, forKey: "addManually")
            return false
        }
    }
}
