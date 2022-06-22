//
//  AddItemHeaderView.swift
//  CarrotMarket
//
//  Created by 민호 on 2022/06/19.
//

import UIKit

class AddItemHeaderView: UIView {
    // MARK: - Properties
    
    let seperateLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "3F3E43")
        return view
    }()
    
    
    
    // MARK: - LifeCycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = baseColor
        
        addSubview(seperateLine)
        seperateLine.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingLeft: 15, paddingRight: 15, height: 0.5)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    
    
}
