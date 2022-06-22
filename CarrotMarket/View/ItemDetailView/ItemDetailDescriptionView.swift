//
//  ItemDetailDescriptionView.swift
//  CarrotMarket
//
//  Created by 민호 on 2022/06/14.
//

import UIKit

class ItemDetailDescriptionView: UIView {
    
    let mainLabel: UILabel = {
        let label = UILabel()
        
        label.text = "제목"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    

    let subLabel: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 30
        label.text = "이곳은 동적뷰로 구성해야됩니다."
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
  
    
    let seperateLine: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(hex: "2C2B30")
        return line
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        addSubview(mainLabel)
        mainLabel.anchor(top: topAnchor, left: leftAnchor, paddingTop: 30, paddingLeft: 20)
        
        addSubview(subLabel)
        subLabel.anchor(top: mainLabel.bottomAnchor, left: leftAnchor, paddingTop: 20, paddingLeft: 20)
        
        addSubview(seperateLine)
        seperateLine.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingLeft: 20, paddingRight: 20, height: 1)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
