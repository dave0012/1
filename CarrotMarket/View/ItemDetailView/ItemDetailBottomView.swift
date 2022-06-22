//
//  ItemDetailBottomView.swift
//  CarrotMarket
//
//  Created by 민호 on 2022/06/14.
//

import UIKit

class ItemDetailBottomView: UIView {
    
    //MARK: - Properties
    
    let heartButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "heart")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .lightGray
        button.addTarget(self, action: #selector(handleHeartButton), for: .touchUpInside)
        
        return button
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "3,500원"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        
        return label

    }()
    
    let askLabel: UILabel = {
        let label = UILabel()
        label.text = "가격 제안 불가"
        label.textColor = UIColor(hex: "878B95")
        label.font = .systemFont(ofSize: 14, weight: .bold)
   
        return label

    }()
    
    let chatButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor(hex: "DE7D46")
        button.setTitle("채팅하기", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.addTarget(self, action: #selector(handleChatButton), for: .touchUpInside)
        button.layer.cornerRadius = 5

        return button

    }()
    
    let horizontalSeperateLine: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(hex: "4D4C51")
        return line
    }()
    
    
    let verticalSeperateLine: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(hex: "34373C")
        return line
    }()
    
    
    
    
    //MARK: - Lifecycle
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(hex: "212123")
        
        addSubview(heartButton)
        heartButton.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor,
                           paddingTop: 0, paddingLeft: 10, paddingBottom: 30)
        heartButton.setDimension(width: 30, height: 30)
        
        addSubview(verticalSeperateLine)

        verticalSeperateLine.centerY(inView: heartButton)
        verticalSeperateLine.anchor(left: heartButton.rightAnchor, paddingLeft: 5)
        verticalSeperateLine.setDimension(width: 1, height: 40)
        
        let stack = UIStackView(arrangedSubviews: [priceLabel, askLabel])
        
        stack.axis = .vertical
        stack.spacing = 3
        stack.distribution = .fillEqually
        
        addSubview(stack)
        stack.anchor(left: heartButton.rightAnchor, paddingLeft: 20)
        stack.centerY(inView: heartButton)
        
        addSubview(chatButton)
        
        chatButton.centerY(inView: heartButton)
        chatButton.anchor(left: stack.rightAnchor, paddingLeft: 140)
        chatButton.setDimension(width: 90, height: 38)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    //MARK: - actions

    @objc func handleHeartButton() {
        heartButton.setImage(UIImage(systemName: "heart.fill")?.withRenderingMode(.alwaysOriginal), for: .normal)
    }
    
    @objc func handleChatButton() {
        print("go to Chat Controller...")
    }
}
