//
//  OnboadingView.swift
//  Leprechaun

import Foundation
import UIKit
import SnapKit

class OnboadingView: UIView {
    
    private(set) lazy var backView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.bg
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private(set) lazy var startImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .clevers
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private(set) lazy var loadLabel: UILabel = {
        let label = UILabel()
        label.text = "Loading".uppercased()
        label.font = UIFont.customFont(font: .mont, style: .black, size: 24)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
 
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setUpConstraints()
//        adjustFontSizesForScreenSize()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(backView)
        addSubview(startImageView)
        addSubview(loadLabel)
        
    }
    private func setUpConstraints(){
        
        backView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        startImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }

        loadLabel.snp.makeConstraints { (make) in
            make.top.equalTo(startImageView.snp.bottom).offset(52)
            make.centerX.equalToSuperview()
        }

    }
    
//    private func adjustFontSizesForScreenSize() {
//        let screenSize = UIScreen.main.bounds
//        let smallerScreenHeight: CGFloat = 812
//
//        if screenSize.height < smallerScreenHeight {
//            startBonusLabel.font = UIFont.customFont(font: .mont, style: .black, size: 48)
//            pointLabel.font = UIFont.customFont(font: .mont, style: .black, size: 40)
//        }
//    }
}
