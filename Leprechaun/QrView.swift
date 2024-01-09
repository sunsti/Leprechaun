//
//  QrView.swift

import Foundation
import UIKit

class QrView: UIView {

    private lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .bg
        return imageView
    }()

    private(set) lazy var backBtn: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "backBtn"), for: .normal)
        return button
    }()
    
    private lazy var titleGiftLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.customFont(font: .mont, style: .black, size: 48)
        label.text = "Gift"
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    private(set) lazy var qrConteiner: GradientView = {
        let view = GradientView()
        view.layer.cornerRadius = 8
        return view
    }()
    
    private(set) lazy var qrCodeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private(set) lazy var hideButton: UIButton = {
        let button = UIButton()
        button.setTitle("HIDE", for: .normal)
        button.setTitleColor(UIColor.gradGreenOne, for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont.customFont(font: .mont, style: .black, size: 24)
        button.layer.cornerRadius = 8
        return button
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
        addSubview(backgroundImage)
        addSubview(qrConteiner)
        addSubview(backBtn)
        addSubview(titleGiftLabel)
        qrConteiner.addSubview(qrCodeImageView)
        qrConteiner.addSubview(hideButton)
    }
    
    private func setupConstraints() {
    
        backgroundImage.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

        backBtn.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(24)
            make.top.equalToSuperview().inset(56)
        }
        
        titleGiftLabel.snp.makeConstraints { make in
            make.top.equalTo(backBtn.snp.bottom)
            make.centerX.equalToSuperview()
            make.height.equalTo(48)
        }
        
        qrConteiner.snp.makeConstraints { make in
            make.top.equalTo(titleGiftLabel.snp.bottom).offset(12)
            make.left.right.equalToSuperview().inset(28)
            make.bottom.equalToSuperview().offset(-56)
        }
        
        qrCodeImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.centerX.equalToSuperview()
            make.height.equalTo(qrCodeImageView.snp.width)
        }
        
        hideButton.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview().inset(20)
            make.height.equalTo(46)
        }
    }
}
