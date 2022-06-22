//
//  NeighborhoodDetailTopView.swift
//  CarrotMarket
//
//  Created by 민호 on 2022/06/16.
//

import UIKit

class NeighborhoodDetailTopView: UIView {
    
    // MARK: - Properties
    
    let questionType: UILabel = {
        let label = UILabel()
        
        label.backgroundColor = UIColor(hex: "2A2E32")
        label.text = "동네질문"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 11)
        label.layer.cornerRadius = 3
        label.layer.masksToBounds = true
        label.textAlignment = .center
        
        return label
    }()
    
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
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "종촌동"
        label.textColor = UIColor(hex: "878B94")
        label.font = UIFont.systemFont(ofSize: 11)

        
       return label
    }()
   
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    
        addSubview(questionType)
        questionType.anchor(top: topAnchor, left: leftAnchor, paddingTop: 18, paddingLeft: 15)
        questionType.setDimension(width: 50, height: 20)
        
        
        addSubview(userInfoImageView)
        userInfoImageView.anchor(top: questionType.bottomAnchor, left: leftAnchor,
                            paddingTop: 10, paddingLeft: 15)
        userInfoImageView.setDimension(width: 30, height: 50)
        

        let stack = UIStackView(arrangedSubviews: [nameLabel, locationLabel])
        stack.axis = .vertical
        stack.spacing = 3
        
        addSubview(stack)
        stack.centerY(inView: userInfoImageView)
        stack.anchor(left: userInfoImageView.rightAnchor, paddingLeft: 10)

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

