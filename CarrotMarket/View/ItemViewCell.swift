//
//  TableViewCell.swift
//  CarrotMarket
//
//  Created by 민호 on 2022/06/12.
//


import UIKit
import SDWebImage


class ItemViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    var item: Item? {
        didSet { configure() }
    }

    
    let itemImageView: UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 5
        iv.layer.masksToBounds = true
        
        return iv
    }()
    
    let itemTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 16)
      
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "서초동"
        label.textColor = UIColor(hex: "878B94")
        label.font = UIFont.systemFont(ofSize: 11)
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "1분전"
        label.textColor = UIColor(hex: "878B94")
        label.font = UIFont.systemFont(ofSize: 11)
        return label
    }()
    
    let itemPriceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    let commentContainer: UIView = {
        let view = UIView()
        
        let image = UIImageView()
        image.image = UIImage(systemName: "message")?
            .withRenderingMode(.alwaysOriginal)
            .withTintColor(UIColor(hex: "878B95"))
        image.contentMode = .scaleAspectFit

        
        let label = UILabel()
        label.text = "1"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor(hex: "878B95")
        
        let stack = UIStackView(arrangedSubviews: [image, label])
        stack.axis = .horizontal
        stack.spacing = 3
        stack.distribution = .fillEqually
        
        view.addSubview(stack)
        stack.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        
        
        return view
    }()
    
    let divider: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        return view
    }()
        
    let largeConfiguration = UIImage.SymbolConfiguration(pointSize: 18, weight: .light)
    
 
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = baseColor
        setConstraints()
    
    }
  
        
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setConstraints() {
        addSubview(itemImageView)
        itemImageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor,  paddingTop: 20, paddingLeft: 18, paddingBottom: 20, width: 100)
       
        addSubview(itemTitleLabel)
        itemTitleLabel.anchor(top: topAnchor, left: itemImageView.rightAnchor, right: rightAnchor, paddingTop: 20, paddingLeft: 18, paddingRight: 20, width: 200, height: 20)
        
        let stack = UIStackView(arrangedSubviews: [locationLabel, timeLabel])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        
    
        addSubview(stack)
        stack.anchor(top: itemTitleLabel.bottomAnchor, left: itemImageView.rightAnchor, right: rightAnchor, paddingLeft: 18, paddingRight: 150, height: 20)
        
        addSubview(itemPriceLabel)
        itemPriceLabel.anchor(top: locationLabel.bottomAnchor, left: itemImageView.rightAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 18, paddingRight: 20, width: 200, height: 20)
        
        addSubview(commentContainer)
        commentContainer.anchor(left: itemImageView.rightAnchor ,bottom: bottomAnchor, right: rightAnchor, paddingLeft: 200, paddingBottom: 8, paddingRight: 15)
        commentContainer.setDimension(width: 32, height: 32)
        
        addSubview(divider)
        divider.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingLeft: 20, paddingRight: 20, height: 0.5)
        
    }
    
    
    // MARK: - Helpers
    
    func configure() {
        guard let item = item else { return }
        itemTitleLabel.text = item.itemTitle
        itemPriceLabel.text = item.itemPrice
        itemImageView.sd_setImage(with: item.itemImageUrl)
        
    }

}
    


