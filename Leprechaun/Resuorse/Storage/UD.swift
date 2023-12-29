//
//  UD.swift
//  Leprechaun
//
//  Created by apple on 29.12.2023.
//

import Foundation
import UIKit

enum UserDefaultKey: String {
    case balance = "balance"
    case hasBeenLaunchedBeforeFlag = "hasBeenLaunchedBeforeFlag"
}

class UD {
    
    static let shared = UD()
    private let defaults = UserDefaults.standard
    var balanceClosure: (() -> Void)?
    
    private init() {
        if UserDefaults.standard.object(forKey: UserDefaultKey.balance.rawValue) == nil {
            balance = 0
        }
    }
    
    var balance: Int {
        get {
            return UserDefaults.standard.integer(forKey: UserDefaultKey.balance.rawValue)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: UserDefaultKey.balance.rawValue)
            UserDefaults.standard.synchronize()
            balanceClosure?()
        }
    }
}
