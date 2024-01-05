//
//  NewsDetailsVC.swift
//  Leprechaun

import Foundation
import UIKit

class NewsDetailVC: UIViewController {
    
    var newsModel: NewsModel
    
    private var contentView: NewsDetailView {
        view as? NewsDetailView ?? NewsDetailView()
    }
    
    init(newsModel: NewsModel) {
        self.newsModel = newsModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = NewsDetailView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackButton()
        contentView.subTitleLabel.text = newsModel.title
        contentView.newsDetailImage.image = UIImage(named: newsModel.imageNews)
        contentView.contentLabel.text = newsModel.body
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func setupBackButton() {
        contentView.backBtn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        
        navigationController?.popViewController(animated: true)
    }
}
