//
//  AddItemTitleView.swift
//  CarrotMarket
//
//  Created by 민호 on 2022/06/19.
//

import UIKit

let configuration = UIImage.SymbolConfiguration(weight: .regular)

protocol TitleViewDelegate: AnyObject {
    func goBefore()
    func goNext()
}

class TitleView: UIView {
    

    // MARK: - Properties
    
    weak var delegate: TitleViewDelegate?
    
    let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "xmark", withConfiguration: configuration)?.withRenderingMode(.alwaysOriginal).withTintColor(.white), for: .normal)
        button.addTarget(self, action: #selector(handleBackButton), for: .touchUpInside)
        return button
        
    }()
    
    let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "중고거래 글쓰기"
        label.tintColor = .white
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    let completeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("완료", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        button.tintColor = carrotColor
        button.addTarget(self, action: #selector(handleNextButton), for: .touchUpInside)
        return button
    }()
    
    let seperateLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "3F3E43")
        return view
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = baseColor
        
        addSubview(cancelButton)
        cancelButton.anchor(left: leftAnchor, bottom: bottomAnchor, paddingLeft: 18, paddingBottom: 15)
        cancelButton.setDimension(width: 17.5, height: 17.5)
        
        
        addSubview(mainLabel)
        mainLabel.centerY(inView: cancelButton)
        mainLabel.centerX(inView: self)

        
        addSubview(completeButton)
        completeButton.centerY(inView: mainLabel)
        completeButton.anchor(right: rightAnchor, paddingRight: 15)

        
        addSubview(seperateLine)
        seperateLine.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, height: 0.75)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Actions
    
    @objc func handleBackButton() {
        delegate?.goBefore()
    }
    
    @objc func handleNextButton() {
        delegate?.goNext()
    }
}
