//
//  ModifyViewController.swift
//  CarrotMarket
//
//  Created by 민호 on 2022/07/06.
//

import UIKit
import Firebase
import SDWebImage

class ModifyViewController: UIViewController {
    
    // MARK: - Properties
    
    private let imagePicker = UIImagePickerController()
    private var profileImage: UIImage?
    
    let titleView = TitleView()
    
    
    private let plusPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "pngwing.com (1)")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(handleAddProfilePhoto), for: .touchUpInside)
        button.layer.cornerRadius = 120 / 2
        button.layer.masksToBounds = true
        
       return button
    }()
    
    private let nameTextField: UITextField = {
        let tf = UITextField()
        tf.textAlignment = .center
        tf.placeholder = "닉네임을 입력해주세요."
        tf.textColor = .white
        tf.layer.borderWidth = 0.7
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.layer.cornerRadius = 5
        tf.layer.masksToBounds = true
        
       return tf
    }()
    
    private let guideLabel: UILabel = {
        let label = UILabel()
        label.text = "프로필 사진과 닉네임을 입력해주세요."
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    private let completeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("완료", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        button.tintColor = .white
        button.backgroundColor = .gray
        button.addTarget(self, action: #selector(handleAddInfo), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - Lifecycle

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        fetchUserInfo()
    }
    
    // MARK: - API
    
    @objc func handleAddInfo() {
        
        guard let profileName = nameTextField.text else { return }
        guard let profileImage = profileImage else { return }
                
        let userInfo = UserInfo(profileName: profileName, profileImage: profileImage)
        
        UserService.shared.uploadUserInfo(user: userInfo) { err, ref in
            if let err = err {
                print(err.localizedDescription)
                return
            }
                print("DEBUG: sucessfully complete...")
                self.dismiss(animated: true, completion: nil)
        }
    }
    
    func fetchUserInfo() {
        UserService.shared.fetchUserInfo { user in
            
            let image = UIImageView()
            image.sd_setImage(with: user.profileImageUrl)
            self.plusPhotoButton.setImage(image.image?.withRenderingMode(.alwaysOriginal), for: .normal)
            self.nameTextField.placeholder = user.profileName
        }
    }



    
    // MARK: - Actions
    
    @objc func handleAddProfilePhoto() {
        present(imagePicker, animated: true, completion: nil)
    }
    
    @objc func handleDismiss() {
        dismiss(animated: true, completion: nil)
    }
    
    
    

    // MARK: - Helpers
    
    func configureUI() {
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
     
        view.backgroundColor = baseColor
        
        view.addSubview(titleView)
        titleView.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor)
        titleView.setDimension(width: view.frame.width, height: 90)
        titleView.cancelButton.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
        
        titleView.completeButton.setTitle("", for: .normal)
        titleView.mainLabel.text = "프로필 수정"
        
        view.addSubview(plusPhotoButton)
        
        plusPhotoButton.centerX(inView: view)
        plusPhotoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 80)
        plusPhotoButton.setDimension(width: 120, height: 120)
        
        view.addSubview(nameTextField)
        
        nameTextField.centerX(inView: view)
        nameTextField.anchor(top: plusPhotoButton.bottomAnchor, paddingTop: 20)
        nameTextField.setDimension(width: 350, height: 50)
        
        view.addSubview(guideLabel)
        
        guideLabel.centerX(inView: view)
        guideLabel.anchor(top: nameTextField.bottomAnchor, paddingTop: 10)
        
        view.addSubview(completeButton)
        
        completeButton.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, height: 80)

    }
}



// MARK: - UIImagePickerControllerDelegate
// 선택한 사진으로 어떠한 행위를 할 수 있음

extension ModifyViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
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

