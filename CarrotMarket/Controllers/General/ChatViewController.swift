//
//  ChatViewController.swift
//  CarrotMarket
//
//  Created by 민호 on 2022/06/12.
//

import UIKit

class ChatViewController: UIViewController {
    
    let reuseidentifier = "ChattingCell"
    
    // MARK: - Properties
    
    let tableView = UITableView()
    
    
    
    
    
    // MARK: - Lifecycle

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = baseColor
        setupNaviBar()
        configureTableView()
    }
    
    func configureTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 81
        tableView.register(ChattingCell.self, forCellReuseIdentifier: reuseidentifier)
        
        tableView.backgroundColor = baseColor
        tableView.separatorInset = .init(top: 0, left: 0, bottom: 0, right: 0)
    
        
        view.addSubview(tableView)
        tableView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        
        
        
        
    }
    
    
    
    func setupNaviBar() {
        
        let label = UILabel()
        label.text = "채팅"
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .heavy)
        
        let topline = CALayer()
        topline.frame = CGRect(x: 0, y: 0, width: 100, height: 0.5)
        topline.backgroundColor = UIColor(hex: "3F3E43").cgColor
    

        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: label)
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()  // 불투명으로
        appearance.backgroundColor = UIColor(hex: "212123")
        navigationController?.navigationBar.tintColor = .systemBlue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }

    
}


// MARK: - UITableViewDataSource

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseidentifier, for: indexPath) as! ChattingCell
        
        cell.selectionStyle = .none

        
        return cell
    }
}

// MARK: - UITableViewDataSource

extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailVC = ChatViewDetailController()
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
