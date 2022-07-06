//
//  ItemDetailViewController.swift
//  CarrotMarket
//
//  Created by 민호 on 2022/06/13.
//

import UIKit

class NeighborhoodDetailViewController: UIViewController {
    
    
    var user: User?
    var post: Post
    
    
    // MARK: - ForScrollView
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    
   let contentView: UIView = {
       let view = UIView()
       return view
       }()
    
        
    // MARK: - Properties
    
    let neighborhoodDetailTopView = NeighborhoodDetailTopView()
    let neighborhoodDetailMiddleView = NeighborhoodDetailMiddleView()
    let neighborhoodDetailBottomView = NeighborhoodDetailBottomView()

        
        
  
    // MARK: - Lifecycle
    
    init(post: Post){
        self.post = post
        super.init(nibName: nil, bundle: nil)
    }
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        fetchUserInfo()
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - API

    
    func fetchUserInfo() {
        UserService.shared.fetchUserInfo { user in
            self.user = user
            print("DEBUG: \(self.user)")
            
            self.neighborhoodDetailTopView.userInfoImageView.sd_setImage(with: user.profileImageUrl)
            self.neighborhoodDetailTopView.nameLabel.text = user.profileName
            
   
        }
    }
        
    // MARK: - Helpers
    func configureUI() {
        view.backgroundColor = baseColor
        
        view.addSubview(scrollView)
        scrollView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        
        scrollView.addSubview(contentView)
        contentView.anchor(top: scrollView.topAnchor, left: scrollView.leftAnchor, bottom: scrollView.bottomAnchor, right: scrollView.rightAnchor, width: scrollView.frame.width, height: 1200)
        
        // 동적 뷰로 구성해야됌
        
        contentView.addSubview(neighborhoodDetailTopView)
        neighborhoodDetailTopView.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor, paddingTop: 0.001, paddingLeft: 0.001, paddingRight: 0.001)
        neighborhoodDetailTopView.setDimension(width: view.frame.width, height: 100)
        
        
        contentView.addSubview(neighborhoodDetailMiddleView)
        neighborhoodDetailMiddleView.anchor(top: neighborhoodDetailTopView.bottomAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor,paddingTop: 10, paddingLeft: 0.001, paddingRight: 0.001)
        neighborhoodDetailMiddleView.setDimension(width: view.frame.width, height: 170)
        neighborhoodDetailMiddleView.contentsLabel.text = post.caption
        
        

    }
    
    
}
