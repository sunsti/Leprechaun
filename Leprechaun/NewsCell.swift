//
//  NewsCell.swift

import Foundation
import UIKit
import SnapKit

class NewsCell: UITableViewCell {
    
    static let reuseId = String(describing: NewsCell.self)
    
    
    private(set) lazy var tittleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.customFont(font: .mont, style: .black, size: 16)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private(set) lazy var newsImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private(set) lazy var newsDetailUseConteiner: UIView = {
        let view = UIView()
        view.clipsToBounds = true
//        view.layer.cornerRadius = 8
        return view
    }()
    
    private(set) lazy var gradView: GradientView = {
        let gradientView = GradientView()
        gradientView.clipsToBounds = true
        gradientView.layer.cornerRadius = 8
        return gradientView
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        setupConstraints()
    }
    
    override func layoutSubviews() {
            super.layoutSubviews()
            contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 20, left: 24, bottom: 0, right: 24))
        }
    
        func setupUI() {
            contentView.addSubview(gradView)
            contentView.addSubview(newsDetailUseConteiner)
            contentView.backgroundColor = .clear
            contentView.layer.cornerRadius = 8
            backgroundColor = .clear
            selectionStyle = .none
            [tittleLabel,newsImage].forEach(newsDetailUseConteiner.addSubview(_:))
            
        }
        
        func setupConstraints() {
            
            gradView.snp.makeConstraints { make in
                make.edges.equalToSuperview()           
            }

            newsDetailUseConteiner.snp.makeConstraints { make in
                make.top.left.right.bottom.equalToSuperview().inset(12)
                make.bottom.equalToSuperview()
            }
            
            newsImage.snp.makeConstraints { make in
                make.left.right.top.equalToSuperview()
            }
            
            tittleLabel.snp.makeConstraints { make in
                make.top.equalTo(newsImage.snp.bottom).offset(12)
                make.left.right.bottom.equalToSuperview()
                make.height.equalTo(18)
            }
        }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        tittleLabel.text = nil
        newsImage.image = nil
    }
    
    func setupCell(item: NewsModel) {
        tittleLabel.text = item.title
        newsImage.image = UIImage(named: item.image)
    }
}
