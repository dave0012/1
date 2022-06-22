//
//  ChattingCell.swift
//  CarrotMarket
//
//  Created by 민호 on 2022/06/17.
//

import UIKit

class ChattingCell: UITableViewCell {
    
    
    //MARK: - Properties
    
    let userInfoImageView: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "pngwing.com (1)")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "당근조아"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.text = " 서초동 ・"
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = UIColor(hex: "878B94")
        
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "6달 전"
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = UIColor(hex: "878B94")
        
        return label
    }()
    
    let contentsLabel: UILabel = {
        let label = UILabel()
        label.text = "asdaadsasdasddsadsaasdsadsaddasasdsdasaddsasaddsa"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    
    
    
    
    
    
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        
        backgroundColor = baseColor
        contentView.addSubview(userInfoImageView)
        userInfoImageView.centerY(inView: contentView)
        userInfoImageView.anchor(left: contentView.leftAnchor, paddingLeft: 15)
        userInfoImageView.setDimension(width: 45, height: 45)
        
        let stack = UIStackView(arrangedSubviews: [nameLabel, locationLabel, timeLabel])
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        
        contentView.addSubview(stack)
        stack.anchor(top: contentView.topAnchor, left: userInfoImageView.rightAnchor,
                     paddingTop: 20, paddingLeft: 15, width: 150)
        
        contentView.addSubview(contentsLabel)
        contentsLabel.anchor(top: stack.bottomAnchor, left: userInfoImageView.rightAnchor,
                             paddingTop: 3.5, paddingLeft: 15, width: 250)
        
        
        
        
    }
}



