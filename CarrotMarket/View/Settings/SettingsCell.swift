//
//  SettingsCell.swift
//  CarrotMarket
//
//  Created by 민호 on 2022/06/18.
//

import UIKit

class SettingsCell: UITableViewCell {
    
    // MARK: - Properties
    
//    let icon: UIImageView = {
//        let image = UIImageView()
//        image.image = UIImage(systemName: "location.north.circle")?.withRenderingMode(.alwaysTemplate)
//        image.tintColor = .white
//        image.contentMode = .scaleAspectFit
//        return image
//    }()
//        
//    let keyword: UILabel = {
//        let label = UILabel()
//        label.text = ""
//        label.font = .systemFont(ofSize: 16)
//        return label
//    }()
//    
    
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = baseColor
        
//        contentView.addSubview(icon)
//        icon.centerY(inView: contentView)
//        icon.anchor(left: contentView.leftAnchor, paddingLeft: 20)
//
//        contentView.addSubview(keyword)
//        keyword.centerY(inView: contentView)
//        keyword.anchor(left: icon.rightAnchor, paddingLeft: 20)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
