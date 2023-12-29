//  Leprechaun


import Foundation
import UIKit

class BonusVC: UIViewController {
    
    var uD: UD = .shared
    
    var balanse: Int {
        get {
            return uD.balance
        }
        set {
            uD.balance = newValue
        }
    }
    
    private var contentView: BonusView {
        view as? BonusView ?? BonusView()
    }
    
    override func loadView() {
        view = BonusView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.thankButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
    }
    
    @objc func buttonTapped() {
        balanse += 100
        Settings.points = balanse
        dismiss(animated: true)

    }
    
}
