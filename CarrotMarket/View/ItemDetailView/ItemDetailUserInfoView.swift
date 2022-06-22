//
//  ItemDetailUserInfoView.swift
//  CarrotMarket
//
//  Created by 민호 on 2022/06/14.
//


import UIKit

class ItemDetailUserInfoView: UIView {
    
    //MARK: - Properties
    
    let userInfoImageView: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "pngwing.com (1)")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "당근조아"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    let seperateLine: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(hex: "2C2B30")
        return line
    }()
    

    
    

    //MARK: - Lifecycle
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(userInfoImageView)
        userInfoImageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 20, paddingLeft: 10, paddingBottom: 20, paddingRight: 300)
        
        addSubview(nameLabel)
        nameLabel.anchor(top: topAnchor, left: userInfoImageView.rightAnchor, paddingTop: 20)
        
        addSubview(seperateLine)
        seperateLine.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingLeft: 20, paddingRight: 20, height: 1)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
