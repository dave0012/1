//
//  TextViewField.swift
//  CarrotMarket
//
//  Created by 민호 on 2022/07/05.
//

import UIKit

class TextViewField: UITextView {
    
    // MARK: - Properties
    
    let placeholderLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .darkGray
        label.text = "서초동에 올릴 게시글 내용을 작성해주세요."
        return label
    }()
    
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        backgroundColor = baseColor
        textColor = .white
        font = UIFont.systemFont(ofSize: 16)
        isScrollEnabled = true
        heightAnchor.constraint(equalToConstant: 450).isActive = true
        textContainerInset = .init(top: 20, left: 15, bottom: 0, right: 0)
        //커서 위치를 찍어보면 됌
        
     addSubview(placeholderLabel)
        placeholderLabel.anchor(top: topAnchor, left: leftAnchor, paddingTop: 20 ,paddingLeft: 20)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleTextInputChange), name: UITextView.textDidChangeNotification, object: nil)
        // TextView에 텍스트가 변경될때 호출하는 메소드
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    
    @objc func handleTextInputChange() {
        placeholderLabel.isHidden = !text.isEmpty
    }
}
