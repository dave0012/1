//
//  ItemAddController.swift
//  CarrotMarket
//
//  Created by 민호 on 2022/06/19.
//

import UIKit

class ItemAddController: UIViewController {
    
    //MARK: - Properties
    
    let titleView = TitleView()
    
    private let imagePicker = UIImagePickerController()
    private var profileImage: UIImage?
    private let textViewField = TextViewField()
    
    private let plusPhotoButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "camera.fill")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(handleAddProfilePhoto), for: .touchUpInside)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        
       return button
    }()
    
    private let itemTitleInputField: UITextField = {
       let tf = UITextField()
        tf.placeholder = "글 제목"
        tf.backgroundColor = baseColor
        
        return tf
    }()
    
    private let itemPriceInputField: UITextField = {
       let tf = UITextField()
        tf.placeholder = "가격"
        tf.backgroundColor = baseColor
        return tf
    }()
    
    private let divider: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        return view
    }()
    
    private let divider2: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        return view
    }()
    
    private let divider3: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        return view
    }()
    
    
    
    
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboardByTappingOutside))
        
        self.view.addGestureRecognizer(tap)
    }
    
    
    //MARK: - Actions

    @objc func handleAddProfilePhoto() {
        present(imagePicker, animated: true, completion: nil)
    }
    
    @objc func hideKeyboardByTappingOutside() {
        self.view.endEditing(true)
    }
        
    
    
    //MARK: - Helpers

    
    func configureUI() {
        
        titleView.delegate = self
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = true

        
        view.backgroundColor = baseColor
        
        view.addSubview(titleView)
        titleView.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor)
        titleView.setDimension(width: view.frame.width, height: 90)
        
        view.addSubview(plusPhotoButton)
        plusPhotoButton.anchor(top: titleView.bottomAnchor, left: view.leftAnchor, paddingTop: 25, paddingLeft: 20)
        plusPhotoButton.setDimension(width: 70, height: 70)
        
        view.addSubview(itemTitleInputField)
        itemTitleInputField.anchor(top: plusPhotoButton.bottomAnchor, left: view.leftAnchor, paddingTop: 20, paddingLeft: 20)
        itemTitleInputField.setDimension(width: view.frame.width - 40, height: 70)
        
        view.addSubview(divider)
        divider.anchor(top: itemTitleInputField.topAnchor, left: view.leftAnchor, right: view.rightAnchor,
                       paddingLeft: 20, paddingRight: 20, height: 0.5)
        
        view.addSubview(divider2)
        divider2.anchor(left: view.leftAnchor, bottom: itemTitleInputField.bottomAnchor,  right: view.rightAnchor,
                       paddingLeft: 20, paddingRight: 20, height: 0.5)
        
        
        view.addSubview(itemPriceInputField)
        itemPriceInputField.anchor(top: itemTitleInputField.bottomAnchor, left: view.leftAnchor, paddingLeft: 20)
        itemPriceInputField.setDimension(width: view.frame.width - 40, height: 70)
        
        view.addSubview(divider3)
        divider3.anchor(top: itemPriceInputField.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor,
                        paddingLeft: 20, paddingRight: 20, height: 0.5)
        
        view.addSubview(textViewField)
        textViewField.anchor(top: divider3.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor)
        
    }
}




//MARK: - TitleViewDelegate

extension ItemAddController: TitleViewDelegate {
    func goBefore() {
        dismiss(animated: true, completion: nil)
    }
    
    func goNext() {
        
        print(#function)
        
        guard let image = profileImage else { return }
        guard let title = itemTitleInputField.text else { return }
        guard let price = itemPriceInputField.text else { return }
        guard let caption = textViewField.text else { return }

        
        let itemInfo = ItemInfo(itemImage: image, itemTitle: title, itemPrice: price, itemCaption: caption)
        
        ItemService.shared.uploadItem(itemInfo: itemInfo) { err, ref in
            if let err = err {
                print(err.localizedDescription)
                return
            }
                self.dismiss(animated: true, completion: nil)
        }
    }
}

// MARK: - UIImagePickerControllerDelegate
// 선택한 사진으로 어떠한 행위를 할 수 있음

extension ItemAddController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let profileImage = info[.editedImage] as? UIImage else { return }
        // info[.editedImage] -> 원본 이미지인지, 편집된 이미지인지, 동영상인지 알아야함
        self.profileImage = profileImage
        
        plusPhotoButton.imageView?.contentMode = .scaleAspectFill
        plusPhotoButton.imageView?.clipsToBounds = true
        plusPhotoButton.layer.borderWidth = 0
        
        self.plusPhotoButton.setImage(profileImage.withRenderingMode(.alwaysOriginal), for: .normal)
        
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - 수정해야할것
// responder가 TextView나 textFieldView에 가 있으면 TitleView의 button이 작동하지 않음
// photoView의 화면을 클릭해야만 넘어감

