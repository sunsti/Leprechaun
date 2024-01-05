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
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let gradientBorder = getGradientLayerLightGreen(bounds: contentView.bonusCardQRConteinerView.bounds)
        let gradientView = getGradientLayerDarkGreen(bounds: contentView.bonusCardQRConteinerView.bounds)

        contentView.bonusCardQRConteinerView.backgroundColor = gradientColor(bounds: contentView.bonusCardQRConteinerView.bounds, gradientLayer: gradientView)
        contentView.bonusCardQRConteinerView.layer.borderColor = gradientColor(bounds: contentView.bonusCardQRConteinerView.bounds, gradientLayer: gradientBorder)?.cgColor
        contentView.cardImage.layer.borderColor = gradientColor(bounds: contentView.bonusCardQRConteinerView.bounds, gradientLayer: gradientBorder)?.cgColor


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

