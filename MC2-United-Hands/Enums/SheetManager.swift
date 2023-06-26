//
//  SheetManager.swift
//  MC2-United-Hands
//
//  Created by Priskilla Adriani on 26/06/23.
//

import Foundation

final class SheetManager: ObservableObject {
    enum Action {
        case no
        case present
        case dismiss
    }
    
    @Published private(set) var action: Action = .no
    
    func present() {
        guard !action.isPresented else { return }
        self.action = .present
    }
    
    func dismiss() {
        self.action = .dismiss
    }
}

extension SheetManager.Action {
    var isPresented: Bool { self == .present }
}
