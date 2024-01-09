
//  UIView+Gradient.swift
//  Leprechaun

import Foundation
import UIKit

class GradientView: UIView {
    
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
       
        let gradientBorder = getGradientLayerYellowGreen(bounds: bounds)
        layer.borderColor = gradientColor(bounds: bounds, gradientLayer: gradientBorder)?.cgColor
        layer.borderWidth = 1
    }
    
    private func setupGradient() {
        layer.addSublayer(gradientLayer)
        gradientLayer.cornerRadius = 8
        gradientLayer.colors = [UIColor.gradGreenOne.cgColor, UIColor.gradGreenTwo.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        
        
    }
}
