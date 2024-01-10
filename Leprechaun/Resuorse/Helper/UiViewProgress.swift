//
//  UIVIewProgress.swift

import Foundation
import UIKit

class UiViewProgress: UIView {
    
    private let gradientLayer = CAGradientLayer()
 

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGradient()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGradient()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
       
    }
    
    private func setupGradient() {
        layer.addSublayer(gradientLayer)
        gradientLayer.cornerRadius = 8
        gradientLayer.colors = [UIColor.gradGreenFour.cgColor, UIColor.gradGreenThree.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        
    }
}
