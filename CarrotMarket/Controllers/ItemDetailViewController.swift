//
//  ItemDetailViewController.swift
//  CarrotMarket
//
//  Created by 민호 on 2022/06/13.
//

import UIKit

class ItemDetailViewController: UIViewController {
        
    
    
    // MARK: - Properties
    
    let bottomView = ItemDetailBottomView()
    let userIDView = ItemDetailUserInfoView()
    let descriptionView = ItemDetailDescriptionView()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    
   let contentView: UIView = {
       let view = UIView()
       return view
       }()
    
    
    let itemImageView: UIView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "IMG_0952")
        image.contentMode = .scaleToFill
        return image
    }()
    
    
    let itemPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    let horizontalSeperateLine: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(hex: "4D4C51")
        return line
    }()
    
    
   
    
    // MARK: - Lifecycle
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
       
    }
    
    
    
        override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
            super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
            hidesBottomBarWhenPushed = true
            //네비게이션 이동시 탭바 없애주는 기능 
        }
    
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    
        
    // MARK: - Helpers
    func configureUI() {
        
        view.backgroundColor = UIColor(hex: "212123")
        
        configureNavigationUI()
        
        
        view.addSubview(scrollView)
        scrollView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        
        scrollView.addSubview(contentView)
        contentView.anchor(top: scrollView.topAnchor, left: scrollView.leftAnchor, bottom: scrollView.bottomAnchor, right: scrollView.rightAnchor, width: scrollView.frame.width, height: 1500)
        
        contentView.addSubview(itemImageView)
        itemImageView.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor, paddingTop: -50 ,paddingLeft: 0.001)
        itemImageView.setDimension(width: view.frame.width, height: 362)
        
        
        
        // 패딩을 안주면 안뜸... 왜 이러는지 모르겠다,,,,,,,,,

    
        contentView.addSubview(userIDView)
        userIDView.anchor(top: itemImageView.bottomAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor, paddingLeft: 0.001)
        userIDView.setDimension(width: view.frame.width, height: 80)
        
        contentView.addSubview(descriptionView)
        descriptionView.anchor(top: userIDView.bottomAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor, paddingLeft: 0.001)
        descriptionView.setDimension(width: view.frame.width, height: 400)
        // 여기는 동적뷰로 구성해야됌 (글씨가 늘어날수록 뷰가 커짐)
        
        
        configureBottomUI() // 코드를 맨뒤에 적어야 활성화가 됌

        
    }
    

    func configureBottomUI() {

        view.addSubview(bottomView)
        bottomView.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, height: 107.5)
        
        bottomView.addSubview(horizontalSeperateLine)
        horizontalSeperateLine.anchor(top: bottomView.topAnchor, left: bottomView.leftAnchor, right: bottomView.rightAnchor,
                                      height: 0.75)
        
        

    }
    
    func configureNavigationUI() {
        navigationController?.navigationBar.isHidden = false

    }

}
