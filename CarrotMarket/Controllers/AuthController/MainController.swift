//
//  MainController.swift
//  CarrotMarket
//
//  Created by 민호 on 2022/06/09.
//

import UIKit

class MainController: UIViewController {
    
    // MARK: - Properties
    
    let mainImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "logo")
        iv.contentMode = .scaleAspectFit
        //iv.backgroundColor = .white
        return iv
    }()
    
    let mainLabel: UILabel = {
        let label = UILabel()
        
        label.text = "당신 근처의 당근 마켓"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
      
        
        return label
    }()
    
    let subLabel: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 2
        
        label.text = """
                    중고 거래부터 동네 정보까지,
                    지금 내 동네를 선택하고 시작해보세요!
                    """
        
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    let startButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("시작하기", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
        
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor(hex: "EE8549")
        
        button.layer.cornerRadius = 5
        
        button.addTarget(self, action: #selector(handleShowRegister), for: .touchUpInside)
        
        return button
    }()
    
    let goToRegistration: UIButton = {
        let button = UIButton(type: .system)
        
        let attributedText = NSMutableAttributedString(string: "이미 계정이 있나요?",
                                                       attributes: [.font: UIFont.systemFont(ofSize: 15, weight: .light),
                                                                    .foregroundColor: UIColor.lightGray])
        
        attributedText.append(NSAttributedString(string: " 로그인",
                                                 attributes: [.font: UIFont.systemFont(ofSize: 16, weight: .bold),
                                                              .foregroundColor: UIColor(hex: "EE8549")]))
        
        button.setAttributedTitle(attributedText, for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
        
        return button
    }()
    
    
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    
    
    
    // MARK: - Action
    
    @objc func handleShowLogin() {
        
        let controller = LoginViewController()
        navigationController?.pushViewController(controller, animated: true)
        
    }
    
    @objc func handleShowRegister() {
        
        let controller = RegisterViewContoller()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = baseColor
        
        configureNavigation()
   

                        
        view.addSubview(mainImageView)

        mainImageView.centerX(inView: view)
        mainImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 160)
        mainImageView.setDimension(width: 130, height: 150)
        
        view.addSubview(mainLabel)
        
        mainLabel.centerX(inView: view)
        mainLabel.anchor(top: mainImageView.bottomAnchor, paddingTop: 10)
        
        view.addSubview(subLabel)
        
        subLabel.centerX(inView: view)
        subLabel.anchor(top: mainLabel.bottomAnchor, paddingTop: 8)
        subLabel.setDimension(width: 400, height: 50)
        
        view.addSubview(startButton)
        
        startButton.centerX(inView: view)
        startButton.anchor(top: subLabel.bottomAnchor, paddingTop: 165)
        startButton.setDimension(width: view.frame.width - 30, height: 50)
        
        view.addSubview(goToRegistration)
        
        goToRegistration.centerX(inView: view)
        goToRegistration.anchor(top: startButton.bottomAnchor, paddingTop: 20)
        goToRegistration.setDimension(width: view.frame.width - 30, height: 30)
    }
    
    func configureNavigation() {
     
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: "arrow.backward")?.withRenderingMode(.alwaysOriginal).withTintColor(.white)
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.backward")
        self.navigationController?.navigationBar.topItem?.title = ""

    }
    
    
}
