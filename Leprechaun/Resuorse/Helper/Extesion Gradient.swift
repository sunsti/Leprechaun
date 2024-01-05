//
//  Extesion Gradient.swift
//  Leprechaun
//
//  Created by apple on 03.01.2024.
//

import Foundation
import UIKit

extension UIViewController {
    
    func getGradientLayerDarkGreen(bounds : CGRect) -> CAGradientLayer{
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
        
    func getGradientLayerLightGreen(bounds : CGRect) -> CAGradientLayer{
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
    
        func getGradientLayerFourColors(bounds: CGRect) -> CAGradientLayer {
            let gradient = CAGradientLayer()
            
            let color1 = UIColor(red: 126/255, green: 238/255, blue: 189/255, alpha: 1)
            let color2 = UIColor(red: 111/255, green: 152/255, blue: 210/255, alpha: 1)
            let color3 = UIColor(red: 247/255, green: 105/255, blue: 59/255, alpha: 1)
            let color4 = UIColor(red: 251/255, green: 209/255, blue: 109/255, alpha: 1)
            
            gradient.frame = bounds
            gradient.colors = [color1.cgColor, color2.cgColor, color3.cgColor, color4.cgColor]
            gradient.locations = [0.0, 0.33, 0.66, 1.0] // Adjust these values as needed
            
            gradient.startPoint = CGPoint(x: 0, y: 0.5)
            gradient.endPoint = CGPoint(x: 1, y: 0.5)
            
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
