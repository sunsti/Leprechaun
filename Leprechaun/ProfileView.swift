//
//  ProfileView.swift
//  Leprechaun

import Foundation
import UIKit
import SnapKit

class ProfileView: UIView,UITextFieldDelegate {
    
    private lazy var backView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.bg
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private(set) lazy var backBtn: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(.backBtn, for: .normal)
        return button
    }()

    private(set) lazy var profileBtn: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 80
        button.clipsToBounds = true
        button.setBackgroundImage(UIImage.cameraProfile, for: .normal)
        return button
    }()
    
    private(set) lazy var profileTextField: UITextField = {
        let textField = UITextField()
        let placeholderText = NSAttributedString(string: "userName", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.5)])
        textField.attributedPlaceholder = placeholderText
        textField.textColor = UIColor.white
        textField.placeholder = "userName"
        textField.layer.borderWidth = 3
        textField.layer.borderColor = UIColor.white.withAlphaComponent(0.5).cgColor
        textField.layer.cornerRadius = 30
        textField.textAlignment = .center
        textField.delegate = self
        textField.returnKeyType = .done
        textField.resignFirstResponder()
        return textField
    }()
    
    private lazy var saveButton: UIButton = {
       let button = UIButton()
        return button
    }()
    
    private(set) lazy var payHideButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.gradGreenOne
        button.titleLabel?.font = UIFont.customFont(font: .mont, style: .black, size: 24)
        button.layer.cornerRadius = 8
        return button
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
        [backView,backBtn,profileBtn,profileTextField, payHideButton] .forEach(addSubview(_:))

    }
    private func setUpConstraints(){
        
        backView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        backBtn.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(24)
            make.top.equalToSuperview().offset(56)
        }
        
        profileBtn.snp.makeConstraints { (make) in
            make.top.equalTo(backBtn.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.size.equalTo(160)
        }
        
        profileTextField.snp.makeConstraints { (make) in
            make.top.equalTo(profileBtn.snp.bottom).offset(40)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(66)
        }
        
        payHideButton.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview().inset(20)
            make.height.equalTo(46)
            make.width.equalTo(245)
        }
    }
    
    internal func textFieldDidEndEditing(_ textField: UITextField) {
        UD.shared.userName = textField.text
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if let enteredText = textField.text, !enteredText.isEmpty {
            UD.shared.userName = enteredText
        }
        return true
    }

}
