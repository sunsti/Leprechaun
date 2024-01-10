//
//  Extesion Gradient.swift
//  Leprechaun
//
//  Created by apple on 03.01.2024.
//

import Foundation
import UIKit

extension UIView {
    
    func getGradientLayerTwoGreen(bounds : CGRect) -> CAGradientLayer{
            let gradient = CAGradientLayer()
        let greyTop = UIColor.gradGreenOne
        let greyBottom = UIColor.gradGreenTwo
            gradient.frame = bounds
            //order of gradient colors
            gradient.colors = [greyTop.cgColor , greyBottom.cgColor]
            // start and end points
            gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
            gradient.endPoint = CGPoint(x: 0.5, y: 1)
            return gradient
        }
        
    func getGradientLayerYellowGreen(bounds : CGRect) -> CAGradientLayer{
            let gradient = CAGradientLayer()
        let greyTop = UIColor.gradGreenFour
        let greyBottom = UIColor.gradGreenThree
            gradient.frame = bounds
            //order of gradient colors
            gradient.colors = [greyTop.cgColor , greyBottom.cgColor]
            // start and end points
            gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
            gradient.endPoint = CGPoint(x: 0.5, y: 1)
            return gradient
        }
        
        func gradientColor(bounds: CGRect, gradientLayer :CAGradientLayer) -> UIColor? {
            UIGraphicsBeginImageContext(gradientLayer.bounds.size)
            //create UIImage by rendering gradient layer.
            gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            //get gradient UIcolor from gradient UIImage
            return UIColor(patternImage: image!)
        }
}

extension UIImage {
    static func gradientImage(bounds: CGRect, colors: [UIColor]) -> UIImage {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors.map(\.cgColor)
        // This makes it left to right, default is top to bottom
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)

        let renderer = UIGraphicsImageRenderer(bounds: bounds)

        return renderer.image { ctx in
            gradientLayer.render(in: ctx.cgContext)
        }
    }
}
