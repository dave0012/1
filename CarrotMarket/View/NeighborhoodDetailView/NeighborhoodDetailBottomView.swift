//
//  NeighborhoodDetailTopView.swift
//  CarrotMarket
//
//  Created by 민호 on 2022/06/16.
//

import UIKit

class NeighborhoodDetailBottomView: UIView {
    
    // MARK: - Properties
    
   
    let nameLabel: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 200
        label.text = """
                    빠르고 사양좋은 피씨방 어딘지 아시는 분!!
                    나성동 아름동 쪽에 아는 곳 있으시면 알려주세요
                    """
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16.5)
        return label
    }()
    
    let seperateLine: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(hex: "2C2B30")
        return line
    }()
    
    let numberCuriousAndCommentContainer: UIView = {
        let view = UIView()
        
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "kindpng_4750067").withRenderingMode(.alwaysOriginal).withTintColor(UIColor(hex: "878B95"))
        image.contentMode = .scaleAspectFill
        

        let label = UILabel()
        label.text = "궁금해요"
        label.textColor = UIColor(hex: "A7ACB5")
        label.font = UIFont.systemFont(ofSize: 14)
        
        let secondImage = UIImageView()
        secondImage.image = UIImage(systemName: "message")?.withRenderingMode(.alwaysOriginal).withTintColor(UIColor(hex: "878B95"))
        secondImage.contentMode = .scaleAspectFill


        let secondLabel = UILabel()
        secondLabel.text = "답변하기"
        secondLabel.textColor = UIColor(hex: "A7ACB5")
        secondLabel.font = UIFont.systemFont(ofSize: 14)
        
        view.addSubview(image)
        image.anchor(top: view.topAnchor ,left: view.leftAnchor,paddingTop: 20 ,paddingLeft: 15)
        image.setDimension(width: 15, height: 15)
        
        view.addSubview(label)
        label.centerY(inView: image)
        label.anchor(left: image.rightAnchor, paddingLeft: 5)
        

        view.addSubview(secondImage)
        secondImage.centerY(inView: image)
        secondImage.anchor(left: label.rightAnchor, paddingLeft: 25, width: 15, height: 15)


        view.addSubview(secondLabel)
        secondLabel.centerY(inView: image)
        secondLabel.anchor(left: secondImage.rightAnchor, paddingLeft: 5, width: 60)

        
        return view
    }()
    
    let BottomSeperateLine: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(hex: "2C2B30")
        return line
    }()
    
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(nameLabel)
        nameLabel.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 15, paddingLeft: 15, paddingRight: 10)
        
        addSubview(seperateLine)
        seperateLine.anchor(top: nameLabel.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 60, height: 1)
        
     
        addSubview(numberCuriousAndCommentContainer)
        numberCuriousAndCommentContainer.anchor(left: leftAnchor, bottom: bottomAnchor)
        numberCuriousAndCommentContainer.setDimension(width: 120, height: 50)
       
        addSubview(BottomSeperateLine)
        BottomSeperateLine.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, height: 1)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

