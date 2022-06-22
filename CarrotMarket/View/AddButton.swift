//
//  AddButton.swift
//  CarrotMarket
//
//  Created by 민호 on 2022/06/19.
//

import UIKit

protocol AddButtonDelegate: AnyObject {
    func goToNext()
}


class AddButton: UIButton {
    
    weak var delegate: AddButtonDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        backgroundColor = carrotColor
        layer.cornerRadius = 27.5
        layer.masksToBounds = true
        setImage(UIImage(systemName: "plus", withConfiguration: buttonConfiguration)?.withRenderingMode(.alwaysOriginal).withTintColor(.white), for: .normal)
        addTarget(self, action: #selector(handleGoToNext), for: .touchUpInside)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleGoToNext() {
        delegate?.goToNext()
    }
    
    
}
