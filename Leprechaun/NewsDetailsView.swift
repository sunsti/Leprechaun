//
//  NewsDetailsView.swift


import Foundation
import UIKit
import QuartzCore

class NewsDetailView: UIView {
    
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
    
    private(set) lazy var titleNewsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.customFont(font: .mont, style: .black, size: 48)
        label.text = "News"
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var newsDetailConteiner: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 8
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.85).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 68
        return view
    }()
    
    private(set) lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.customFont(font: .mont, style: .black, size: 16)
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var newsDetailImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    
    private(set) lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.customFont(font: .mont, style: .light, size: 12)
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var newsConteinerView: GradientView = {
        let gradientView = GradientView()
        gradientView.layer.cornerRadius = 8
        return gradientView
    }()

    private(set) lazy var newsScrollView: UIScrollView = {
        let scrollView = UIScrollView() 
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = .clear
        scrollView.isScrollEnabled = true
        scrollView.isDirectionalLockEnabled = true
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
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
        
        [backgroundImage,newsDetailConteiner,backBtn] .forEach(addSubview(_:))
        
        newsDetailConteiner.addSubview(newsScrollView)
        
        
        newsScrollView.addSubview(newsConteinerView)
        newsScrollView.addSubview(titleNewsLabel)

        
        newsConteinerView.addSubview(newsDetailImage)
        newsConteinerView.addSubview(subTitleLabel)
        newsConteinerView.addSubview(contentLabel)
    }
    
    
    private func setupConstraints() {
        
        backgroundImage.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

        backBtn.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(24)
            make.top.equalToSuperview().inset(56)
        }
        
        newsDetailConteiner.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(56)
            make.left.right.equalToSuperview().inset(46)
            make.bottom.equalToSuperview()
            
        }
        
        newsScrollView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }
        
        
        titleNewsLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(56)
            make.centerX.equalToSuperview()
        }
        
        newsConteinerView.snp.makeConstraints { make in
            make.top.equalTo(titleNewsLabel.snp.bottom).offset(20)
            make.left.right.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        newsDetailImage.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview().inset(12)
        }
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(newsDetailImage.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(subTitleLabel.snp.bottom).offset(12)
            make.left.right.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().offset(-20)
        }
        
    }
}

