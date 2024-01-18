//
//  GiftDetailVC.swift


import Foundation
import UIKit

class GiftDetailVC: UIViewController {
    
    var model: GiftsModel
    var uuid: String
    
    private var contentView: GiftDetailView {
        view as? GiftDetailView ?? GiftDetailView()
    }
    
    init(model: GiftsModel, uuid: String) {
        self.model = model
        self.uuid = uuid
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func loadView() {
        view = GiftDetailView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.giftDetailImage.image = UIImage(named: model.image)
        contentView.subTitleGiftLabel.text = model.title
        contentView.creditsScoreLabel.text = String(model.price)
        contentView.ingredientsScoreLabel.text = model.description
        
        setupBackButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func setupBackButton() {
        contentView.payHideButton.addTarget(self, action: #selector(showQRCode), for: .touchUpInside)
        contentView.backBtn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        
        navigationController?.popViewController(animated: true)
    }
    
    @objc func showQRCode() {
        let qrVc = QrVC()
        qrVc.id = model.id
        qrVc.modalPresentationStyle = .fullScreen
        present(qrVc, animated: true)
    }
    
    func generateQRCode(from string: String, size: CGSize) -> UIImage? {
        if let data = string.data(using: .utf8), let qrFilter = CIFilter(name: "CIQRCodeGenerator") {
            qrFilter.setValue(data, forKey: "inputMessage")
            
            if let qrImage = qrFilter.outputImage {
                let extent = qrImage.extent
                let scaleX = size.width / extent.size.width
                let scaleY = size.height / extent.size.height
                let transformedImage = qrImage.transformed(by: CGAffineTransform(scaleX: scaleX, y: scaleY))
                
                if let cgImage = CIContext().createCGImage(transformedImage, from: transformedImage.extent) {
                    return UIImage(cgImage: cgImage)
                }
            }
        }
        
        return nil
    }
}
