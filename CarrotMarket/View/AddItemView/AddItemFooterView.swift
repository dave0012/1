//
//  AddItemFooterView.swift
//  CarrotMarket
//
//  Created by 민호 on 2022/06/21.
//

import Foundation
import UIKit

protocol AddItemFooterViewDelegate: AnyObject {
    
    func extractContents(value: String)
}

class AddItemFooterView: UITextView {
    //MARK: - Properties
    
    
    
    
    
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        backgroundColor = baseColor
        textContainerInset = UIEdgeInsets(top: 20.0, left: 15.0, bottom: 16.0, right: 16.0)
        font = .systemFont(ofSize: 16.5)
        text = textViewPlaceHolder
        textColor = UIColor(hex: "51545B")
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
