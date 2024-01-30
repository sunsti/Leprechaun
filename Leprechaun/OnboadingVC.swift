//
//  OnboadingVC.swift
//  Leprechaun

import Foundation
import UIKit

class OnboadingVC: UIViewController {
    
    private var timer: Timer?

    private var contentView: OnboadingView {
        view as? OnboadingView ?? OnboadingView()
    }
    
    override func loadView() {
        view = OnboadingView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        start()
        animateProgressBar()
    }
    
    
    private func start() {
        Task {
            do {
                try await ManagerNetwork.shared.authenticate()
                presentHomeScreen()
            } catch {
                print("Error: \(error.localizedDescription)")
                presentHomeScreen()
            }
        }
    }
    
    func presentHomeScreen() {
        let vc = HomeVC()
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
        navigationController.setNavigationBarHidden(true, animated: false)
    }
    
    func animateProgressBar() {
        UIView.animate(withDuration: 1.5) {
            // Установите конечное значение прогресса
            self.contentView.loadView.setProgress(1.0, animated: true)
        }
    }
    
    
}
