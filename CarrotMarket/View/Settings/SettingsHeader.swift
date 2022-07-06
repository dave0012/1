//
//  SettingsHeader.swift
//  CarrotMarket
//
//  Created by 민호 on 2022/06/18.
//

import UIKit

protocol settingsHeaderDelegate: AnyObject {
    func modifyInfo()
}

class settingsHeader: UIView {
    
    // MARK: - Properties
    
    weak var delegate: settingsHeaderDelegate?
    
    let myImage: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "pngwing.com (1)")
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 70 / 2
        image.layer.masksToBounds = true

        return image
    }()
    
    var myName: UILabel = {
        let label = UILabel()
        label.text = "미노"
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)

        return label
    }()
    
    let location: UILabel = {
        let label = UILabel()
        label.text = "서초동"
        label.font = UIFont.systemFont(ofSize: 12.5)
        label.textColor = UIColor(hex: "878B94")
        return label
    }()
    
    let uniqueNumber: UILabel = {
        let label = UILabel()
        label.text = "#15728698"
        label.font = UIFont.systemFont(ofSize: 12.5)
        label.textColor = UIColor(hex: "878B94")

        return label
    }()
    
//    let nextImage: UIImageView = {
//        let image = UIImageView()
//        image.image = UIImage(systemName: "chevron.forward", withConfiguration: semiBoldConfiguration)?.withRenderingMode(.alwaysTemplate)
//        image.tintColor = .white
//        return image
//    }()
    let modifyInfoButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.layer.borderWidth = 0.7
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.addTarget(self, action: #selector(handleModifyButton), for: .touchUpInside)
        button.setTitle("프로필 수정", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        return button
    }()
    
    

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = baseColor
        
        addSubview(myImage)
        myImage.anchor(top: topAnchor, left: leftAnchor, paddingTop: 30, paddingLeft: 20)
        myImage.setDimension(width: 70, height: 70)
        
        addSubview(myName)
        myName.anchor(top: topAnchor, left: myImage.rightAnchor, paddingTop: 40, paddingLeft: 20)
        myName.setDimension(width: 100, height: 20)
        
        addSubview(location)
        location.anchor(top: myName.bottomAnchor, left: myImage.rightAnchor, paddingTop: 2.5, paddingLeft: 20)
        location.setDimension(width: 40, height: 20)
        
        addSubview(uniqueNumber)
        uniqueNumber.anchor(top: myName.bottomAnchor, left: location.rightAnchor, paddingTop: 2.5)
        uniqueNumber.setDimension(width: 80, height: 20)
        
        addSubview(modifyInfoButton)
        modifyInfoButton.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor,
                                paddingLeft: 20, paddingBottom: 20, paddingRight: 20, height: 35)
        
//        addSubview(nextImage)
//        nextImage.centerY(inView: myImage)
//        nextImage.anchor(right: rightAnchor, paddingRight: 20)
//        nextImage.setDimension(width: 11.5, height: 15)
//                
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Actions

    @objc func handleModifyButton() {
        delegate?.modifyInfo()
    }

    
}
