//
//  Font + Extension.swift
//  Leprechaun

import UIKit

extension UIFont {
    
    enum CustomFonts: String {
        case mont = "mont"
    }
    
    enum CustomFontStyle: String {
        case black = "-black"
        case light = "-light"
    }
    
    static func customFont(
        font: CustomFonts,
        style: CustomFontStyle,
        size: Int,
        isScaled: Bool = true) -> UIFont {
            
            let fontName: String = font.rawValue + style.rawValue
            
            guard let font = UIFont(name: fontName, size: CGFloat(size)) else {
                debugPrint("Font can't be loaded")
                return UIFont.systemFont(ofSize: CGFloat(size))
            }
            
            return isScaled ? UIFontMetrics.default.scaledFont(for: font) : font
        }
}
