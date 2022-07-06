//
//  NeighborhoodViewController.swift
//  CarrotMarket
//
//  Created by 민호 on 2022/06/12.
//

import UIKit
import Firebase

let reuseIdentifier = "NeighborhoodViewCell"

class NeighborhoodViewController: UICollectionViewController {
 
    
    //MARK: - Properties
    
    private let addButton = AddButton()
    
    private var post = [Post]() {
        didSet { collectionView.reloadData() }
    }
    
    
    //MARK: - Lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        setupNaviBar()
        configureButton()
        fetchPost()
        
    }
    
    //MARK: - Helpers
    func fetchPost() {
        PostService.shared.fetchPosts { posts in
            self.post = posts
            print("DEBUG: \(self.post)")
        }
    }
    
    
    //MARK: - Helpers
    @objc func goToSearch() {
        
    }
    
    
    //MARK: - Helpers
    
    func configureUI() {
        collectionView.backgroundColor = UIColor(hex: "17161B")
        collectionView.register(NeighborhoodViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
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
    
extension NeighborhoodViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return post.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! NeighborhoodViewCell
        
        cell.post = post[indexPath.row]
        
        return cell
    }
 
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let controller = NeighborhoodDetailViewController(post: post[indexPath.row])
            navigationController?.pushViewController(controller, animated: true)
        }
      
    }

extension NeighborhoodViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    
    
    
}










extension NeighborhoodViewController: AddButtonDelegate {
    func goToNext() {
        let vc = NeighborhoodWritingController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
}

