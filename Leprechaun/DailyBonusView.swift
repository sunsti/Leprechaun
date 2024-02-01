//
//  DailyBonusView.swift

import Foundation
import UIKit
import SnapKit

class DailyBonusView: UIView {
    
    private(set)  var dailyView: UIView = {
        let view = UIView()
        view.isHidden = false
        return view
    }()

    private(set) lazy var backView: UIImageView = {
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
    
    private lazy var bonusLabel: UILabel = {
        let label = UILabel()
        label.text = "DAILY BONUS"
        label.font = UIFont.customFont(font: .mont, style: .black, size: 48)
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var bonusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .clevers
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private(set) lazy var getBonusButton: UIButton = {
        let button = UIButton()
        button.setImage(.getBonus, for: .normal)
        return button
    }()
    
    private(set) lazy var valuePicker: UIPickerView = {
        let picker = UIPickerView()
        picker.isUserInteractionEnabled = false
        return picker
    }()
    
    private(set) lazy var blurView: GradientBonusView = {
        let view = GradientBonusView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 25
        return view
    }()
    
    private(set)  var timerView: UIView = {
        let view = UIView()
        view.isHidden = true
        return view
    }()
    
    private(set) lazy var backTimerBtn: UIButton = {
        let button = UIButton()
        button.setImage(.backBtn, for: .normal)
        return button
    }()

    private(set)  var backgroundTimeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .bg
        return imageView
    }()
    
    private(set)  var titleTimeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.customFont(font: .mont, style: .light, size: 16)
        label.text = "Time to next bonus:"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var timerCountLabel: UILabel = {
        let label = UILabel()
        label.text = "12:20:21"
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.customFont(font: .mont, style: .black, size: 48)
        return label
    }()
    
    private(set)  var timerImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .groupClevers
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private(set) lazy var okBonusButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(.okBtn, for: .normal)
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
        [dailyView,timerView] .forEach(addSubview(_:))
        
        dailyView.addSubview(backView)
        dailyView.addSubview(backBtn)
        dailyView.addSubview(getBonusButton)
        dailyView.addSubview(bonusLabel)
        dailyView.addSubview(bonusImageView)
        dailyView.addSubview(valuePicker)
        dailyView.addSubview(blurView)

        timerView.addSubview(backgroundTimeImage)
        timerView.addSubview(backTimerBtn)
        timerView.addSubview(titleTimeLabel)
        timerView.addSubview(timerCountLabel)
        timerView.addSubview(timerImage)
        timerView.addSubview(okBonusButton)

//        let blurEffect = UIBlurEffect(style: .extraLight)
        
//        blurView.effect = blurEffect
    }
    private func setUpConstraints(){
        
        dailyView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

        backView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        backBtn.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(24)
            make.top.equalToSuperview().inset(56)
        }
        
        bonusLabel.snp.makeConstraints { (make) in
            make.top.equalTo(backBtn.snp.bottom).offset(24)
            make.left.right.equalToSuperview().inset(24)
        }
        
        bonusImageView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(100)
            make.top.equalTo(bonusLabel.snp.bottom).offset(12)
            make.bottom.equalTo(blurView.snp.top).offset(-52)
        }

        valuePicker.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(20)

        }
        
        blurView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(20)
            make.width.equalTo(296)
            make.height.equalTo(180)
        }
        
        getBonusButton.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(60)
            make.bottom.equalTo(safeAreaLayoutGuide).offset(-36)
        }
        
        timerView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        backgroundTimeImage.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        backTimerBtn.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(24)
            make.top.equalToSuperview().offset(56)
            
        }

        titleTimeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(backTimerBtn.snp.bottom).offset(40)
            make.left.right.equalToSuperview().inset(24)
        }
        
        timerCountLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleTimeLabel.snp.bottom)
            make.left.right.equalToSuperview().inset(24)
        }
        
        okBonusButton.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().inset(24)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-36)
            make.height.equalTo(60)
        }
        
        timerImage.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.right.equalToSuperview().inset(55)
        }
        
     
    }
    
        private func adjustFontSizesForScreenSize() {
            let screenSize = UIScreen.main.bounds
            let smallerScreenHeight: CGFloat = 812
    
            if screenSize.height < smallerScreenHeight {
                bonusLabel.font = UIFont.customFont(font: .mont, style: .black, size: 24)
                timerImage.snp.makeConstraints { (make) in
                    make.centerY.equalToSuperview()
                    make.left.right.equalToSuperview().inset(55)
                    make.size.equalTo(198)
                }

            }
        }
}

