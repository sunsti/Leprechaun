//
//  GiftsCell.swift


import Foundation
import UIKit
import SnapKit

class GiftCell: UITableViewCell {
    
    static let reuseId = String(describing: GiftCell.self)
    
    private lazy var creditLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Credits"
        label.font = UIFont.customFont(font: .mont, style: .light, size: 12)
        return label
    }()
    
    private lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.customFont(font: .mont, style: .black, size: 70)
        return label
    }()
    
    private(set) lazy var cointImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .coint
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.customFont(font: .mont, style: .black, size: 16)
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private(set) lazy var giftImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    private(set) lazy var giftDetailUseConteiner: GradientView = {
        let view = GradientView()
        view.hasGradientBorder = true
        return view
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraints()
        adjustFontSizesForScreenSize()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 24 , bottom: 0, right: 24))
    }
    
    func setupUI(){
        
        contentView.addSubview(giftDetailUseConteiner)
        contentView.backgroundColor = .clear
        contentView.layer.cornerRadius = 8
        contentView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.65).cgColor
        contentView.layer.shadowOpacity = 1
        contentView.layer.shadowOffset = .init(width: 0, height: 8)
        contentView.layer.shadowRadius = 14
        backgroundColor = .clear
        selectionStyle = .none
        
        [giftImage,titleLabel,scoreLabel,creditLabel,cointImage].forEach(giftDetailUseConteiner.addSubview(_:))
        
    }
    
    func setupConstraints() {
        giftDetailUseConteiner.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.right.bottom.equalToSuperview()
        }
        
        giftImage.snp.makeConstraints { make in
            make.left.top.bottom.equalToSuperview().inset(20)
            make.size.equalTo(80)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(giftImage.snp.right).offset(12)
            make.centerY.equalToSuperview()
        }
        
        scoreLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview().offset(100)
        }
        
        creditLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(-36)
            make.centerX.equalToSuperview().offset(48)
        }
        
        cointImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(12)
            make.centerX.equalToSuperview().offset(32)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        scoreLabel.text = nil
        titleLabel.text = nil
        giftImage.image = nil
    }
    
    func setupCell(item: GiftsModel) {
        titleLabel.text = item.title
        giftImage.image = UIImage(named: item.imageGifts)
        scoreLabel.text = item.credits
    }
    private func adjustFontSizesForScreenSize() {
        let screenSize = UIScreen.main.bounds
        let smallerScreenHeight: CGFloat = 812
        
        if screenSize.height < smallerScreenHeight {
            scoreLabel.font = UIFont.customFont(font: .mont, style: .black, size: 48)
            creditLabel.snp.updateConstraints { make in
                make.centerX.equalToSuperview().offset(72)
                make.centerY.equalToSuperview().offset(-28)
            }
            cointImage.snp.updateConstraints { make in
                make.centerY.equalToSuperview().offset(4)
                make.centerX.equalToSuperview().offset(48)
            }
        }
    }
}
