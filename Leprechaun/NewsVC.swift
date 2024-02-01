//
//  NewsVC.swift


import Foundation
import UIKit

class NewsVC: UIViewController {
    
    private var hUD: UIActivityIndicatorView!
    private var items = [NewsModel]()
    
    private var contentView: NewsView {
        view as? NewsView ?? NewsView()
    }

    
    override func loadView() {
        view = NewsView()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.newsTableView.dataSource = self
        contentView.newsTableView.delegate = self
        configureHUD()
        setupBackButton()
        loadingNews()
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
    
    private func configureHUD() {
        hUD = UIActivityIndicatorView(style: .medium)
        hUD.hidesWhenStopped = true
        hUD.color = .gradGreenFour
        view.addSubview(hUD)
        hUD.transform = CGAffineTransform(scaleX: 3, y: 3)
        hUD.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    func loadingNews() {
        Task {
            do {
                hUD.startAnimating()
                items = try await ManagerNetwork.shared.getNews()
                contentView.newsTableView.reloadData()
                hUD.stopAnimating()
            } catch {
                print("Error: \(error.localizedDescription)")
                hUD.stopAnimating()
            }
        }
    }
}

extension NewsVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.reuseId, for: indexPath)
        
        guard let newsCell = cell as? NewsCell else {
            return cell
        }
        
        let item = items[indexPath.row]
        
        newsCell.setupCell(item: item)
        
        return newsCell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = items[indexPath.row]
        
        let newsDetailVC = NewsDetailVC(newsModel: item)
        
        navigationController?.pushViewController(newsDetailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 60))
            headerView.backgroundColor = .clear
            
            let titleLabel = UILabel()
            titleLabel.text = "News"
            titleLabel.font = UIFont.customFont(font: .mont, style: .black, size: 48)
            titleLabel.textAlignment = .center
            titleLabel.textColor =  .white
            titleLabel.frame = headerView.bounds
            headerView.addSubview(titleLabel)
            
            return headerView
        }

        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 60.0
        }
        
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return "News"
        }
    }
    
