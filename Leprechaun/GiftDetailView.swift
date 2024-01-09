//
//  GiftDetailView.swift


import Foundation
import UIKit

class GiftDetailView: UIView {
    
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
        return label
    }()
    
    private lazy var giftDetailUseConteiner: GradientView = {
        let view = GradientView()
        view.layer.cornerRadius = 8
        return view
    }()
    
    private lazy var giftDetailConteiner: UIView = {
        let view = UIView()
        return view
    }()
    
    private(set) lazy var subTitleGiftLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.customFont(font: .mont, style: .black, size: 28)
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var giftDetailImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    private(set) lazy var creditsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Credits"
        label.font = UIFont.customFont(font: .mont, style: .light, size: 12)
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var ingredientsLabel: UILabel = {
        let label = UILabel()
        label.text = "Ingredients"
        label.textColor = .white
        label.font = UIFont.customFont(font: .mont, style: .light, size: 12)
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var creditsScoreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.customFont(font: .mont, style: .black, size: 70)
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var ingredientsScoreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.customFont(font: .mont, style: .light, size: 12)
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var payHideButton: UIButton = {
        let button = UIButton()
        button.setTitle("PAY", for: .normal)
        button.setTitleColor(UIColor.gradGreenOne, for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont.customFont(font: .mont, style: .black, size: 24)
        button.layer.cornerRadius = 8
        return button
    }()
    
    private(set) lazy var cointImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .coint
        return imageView
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
        
        [backgroundImage,backBtn,titleGiftLabel,giftDetailUseConteiner] .forEach(addSubview(_:))
        
        
        giftDetailUseConteiner.addSubview(giftDetailImage)
        giftDetailUseConteiner.addSubview(subTitleGiftLabel)
        giftDetailUseConteiner.addSubview(payHideButton)
        giftDetailUseConteiner.addSubview(creditsLabel)
        giftDetailUseConteiner.addSubview(creditsScoreLabel)
        giftDetailUseConteiner.addSubview(ingredientsLabel)
        giftDetailUseConteiner.addSubview(ingredientsScoreLabel)
        giftDetailUseConteiner.addSubview(cointImage)
        
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

        giftDetailUseConteiner.snp.makeConstraints { make in
            make.top.equalTo(titleGiftLabel.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(28)
            make.bottom.equalToSuperview().offset(-32)
        }

        payHideButton.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview().inset(20)
            make.height.equalTo(46)
            make.width.equalTo(245)
        }
        
        giftDetailImage.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview().inset(20)
            make.height.equalTo(giftDetailImage.snp.width).multipliedBy(0.9)
        }
        
        subTitleGiftLabel.snp.makeConstraints { make in
            make.top.equalTo(giftDetailImage.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
        }
        creditsLabel.snp.makeConstraints { make in
            make.left.equalTo(ingredientsLabel.snp.right).offset(140)
            make.top.equalTo(giftDetailImage.snp.bottom).offset(32)
        }
        
        creditsScoreLabel.snp.makeConstraints { make in
            make.left.equalTo(ingredientsLabel.snp.right).offset(140)
            make.top.equalTo(giftDetailImage.snp.bottom).offset(32)
        }
        
        cointImage.snp.makeConstraints { make in
            make.left.equalTo(ingredientsLabel.snp.right).offset(126)
            make.top.equalTo(creditsScoreLabel.snp.bottom).offset(-48)
        }


        ingredientsLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(subTitleGiftLabel.snp.bottom).offset(16)
        }
        
        ingredientsScoreLabel.snp.makeConstraints { make in
            make.top.equalTo(ingredientsLabel.snp.bottom)
            make.left.equalToSuperview().offset(20)
        }
    }
}
