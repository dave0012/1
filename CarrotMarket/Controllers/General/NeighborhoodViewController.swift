//
//  NeighborhoodViewController.swift
//  CarrotMarket
//
//  Created by 민호 on 2022/06/12.
//

import UIKit

class NeighborhoodViewController: UIViewController {
 
    
    
    let reuseIdentifier = "NeighborhoodViewCell"
    
    
    //MARK: - Properties
    
    var tableView = UITableView()
    
    private let addButton = AddButton()
    
    
    //MARK: - Lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureTabelView()
        setupNaviBar()
        configureButton()
        
    }
    
    
    //MARK: - Helpers
    @objc func goToSearch() {
        
    }
    
    
    //MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = baseColor
        
    }
    
    func configureTabelView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 210
        tableView.register(NeighborhoodViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.backgroundColor = UIColor(hex: "17161B")
        
        tableView.separatorStyle = .none
        tableView.separatorInset = .init(top: 0, left: 15, bottom: 0, right: 15)
        // top, bottom 값은 적용되지않는다.
        
        view.addSubview(tableView)
        tableView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
    }
    
    
    
    
    func setupNaviBar() {
        let searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(goToSearch))
        searchButton.tintColor = .white
        
        let label = UILabel()
        label.text = "서초동"
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .heavy)
        
        let topline = CALayer()
        topline.frame = CGRect(x: 0, y: 0, width: 100, height: 0.5)
        topline.backgroundColor = UIColor(hex: "3F3E43").cgColor
    
        
        navigationItem.rightBarButtonItem = searchButton
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: label)
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()  // 불투명으로
        appearance.backgroundColor = UIColor(hex: "212123")
        navigationController?.navigationBar.tintColor = .systemBlue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }

    
    func configureButton() {
        
        addButton.delegate = self
        
        view.addSubview(addButton)
        addButton.anchor(bottom: view.bottomAnchor, right: view.rightAnchor, paddingBottom: 12.5, paddingRight: 20)
        addButton.setDimension(width: 55, height: 55)
    }
}
    




//MARK: - UITableViewDataSource

extension NeighborhoodViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! NeighborhoodViewCell
        cell.selectionStyle = .none
        
        return cell
        
    }
}

//MARK: - UITableViewDelegate


extension NeighborhoodViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 다음화면으로 이동
        let detailVC = NeighborhoodDetailViewController()
        navigationController?.pushViewController(detailVC, animated: true)
        
    }
}

extension NeighborhoodViewController: AddButtonDelegate {
    func goToNext() {
        let vc = NeighborhoodWritingController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
}

