
//  UIView+Gradient.swift
//  Leprechaun

import Foundation
import UIKit

class GradientView: UIView {
    
    private let gradientLayer = CAGradientLayer()
    private let borderLayer = CAGradientLayer()

    var hasGradientBorder: Bool = false {
        didSet {
            borderLayer.isHidden = !hasGradientBorder
        }
    }

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
        borderLayer.frame = bounds
        
    }
    
    private func setupGradient() {
        layer.addSublayer(gradientLayer)
        layer.addSublayer(borderLayer)
        gradientLayer.cornerRadius = 8
        gradientLayer.colors = [UIColor.gradGreenOne.cgColor, UIColor.gradGreenTwo.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        

        borderLayer.cornerRadius = 8
        borderLayer.borderColor = UIColor.gradGreenThree.cgColor
        borderLayer.borderWidth = 1.0
        borderLayer.isHidden = !hasGradientBorder
    }
}
