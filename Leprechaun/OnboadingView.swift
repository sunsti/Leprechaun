//
//  OnboadingView.swift
//  Leprechaun

import Foundation
import UIKit
import SnapKit

class OnboadingView: UIView {
        

    private lazy var backView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.bg
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var startImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .clevers
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var loadLabel: UILabel = {
        let label = UILabel()
        label.text = "Loading...".uppercased()
        label.font = UIFont.customFont(font: .mont, style: .black, size: 24)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
 
    private(set) lazy var loadView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.progressViewStyle = .default
        progressView.progress = 0.0
        progressView.progressTintColor = .gradGreenThree
        return progressView
     }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        [backView,startImageView,loadLabel,loadView] .forEach(addSubview(_:))
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

        loadView.snp.makeConstraints { (make) in
            make.top.equalTo(loadLabel.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
            make.width.equalTo(126)
        }
    }
}
