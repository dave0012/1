//
//  AddItemCell.swift
//  CarrotMarket
//
//  Created by 민호 on 2022/06/19.
//

import UIKit

protocol AddCellDelegate: AnyObject {
    func settingsCell(value: String)

}

class AddItemCell: UITableViewCell {
    
    // MARK: - Properties
    
    weak var delegate: AddCellDelegate?
    
    var inputField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .none
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.addTarget(self, action: #selector(handleUpdateInfo), for: .editingDidEnd)

    
        return tf
    }()
    


    
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        backgroundColor = baseColor
        
        addSubview(contentView)
        contentView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        
        contentView.addSubview(inputField)
        inputField.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingLeft: 20)
        
        
        

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //MARK: - Actions
    
    //입력이 끝나면 동작하는 것
    
    @objc func handleUpdateInfo(sender: UITextField) {
        guard let value = sender.text else { return }
        delegate?.settingsCell(value: value)
    }
    
}
