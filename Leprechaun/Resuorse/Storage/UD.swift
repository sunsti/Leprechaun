//
//  UD.swift


import Foundation

enum UDKey: String {
    case balance = "balance"
    case hasBeenLaunchedBeforeFlag = "hasBeenLaunchedBeforeFlag"
}

class UD {
    
    static let shared = UD()
    private let defaults = UserDefaults.standard
    
    var isNotFirst: Bool {
        get {
            return defaults.bool(forKey: "isNotFirst")
        }
        set {
            defaults.set(newValue, forKey: "isNotFirst")
        }
    }
    
    var lastBonusDate: Date? {
        get {
            return defaults.object(forKey: "lastBonusDate") as? Date
        }
        set {
            defaults.set(newValue, forKey: "lastBonusDate")
        }
    }
    
    var balanceClosure: (() -> Void)?
    
    
    private init() {
        if UserDefaults.standard.object(forKey: UDKey.balance.rawValue) == nil {
            balance = 0
        }
    }
    
    var balance: Int {
        get {
            return UserDefaults.standard.integer(forKey: UDKey.balance.rawValue)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: UDKey.balance.rawValue)
            UserDefaults.standard.synchronize()
            balanceClosure?()
        }
    }
    
    
    var userName: String? {
        get {
            return defaults.string(forKey: "userName")
        }
        set {
            defaults.set(newValue, forKey: "userName")
        }
    }
    
}
    
extension UD {
        static func isFirstLaunch() -> Bool {
            let isFirstLaunch = !UserDefaults.standard.bool(forKey: UDKey.hasBeenLaunchedBeforeFlag.rawValue)
            if (isFirstLaunch) {
                UserDefaults.standard.set(true, forKey: UDKey.hasBeenLaunchedBeforeFlag.rawValue)
                UserDefaults.standard.synchronize()
            }
            return isFirstLaunch
        }
    }
