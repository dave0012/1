//
//  NeighborhoodWriting.swift
//  CarrotMarket
//
//  Created by 민호 on 2022/06/19.
//

import UIKit

class NeighborhoodWritingController: UIViewController {
    
    //MARK: - Properties
    
    let titleView = TitleView()
    
    let tableView = UITableView()
    
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }

    
    
    
    
    //MARK: - Helpers

    
    func configureUI() {
        
        view.backgroundColor = baseColor
        
        titleView.delegate = self
        
        view.addSubview(titleView)
        titleView.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor)
        titleView.setDimension(width: view.frame.width, height: 90)
        titleView.completeButton.tintColor = .gray
        
    }
    
    func configureTableView() {
        
        view.addSubview(tableView)
        tableView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
    }

    
}


extension NeighborhoodWritingController: TitleViewDelegate {
    func goNext() {
        print("DEBUG: fetch add post...")
    }
    
    func goBefore() {
        dismiss(animated: true, completion: nil)
    }
}
