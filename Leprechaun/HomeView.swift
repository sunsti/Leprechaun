//
//  HomeView.swift

import Foundation
import UIKit
import SnapKit

class HomeView: UIView {
    
    private(set) lazy var backView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.bg
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private(set) lazy var logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .logoClevers
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var appLabel: UILabel = {
        let label = UILabel()
        label.text = "\(Settings.appTitle)"
        label.font = UIFont.customFont(font: .mont, style: .black, size: 36)
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()

    private(set) lazy var btnView: UIView = {
        let view = UIView()
        return view
    }()

    
    private(set) lazy var qrBtn: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(.qrBtn, for: .normal)
        return button
    }()

    private(set) lazy var bonusBtn: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(.bonusBtn, for: .normal)
        return button
    }()
    
    private(set) lazy var giftsBtn: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(.giftBtn, for: .normal)
        return button
    }()

    private(set) lazy var newsBtn: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(.newsBtn, for: .normal)
        return button
    }()

    private(set) lazy var infoBtn: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(.infoBtn, for: .normal)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setUpConstraints()
        adjustFontSizesForScreenSize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        [backView,logoImage,appLabel,btnView,infoBtn] .forEach(addSubview(_:))
        btnView.addSubview(qrBtn)
        btnView.addSubview(bonusBtn)
        btnView.addSubview(giftsBtn)
        btnView.addSubview(newsBtn)

    }
    private func setUpConstraints(){
        
        backView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

        logoImage.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(24)
            make.left.equalToSuperview().offset(54)
        }
        
        
        appLabel.snp.makeConstraints { make in
            make.centerY.equalTo(logoImage)
            make.left.equalTo(logoImage.snp.right).offset(20)
        }
        
        btnView.snp.makeConstraints { make in
            make.top.equalTo(logoImage.snp.bottom).offset(12)
            make.bottom.equalTo(infoBtn.snp.top).offset(-12)
            make.left.right.equalToSuperview()
        }

        qrBtn.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalTo(btnView.snp.centerY).offset(-4)
            make.centerX.equalToSuperview().offset(-88)
        }
        
        bonusBtn.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalTo(btnView.snp.centerY).offset(-4)
            make.centerX.equalToSuperview().offset(88)
        }
        
        giftsBtn.snp.makeConstraints { make in
            make.top.equalTo(btnView.snp.centerY).offset(4)
            make.centerX.equalToSuperview().offset(-88)
            make.bottom.equalToSuperview()
        }

        newsBtn.snp.makeConstraints { make in
            make.top.equalTo(btnView.snp.centerY).offset(4)
            make.centerX.equalToSuperview().offset(88)
            make.bottom.equalToSuperview()
        }
        
        infoBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(75)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-46)
        }

    }
    private func adjustFontSizesForScreenSize() {
        let screenSize = UIScreen.main.bounds
        let smallerScreenHeight: CGFloat = 812

        if screenSize.height < smallerScreenHeight {
            appLabel.font = UIFont.customFont(font: .mont, style: .black, size: 24)
        }
    }

}
