//
//  NeighborhoodCell.swift
//  CarrotMarket
//
//  Created by 민호 on 2022/06/16.
//

import UIKit

class NeighborhoodViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    let questionType: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor(hex: "2A2E32")
        label.text = "동네질문"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 11)
        label.layer.cornerRadius = 3
        label.layer.masksToBounds = true
        label.textAlignment = .center
        
        return label
    }()
    
    let questionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 3
        
        let attributedText = NSMutableAttributedString(string: "Q.", attributes: [.foregroundColor: UIColor(hex: "DD7C45"),
                                                                                  .font: UIFont.systemFont(ofSize: 16)])
        
        attributedText.append(NSAttributedString(string: " 세종으로 이사를 왔는데 남자 포마드 머리 잘하는 곳 없나요... 바버샵은 너무 비싸서 엄두가 안나네요 ㅠ 15000이하면 좋겠어요 ㅠ 나성 새롬 주변 희망합니당", attributes: [.font: UIFont.systemFont(ofSize: 16)]))
        
//        attributedText.append(NSAttributedString(string: "더보기", attributes: [.foregroundColor: UIColor(hex: "878B94"),
//                                                                              .font: UIFont.systemFont(ofSize: 13, weight: .bold)]))
        
        label.attributedText = attributedText
        
        
        return label
        
    }()
    
    let NameLabel: UILabel = {
        let label = UILabel()
        label.text = "당근이 ・"
        label.textColor = UIColor(hex: "878B94")
        label.font = UIFont.systemFont(ofSize: 11)
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
        label.text = "4시간 전"
        label.textAlignment = .right
        label.textColor = UIColor(hex: "878B94")
        label.font = UIFont.systemFont(ofSize: 11)
        return label
    }()
    
    let horizontalSeperateLine: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(hex: "2C2C2E")
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
    
    let mainSeperateLine: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(hex: "17161B")
        return line
    }()
    
    
    // MARK: - Lifecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Helpers

    func configureUI() {
        backgroundColor = baseColor
        
        contentView.addSubview(questionType)
        questionType.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, paddingTop: 20, paddingLeft: 15)
        questionType.setDimension(width: 50, height: 20)
        
        
        contentView.addSubview(questionLabel)
        questionLabel.anchor(top: questionType.bottomAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor,
                             paddingTop: 15, paddingLeft: 15,  paddingRight: 15)
        
        let stack = UIStackView(arrangedSubviews: [NameLabel, locationLabel])
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        
        contentView.addSubview(stack)
        stack.anchor(top: questionLabel.bottomAnchor, left: contentView.leftAnchor,
                     paddingTop: 15, paddingLeft: 15, width: 55, height: 15)
        
        contentView.addSubview(timeLabel)
        timeLabel.centerY(inView: stack)
        timeLabel.anchor(left: stack.rightAnchor, right: contentView.rightAnchor, paddingLeft: 200, paddingRight: 15)
        timeLabel.setDimension(width: 50, height: 15)
        
        contentView.addSubview(horizontalSeperateLine)
        horizontalSeperateLine.anchor(top: stack.bottomAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor, paddingTop: 15, height: 0.75)
        
        contentView.addSubview(numberCuriousAndCommentContainer)
        numberCuriousAndCommentContainer.anchor(top: horizontalSeperateLine.bottomAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, height: 60)
        
        contentView.addSubview(mainSeperateLine)
        mainSeperateLine.anchor(left: contentView.leftAnchor, bottom: contentView.bottomAnchor,right: contentView.rightAnchor, height: 8)
        
        

        
    }
    
    
    
    
}
