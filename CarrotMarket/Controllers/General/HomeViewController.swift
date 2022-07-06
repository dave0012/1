//
//  MainViewController.swift
//  CarrotMarket
//
//  Created by 민호 on 2022/06/11.
//

import UIKit
import Firebase

private let reuseIdentifer = "ItemViewCell"

class HomeViewController: UICollectionViewController {
    

    //MARK: - Properties
    
    private var items = [Item]() {
        didSet { collectionView.reloadData() }
    }
    
    
    private let addButton = AddButton()
    
    
    //MARK: - Lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        checkIfUserLoggedIn()
        setupNaviBar()
        fetchItem()
   
    }
    
    
    //MARK: - API
    
    func fetchItem() {
        ItemService.shared.fetchItems { items in
            self.items = items
        }
    }
    
    func checkIfUserLoggedIn() {
        if Auth.auth().currentUser?.uid == nil {
            DispatchQueue.main.async {
                let nav = UINavigationController(rootViewController: MainController())
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true, completion: nil)
            }
        } else {
            configureUI()
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            DispatchQueue.main.async {
                let nav = UINavigationController(rootViewController: MainController())
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true, completion: nil)
            }
            } catch {
                print("DEBUG: Error signing out")
            }
        }
    
    
    //MARK: - Action

    @objc func goToSearch() {
        print("DEBUG: show search view...")
    }
    
    
    
    //MARK: - Helpers
    
    func configureUI() {
        
        collectionView.backgroundColor = baseColor
        configureCollectionView()
        configureButton()
        

    }
    
    func configureCollectionView() {
        collectionView.register(ItemViewCell.self, forCellWithReuseIdentifier: reuseIdentifer)
    }

    func setupNaviBar() {
        let searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(goToSearch))
        searchButton.tintColor = .white
        
        let label = UILabel()
        label.text = "서초동"
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .heavy)
        
//        let topline = CALayer()
//        topline.frame = CGRect(x: 0, y: 0, width: 100, height: 0.5)
//        topline.backgroundColor = UIColor(hex: "3F3E43").cgColor
    
        
        navigationItem.rightBarButtonItem = searchButton
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: label)
        
        // (네비게이션바 설정관련) iOS버전 업데이트 되면서 바뀐 설정⭐️⭐️⭐️
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

//MARK: - UICollectionViewDataSource


extension HomeViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifer, for: indexPath) as! ItemViewCell
        
        cell.item = items[indexPath.row]

        return cell
    }
}

//MARK: - UICollectionViewDelegate


extension HomeViewController {
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = ItemDetailViewController(item: items[indexPath.row])
        navigationController?.pushViewController(controller, animated: true)
    }
  
}

//MARK: - UICollectionViewDelegateFlowLayout

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}



// MARK: - AddButtonDelegate

extension HomeViewController: AddButtonDelegate {
    func goToNext() {
                
        let vc = ItemAddController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
}








