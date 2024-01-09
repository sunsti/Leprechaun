//
//  OnboadingVC.swift
//  Leprechaun

import Foundation
import UIKit

class OnboadingVC: UIViewController {
    

    private var contentView: OnboadingView {
        view as? OnboadingView ?? OnboadingView()
    }
    
    override func loadView() {
        view = OnboadingView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        start()
    }
    
    private func start() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
            let vc = HomeVC()
            let navigationController = UINavigationController(rootViewController: vc)
            navigationController.modalPresentationStyle = .fullScreen
            self.present(navigationController, animated: true)
            navigationController.setNavigationBarHidden(true, animated: false)
        }
    }
}
