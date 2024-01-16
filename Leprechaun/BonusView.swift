
import Foundation
import UIKit
import SnapKit

class BonusView: UIView {
    
    private(set) lazy var backView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.bg
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private lazy var startBonusLabel: UILabel = {
        let label = UILabel()
        label.text = "START \nBONUS"
        label.font = UIFont.customFont(font: .mont, style: .black, size: 72)
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var startImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .clevers
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private(set) lazy var pointLabel: UILabel = {
        let label = UILabel()
        label.text = "+100"
        label.font = UIFont.customFont(font: .mont, style: .black, size: 64)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private(set) lazy var thankButton: UIButton = {
        let button = UIButton()
        button.setImage(.thanks, for: .normal)
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
        addSubview(backView)
        addSubview(startBonusLabel)
        addSubview(startImageView)
        addSubview(pointLabel)
        addSubview(thankButton)
        
    }
    private func setUpConstraints(){
        
        backView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

        startBonusLabel.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide).offset(64)
            make.left.right.equalToSuperview().inset(24)
        }
        
        thankButton.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(60)
            make.bottom.equalTo(safeAreaLayoutGuide).offset(-36)
        }
        
        pointLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(thankButton.snp.top).offset(-44)
            make.centerX.equalToSuperview()
            make.height.equalTo(52)
        }

        startImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(startBonusLabel.snp.bottom).offset(64)
            make.bottom.equalTo(pointLabel.snp.top)
        }
    }
    
    private func adjustFontSizesForScreenSize() {
        let screenSize = UIScreen.main.bounds
        let smallerScreenHeight: CGFloat = 812

        if screenSize.height < smallerScreenHeight {
            startBonusLabel.font = UIFont.customFont(font: .mont, style: .black, size: 48)
            pointLabel.font = UIFont.customFont(font: .mont, style: .black, size: 40)
        }
    }
}
