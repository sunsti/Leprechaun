//
//  QrVC.swift
//  Leprechaun

import Foundation
import UIKit

class QrVC: UIViewController {

    var id = ""
    
     var contentView: QrView {
        view as? QrView ?? QrView()
    }
    
    override func loadView() {
        view = QrView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        if let qrCodeImage = generateQRCode(from: id, size: CGSize(width: 250, height: 200)) {
            contentView.qrCodeImageView.image = qrCodeImage
        }
        
        contentView.backBtn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        contentView.hideButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
    }
    
    @objc func buttonTapped() {
        
        dismiss(animated: true)
        
    }
    
  private func generateQRCode(from string: String, size: CGSize) -> UIImage? {
        if let data = string.data(using: .utf8), let qrFilter = CIFilter(name: "CIQRCodeGenerator") {
            qrFilter.setValue(data, forKey: "inputMessage")

            if let qrImage = qrFilter.outputImage {
                let extent = qrImage.extent
                let scaleX = size.width / extent.size.width
                let scaleY = size.height / extent.size.height
                let transformedImage = qrImage.transformed(by: CGAffineTransform(scaleX: scaleX, y: scaleY))

                let filter = CIFilter(name: "CIFalseColor")
                filter?.setValue(transformedImage, forKey: kCIInputImageKey)
                filter?.setValue(CIColor.white, forKey: "inputColor0") // Цвет фона
                filter?.setValue(CIColor.clear, forKey: "inputColor1") //  Цвет QR-кода

                if let outputImage = filter?.outputImage,
                   let cgImage = CIContext().createCGImage(outputImage, from: outputImage.extent) {
                    return UIImage(cgImage: cgImage)
                }
            }
        }

        return nil
    }

    
}
