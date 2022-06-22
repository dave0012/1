

import UIKit
import FirebaseAuth

class SMSViewController: UIViewController {
    
    // MARK: - Properties
    
    let inputVerifiedNumberField: UITextField = {
        let tf = UITextField()
        
        let spacer = UIView()
        
        spacer.setDimension(width: 15, height: 20)
        
        tf.leftView = spacer
        tf.leftViewMode = .always
        
        tf.attributedPlaceholder = NSAttributedString(string: "인증번호 입력", attributes: [.foregroundColor: UIColor(hex: "6D707A")])
        tf.textColor = .white
        
        tf.layer.cornerRadius = 5
        tf.layer.borderWidth = 0.9
        tf.layer.borderColor = UIColor(hex: "6D707A").cgColor
        
        tf.becomeFirstResponder() // 화면 켜지자마자 텍스트필드를 리스폰더로 설정해주기
        tf.keyboardType = .numberPad
        
        return tf
    }()
    
    let subLabel: UILabel = {
        let label = UILabel()
        
        label.text = "어떠한 경우에도 타인에게 공유하지 마세요!"
        
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor(hex: "8A8892")
        
        return label
    }()
    
    
    let verifyButton: UIButton = {
        let button = UIButton(type: .system)
        
        
        button.setTitle("인증번호 확인", for: .normal)
        button.backgroundColor = UIColor(hex: "44474E")
        button.setTitleColor(UIColor(hex: "6E717A"), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .heavy)
        
        button.layer.borderWidth = 0.9
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor(hex: "50545B").cgColor
        
        button.addTarget(self, action: #selector(handleVerifyButton), for: .touchUpInside)
        
        return button
    }()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
    }
    
    // MARK: - Actions
    
    @objc func handleVerifyButton(){
        
        if let text = inputVerifiedNumberField.text, !text.isEmpty {
            let code = text
            AuthManager.shared.verifyCode(smsCode: code) { [weak self] success in
                guard success else {
                    self?.inputVerifiedNumberField.layer.borderColor = UIColor(hex: "D43320").cgColor
                    self?.subLabel.textColor = UIColor(hex: "D43320")
                    self?.subLabel.text = "인증번호를 다시 입력해주세요."
                    return
                }
                let vc = UINavigationController(rootViewController: MainTabBarController())
                vc.modalPresentationStyle = .fullScreen
                vc.navigationBar.isHidden = true
                self?.present(vc, animated: true, completion: nil)
            }
        }
    }
    
    
    // MARK: - Helpers
    
    func configureUI() {
        
        configureTextField()
        
        view.backgroundColor = UIColor(hex: "212123")
        
        view.addSubview(inputVerifiedNumberField)
        
        inputVerifiedNumberField.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 15 ,paddingLeft: 15, paddingRight: 15, width: view.frame.width, height: 50)
        
        view.addSubview(subLabel)
        
        subLabel.anchor(top: inputVerifiedNumberField.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 10 , paddingLeft: 15, paddingRight: 15, width: view.frame.width)
        
        view.addSubview(verifyButton)
        
        verifyButton.anchor(top: subLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 20 ,paddingLeft: 15, paddingRight: 15, width: view.frame.width, height: 50)
        
    }
    
    func configureTextField() {
        inputVerifiedNumberField.delegate = self
    }
    
    
    
}

extension SMSViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.layer.borderColor = UIColor.white.cgColor
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if (textField.text?.count)! + string.count > 6 {
            self.verifyButton.backgroundColor = UIColor(hex: "DE7D46")
            self.verifyButton.layer.borderWidth = 0
            self.verifyButton.setTitleColor(UIColor.white, for: .normal)
            return false
            
        } else {
            self.verifyButton.backgroundColor = UIColor(hex: "44474E")
            self.verifyButton.setTitleColor(UIColor(hex: "6E717A"), for: .normal)
            return true
        }
    }
}
