//
//  LoginController.swift
//  CarrotMarket
//
//  Created by 민호 on 2022/06/09.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    
    let mainLabel: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 2
        
        label.text = """
                    안녕하세요!
                    휴대폰 번호로 로그인해주세요.
                    """
        
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.textColor = UIColor.white
        
        return label
    }()
    
    let subLabel: UILabel = {
        let label = UILabel()
        
        label.text = "휴대폰 번호는 안전하게 보관되며 이웃들에게 공개되지 않아요."
        
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor.white
        
        return label
    }()
    
    let inputPhoneNumberField: UITextField = {
        let tf = UITextField()
        
        let spacer = UIView()
        
        spacer.setDimension(width: 15, height: 20)
        
        tf.leftView = spacer
        tf.leftViewMode = .always
        
        tf.attributedPlaceholder = NSAttributedString(string: "휴대폰 번호(- 없이 숫자만 입력)", attributes: [.foregroundColor: customPlaceHolerColor])
        tf.textColor = .white
        
        tf.layer.cornerRadius = 5
        tf.layer.borderWidth = 0.9
        tf.layer.borderColor = customPlaceHolerColor.cgColor
        
        tf.becomeFirstResponder() // 화면 켜지자마자 텍스트필드를 리스폰더로 설정해주기
        tf.keyboardType = .numberPad
        
        return tf
    }()
    
    let receiveButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("인증문자 받기", for: .normal)
        button.setTitleColor(UIColor(hex: "50545B"), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .heavy)
        
        button.layer.borderWidth = 0.9
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor(hex: "50545B").cgColor
        
        button.isEnabled = false
        button.addTarget(self, action: #selector(handleReceiveButton), for: .touchUpInside)
        
        return button
    }()
    
    let goToFindID: UIButton = {
        let button = UIButton(type: .custom) // 눌러도 색깔이 변하지않음
        
        let attributedText = NSMutableAttributedString(string: "휴대폰 번호가 변경되었나요? ",
                                                       attributes: [.font: UIFont.systemFont(ofSize: 14),
                                                                    .foregroundColor: UIColor.white])
        
        attributedText.append(NSAttributedString(string: "이메일로 계정찾기",
                                                 attributes: [.font: UIFont.systemFont(ofSize: 14),
                                                              .foregroundColor: UIColor.white,
                                                              .underlineStyle: NSUnderlineStyle.single.rawValue]))
        
        button.setAttributedTitle(attributedText, for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        
        return button
    }()
    
    let failLabel: UILabel = {
        let label = UILabel()
        
        
        label.backgroundColor = .white
        label.textColor = .black
        label.text = "   전화번호가 잘못되었어요. 다시 한번 확인해주세요."
        label.font = UIFont.systemFont(ofSize: 14)
        label.layer.cornerRadius = 3
        label.layer.masksToBounds = true
        
        return label
    }()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
    }
    
    // MARK: - Actions
    
    @objc func handleReceiveButton(){
        
        if let text = inputPhoneNumberField.text, !text.isEmpty {
           let number = "+1\(text)"
            AuthManager.shared.startAuth(phoneNumber: number) { [weak self] success in
                guard success else {
                        UIView.animate(withDuration: 1) {
                            self?.failLabel.alpha = 1
                    } completion: { _ in
                        UIView.animate(withDuration: 0.75) {
                            self?.failLabel.alpha = 0
                        }
                    }
                    return
                }
                DispatchQueue.main.async {
                    let vc = SMSViewController()
                    vc.title = "Enter Code"
        self?.present(vc, animated: true, completion: nil)
                }
            }
        }
    }
    
    

   
    
    
    
    
    // MARK: - Helpers
    
    func configureUI() {
        
        configureTextField()
        
        view.backgroundColor = UIColor(hex: "212123")
        
        view.addSubview(mainLabel)
        
        mainLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 5, paddingLeft: 15, paddingRight: 50, width: view.frame.width, height: 80)
        
        view.addSubview(subLabel)
        
        subLabel.anchor(top: mainLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingLeft: 15, paddingRight: 10, width: view.frame.width, height: 20)
        
        view.addSubview(inputPhoneNumberField)
        
        inputPhoneNumberField.anchor(top: subLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 15 ,paddingLeft: 15, paddingRight: 15, width: view.frame.width, height: 50)
        
        view.addSubview(receiveButton)
        
        receiveButton.anchor(top: inputPhoneNumberField.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 15 ,paddingLeft: 15, paddingRight: 15, width: view.frame.width, height: 50)
        
        view.addSubview(goToFindID)
        
        goToFindID.anchor(top: receiveButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 25, paddingLeft: 15, paddingRight: 15)
        
        view.addSubview(failLabel)

        failLabel.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 10, paddingRight: 10, height: 50)
        failLabel.alpha = 0

        
    }
    
    
    func configureTextField() {
        inputPhoneNumberField.delegate = self
        
    }
    
    
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.layer.borderColor = UIColor.white.cgColor
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if (textField.text?.count)! + string.count > 10 {
            self.receiveButton.setTitleColor(UIColor.white, for: .normal)
            receiveButton.isEnabled = true
            return false
            // 이 부분에서 바로 실행문들이 실행되지 않고 한번 더 눌러야 실행이 됌... 왜 그러는 지 알아보고 고쳐야함
            
        } else {
            self.receiveButton.setTitleColor(UIColor(hex: "50545B"), for: .normal)
            receiveButton.isEnabled = false
            return true
        }
    }
}
