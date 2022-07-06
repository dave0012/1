//
//  MainTapBarController.swift
//  CarrotMarket
//
//  Created by 민호 on 2022/06/12.
//

import UIKit
import Firebase

class MainTabBarController: UITabBarController {
    
    
    // 탭바 이미지 크기 바꾸기

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.isTranslucent = false
        tabBar.barTintColor = UIColor(hex: "212123")
        tabBar.backgroundColor = UIColor(hex: "212123")
            
//        let topline = CALayer()
//        topline.frame = CGRect(x: 0, y: 0, width: self.tabBar.frame.width, height: 0.5)
//                topline.backgroundColor = UIColor(hex: "3F3E43").cgColor
//                self.tabBar.layer.addSublayer(topline)
        
        // tabBar에 윗줄만 만들기 -> borderwidth 안써도됌
        
        
        viewControllers = [
            
            createNavigationController(
                rootVC: HomeViewController(collectionViewLayout: UICollectionViewFlowLayout()),
                tabBarTitle: "홈",
                tabBarImage: UIImage(systemName: "house", withConfiguration: regularConfiguration)?
                                    .withRenderingMode(.alwaysOriginal)
                                    .withTintColor(.white),
                tabBarSelectedImage: UIImage(systemName: "house.fill", withConfiguration: regularConfiguration)?
                                            .withRenderingMode(.alwaysOriginal)
                                            .withTintColor(.white)),
            
                createNavigationController(
                    rootVC: NeighborhoodViewController(collectionViewLayout: UICollectionViewFlowLayout()),
                    tabBarTitle: "동네생활",
                    tabBarImage: UIImage(systemName: "newspaper", withConfiguration: regularConfiguration)?
                                        .withRenderingMode(.alwaysOriginal)
                                        .withTintColor(.white),
                    tabBarSelectedImage: UIImage(systemName: "newspaper.fill", withConfiguration: regularConfiguration)?
                                                .withRenderingMode(.alwaysOriginal)
                                                .withTintColor(.white)),
            
                    createNavigationController(
                        rootVC: ChatViewController(),
                        tabBarTitle: "채팅",
                        tabBarImage: UIImage(systemName: "message", withConfiguration: regularConfiguration)?
                                            .withRenderingMode(.alwaysOriginal)
                                            .withTintColor(.white),
                        tabBarSelectedImage: UIImage(systemName: "message.fill", withConfiguration: regularConfiguration)?
                                                    .withRenderingMode(.alwaysOriginal)
                                                    .withTintColor(.white)),
            
                        createNavigationController(
                            rootVC: InfoViewController(),
                            tabBarTitle: "나의 당근",
                            tabBarImage: UIImage(systemName: "person", withConfiguration: largeConfiguration)?
                                                .withRenderingMode(.alwaysOriginal)
                                                .withTintColor(.white),
                            tabBarSelectedImage: UIImage(systemName: "person.fill", withConfiguration: largeConfiguration)?
                                                        .withRenderingMode(.alwaysOriginal)
                                                        .withTintColor(.white)
            )
        ]
    }
    
    
    //MARK: - Private methods
    
    private func createNavigationController(rootVC: UIViewController, tabBarTitle: String, tabBarImage: UIImage?, tabBarSelectedImage: UIImage? = nil) -> UIViewController {
        let viewController = UINavigationController(rootViewController: rootVC)

        viewController.tabBarItem.image = tabBarImage
        viewController.tabBarItem.selectedImage = tabBarSelectedImage
        viewController.tabBarItem.title = tabBarTitle
        viewController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(white: 1, alpha: 0.9)], for: .normal)
    
        return viewController
    }
}

