//
//  HomeVC.swift
//  Leprechaun
import Foundation
import UIKit

class HomeVC: UIViewController {
    
    
    private var contentView: HomeView {
        view as? HomeView ?? HomeView()
    }
    
    override func loadView() {
        view = HomeView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tappedButtons()
        firstLaunch()
    }
    
    private func firstLaunch() {
        let isFirstLaunch = UD.isFirstLaunch()
        if isFirstLaunch {
            let vc = BonusVC()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }
    }
    
    private func tappedButtons() {
        contentView.qrBtn.addTarget(self, action: #selector(buttonTappedQrCard), for: .touchUpInside)
        contentView.infoBtn.addTarget(self, action: #selector(buttonTappedInfo), for: .touchUpInside)
        contentView.newsBtn.addTarget(self, action: #selector(buttonTappedNews), for: .touchUpInside)
        contentView.giftsBtn.addTarget(self, action: #selector(buttonTappedGifts), for: .touchUpInside)
        contentView.bonusBtn.addTarget(self, action: #selector(buttonTappedBonus), for: .touchUpInside)
        
    }
    
    
    @objc func buttonTappedQrCard() {
        let cardVc = CardVC()
        navigationController?.pushViewController(cardVc, animated: true)
        let qrCodeString = UUID().uuidString
        if let qrCodeImage = generateQRCode(from: qrCodeString, size: CGSize(width: 240, height: 240)) {
            cardVc.contentView.qrCodeImageView.image = qrCodeImage
        }
    }
    
    @objc func buttonTappedInfo() {
        let infoVc = InfoVC()
        navigationController?.pushViewController(infoVc, animated: true)
    }
    
    @objc func buttonTappedNews() {
        let newsVc = NewsVC()
        navigationController?.pushViewController(newsVc, animated: true)
    }

    @objc func buttonTappedGifts() {
        let giftsVc = GiftVC()
        navigationController?.pushViewController(giftsVc, animated: true)
    }
    
    @objc func buttonTappedBonus() {
        let bonusVc = DailyBonusVC()
        navigationController?.pushViewController(bonusVc, animated: true)
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
                filter?.setValue(CIColor(red: 1, green: 1, blue: 1), forKey: "inputColor0") // Цвет фона
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



