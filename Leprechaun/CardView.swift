//
//  CardView.swift


import Foundation
import UIKit
class CardView: UIView {
    
    
    private lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .bg
        return imageView
    }()
    
    private(set) lazy var bonusCardQRConteinerView: GradientView = {
        let view = GradientView()
        view.layer.cornerRadius = 8
        return view
    }()
    
    private(set) lazy var qrCodeImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()


    private(set) lazy var backBtn: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(.backBtn, for: .normal)
        return button
    }()
    
    private(set) lazy var bonusCardImageConteinerView: GradientView = {
        let view = GradientView()
        view.layer.cornerRadius = 8
        return view
    }()

    private(set) lazy var cardImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "AppIcon")
        imageView.layer.cornerRadius = 8
        imageView.layer.borderWidth = 1
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var accountLabel: UILabel = {
        let label = UILabel()
        label.text = "Balance"
        label.textColor = .white
        label.font = UIFont.customFont(font: .mont, style: .light, size: 16)
        label.textAlignment = .center
        return label
    }()
    
    private(set) lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.text = "\(UD.shared.balance)"
        label.textColor = .white
        label.font = UIFont.customFont(font: .mont, style: .black, size: 48)
        label.textAlignment = .center
        return label
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupUI() {
        [backgroundImage,backBtn,accountLabel,scoreLabel,bonusCardQRConteinerView,bonusCardImageConteinerView].forEach(addSubview(_:))
        bonusCardImageConteinerView.addSubview(cardImage)
        bonusCardQRConteinerView.addSubview(qrCodeImageView)

    }
    
    private func setupConstraints() {
        
        backgroundImage.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        
        backBtn.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(24)
            make.top.equalTo(safeAreaLayoutGuide).offset(10)
        }
        
        bonusCardImageConteinerView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(backBtn.snp.bottom).offset(24)
            make.bottom.equalTo(accountLabel.snp.top).offset(-56)
        }
        
        cardImage.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.size.equalTo(180)
        }
        
        accountLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(scoreLabel.snp.top).offset(-12)
        }
        
        scoreLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        bonusCardQRConteinerView.snp.makeConstraints { (make) in
            make.top.equalTo(scoreLabel.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(56)
            make.height.equalTo(bonusCardQRConteinerView.snp.width)
            make.bottom.equalTo(safeAreaLayoutGuide).offset(-16)
        }
        qrCodeImageView.snp.makeConstraints { (make) in
            make.top.bottom.right.left.equalToSuperview().inset(10)
        }
    }
}


