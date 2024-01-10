//
//  InfoVC.swift
//  Leprechaun

import Foundation
import UIKit

class InfoVC: UIViewController {
    
    private var contentView: InfoView {
        view as? InfoView ?? InfoView()
    }
    
    override func loadView() {
        view = InfoView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.backBtn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        contentView.profileBtn.addTarget(self, action: #selector(buttonTappedProfile), for: .touchUpInside)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @objc func buttonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func buttonTappedProfile() {
        let profileVc = ProfileVC()
        navigationController?.pushViewController(profileVc, animated: true)
    }

}
