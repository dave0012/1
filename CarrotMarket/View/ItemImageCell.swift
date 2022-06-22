//
//  ItemImageCell.swift
//  CarrotMarket
//
//  Created by 민호 on 2022/06/14.
//

import UIKit

class ItemImageCell: UICollectionViewCell {
    
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.contentMode = .scaleAspectFill
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

