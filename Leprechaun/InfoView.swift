//
//  InfoView.swift
//  Leprechaun


import Foundation
import UIKit

class InfoView: UIView {
    
    private lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .bg
        return imageView
    }()
    
    private(set) lazy var backBtn: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(.backBtn, for: .normal)
        return button
    }()
    
    private(set) lazy var profileBtn: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(.profileBtn, for: .normal)
        return button
    }()

    private(set) lazy var imageConteinerView: GradientView = {
        let view = GradientView()
        view.layer.cornerRadius = 8
        return view
    }()
    
    private (set) var iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "AppIcon")
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private(set) var subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "\(Settings.appTitle)"
        label.textColor = .white
        label.font = UIFont.customFont(font: .mont, style: .black, size: 48)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    private lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.text = "Once upon a time, in the distant Irish hills, among the mists and green meadows, lived a mysterious leprechaun named Limerick. This kind and cheerful little creature was impossible not to notice, because his hat was even higher than he himself. Always cheerful and playful, Limrik was a protector of secrets and magic.\nOne day, while looking at his green clover garden, Limrick decided to give the store a surprise that would open up a wonderful world of fun and exclusive offers to people. He created the Leprasurprise store, where every visitor could experience the real magic of surprises and receive unique gifts.\nTo add some extra flair, Limrick has introduced a system of discounts via QR codes. Each store visitor received a unique QR code on their receipt when making a purchase. He was the key to the world of secret offers and extra discounts that Limerick created with his magic. By simply scanning the code, store customers could enjoy additional surprises and benefits.\nLeprechaun Limerick also decided to bring an element of play and fun into the store. He regularly left mysterious gifts for customers, hidden in the most unexpected places of the store. Thus, every visit to Leprasurprise became a real adventure, and customers could enjoy both their purchases and unexpected gifts found thanks to the crafty Limerick.\nAnd so, “Leprasurprise” became not only a store with amazing products and great discounts, but also a place where every visitor could feel a breath of magic, touching the secrets of the leprechaun world.\nIn our application you can collect bonuses and exchange them for a great surprise that will be waiting for you in our store."
        label.textColor = .white
        label.font = UIFont.customFont(font: .mont, style: .light, size: 12)
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var infoConteinerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.65).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .init(width: 0, height: 8)
        view.layer.shadowRadius = 14
        return view
    }()
    
    private(set) lazy var infoScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = .clear
        scrollView.isScrollEnabled = true
        scrollView.isDirectionalLockEnabled = true
        scrollView.contentInset = UIEdgeInsets(top: 56, left: 0, bottom: -56, right: 0)
        return scrollView
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
        addSubview(infoScrollView)
        addSubview(backBtn)
        addSubview(profileBtn)
        infoScrollView.addSubview(infoConteinerView)
        infoConteinerView.addSubview(imageConteinerView)
        infoConteinerView.addSubview(subTitleLabel)
        infoConteinerView.addSubview(contentLabel)
        imageConteinerView.addSubview(iconImage)

    }
    
    private func setupConstraints() {
     
        backgroundImage.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        backBtn.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(24)
            make.top.equalToSuperview().offset(56)
        }
        
        profileBtn.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-24)
            make.top.equalToSuperview().offset(60)
            make.size.equalTo(36)
        }

        
        infoScrollView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(24)
            make.bottom.top.equalToSuperview()
        }
        
        infoConteinerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        imageConteinerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.size.equalTo(180)
        }
        iconImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImage.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(subTitleLabel.snp.bottom).offset(40)
            make.left.right.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(56)
        }
    }
}
