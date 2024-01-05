//
//  GradientBonusView.swift

import Foundation
import UIKit

class GradientBonusView: UIView {
    
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
        gradientLayer.colors = [UIColor.white.withAlphaComponent(0.9).cgColor, UIColor.clear.cgColor, UIColor.white.withAlphaComponent(0.9).cgColor]
        gradientLayer.locations = [0, 0.51, 1]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)

    }
}
