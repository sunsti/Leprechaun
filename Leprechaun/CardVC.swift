//
//  CardVC.swift
//  Leprechaun
import UIKit
import SnapKit

class CardVC: UIViewController {
    
    
     var contentView: CardView {
        view as? CardView ?? CardView()
    }
    
    override func loadView() {
        view = CardView()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.backBtn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @objc func buttonTapped() {
        
        navigationController?.popViewController(animated: true)
        
    }
    
}

