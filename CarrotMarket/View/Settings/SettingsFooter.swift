//
//  SettingsFooter.swift
//  CarrotMarket
//
//  Created by 민호 on 2022/06/18.
//


import UIKit

protocol SettingsFooterDelegate: AnyObject {
    func signOut()
}

class SettingsFooter: UIView {
    
    // MARK: - Properties
    
    weak var delegate: SettingsFooterDelegate?
   
    let signOut: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("로그아웃", for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(handleSignOut), for: .touchUpInside)
        
        
        return button
    }()
    
    let topSeperateLine: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(hex: "17161B")
        return line
    }()
    
    let bottomSeperateLine: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(hex: "17161B")
        return line
    }()
    

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = baseColor
        
        addSubview(topSeperateLine)
        topSeperateLine.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, height: 8)
        
        addSubview(bottomSeperateLine)
        bottomSeperateLine.anchor(left: leftAnchor, bottom: bottomAnchor ,right: rightAnchor, height: 8)
        
        addSubview(signOut)
        signOut.anchor(top: topSeperateLine.bottomAnchor, left: leftAnchor, bottom: bottomSeperateLine.topAnchor, right: rightAnchor)
        
        
                
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    // MARK: - Actions

    @objc func handleSignOut() {
        print("sign Out")
        delegate?.signOut()
    }

}

