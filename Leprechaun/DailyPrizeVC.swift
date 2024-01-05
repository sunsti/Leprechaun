//
//  DailyPrizeVC.swift
//  Leprechaun

import UIKit
import SnapKit

class DailyPrizeVC: UIViewController {
    
    var total: Int = 0
    
    
    var contentView: DailyPrizeView {
        view as? DailyPrizeView ?? DailyPrizeView()
    }
    
    override func loadView() {
        view = DailyPrizeView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.scoreLabel.text = "\(total)"
        contentView.thanksButton.addTarget(self, action: #selector(closeView), for: .touchUpInside)
    }
    
    @objc func closeView() {
        UD.shared.lastBonusDate = Date()
        dismiss(animated: true)
    }
    
}
