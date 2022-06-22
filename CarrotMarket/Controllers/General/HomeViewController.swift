//
//  MainViewController.swift
//  CarrotMarket
//
//  Created by 민호 on 2022/06/11.
//

import UIKit
import Firebase



class HomeViewController: UIViewController {
    
    
    private let reuseIdentifer = "ItemViewCell"
    
 
    
//    var itemArray: [Item] = [Item(dictionary: <#T##[String : Any]#>)]
    
    var itemArray: [Item] = [
        Item(itemImage: #imageLiteral(resourceName: "IMG_0955"), itemTitle: "푸마 새상품", itemPrice: "20,000원", itemDescirption: "택만 제거한 새상품이에요 지난달 코스트코에서 구입했어요 사이즈 계속 고민하고 잘 안맞으서 올려봅니다.", location: "서초동 ・", time: "1분 전"),
        
        Item(itemImage: #imageLiteral(resourceName: "IMG_0952"), itemTitle: "포켓몬빵 4개 거래합니다.", itemPrice: "19,000원", itemDescirption: "초코롤2개 디그다2개 유통기한 사진참조", location: "서초동 ・ ", time: "1분 전"),
        
        Item(itemImage: #imageLiteral(resourceName: "IMG_0949"), itemTitle: "초코 포켓몬빵 팝니다", itemPrice: "4,500원", itemDescirption: "유통기한 사진참조 1개구입 5000원 2개 이상 4500원", location: "서초동 ・ ", time: "1분 전"),
        
        Item(itemImage: #imageLiteral(resourceName: "IMG_0954"), itemTitle: "푸마 새상품", itemPrice: "20,000원", itemDescirption: "택만 제거한 새상품이에요 지난달 코스트코에서 구입했어요 사이즈 계속 고민하고 잘 안맞으서 올려봅니다.", location: "서초동 ・ ", time: "1분 전"),
        
        Item(itemImage: #imageLiteral(resourceName: "IMG_0989"), itemTitle: "[새제품]급전이 필요해서 급매합니다 시중가50만청소기 개봉도 안해보고 판매합니다! 무선전용거치대도있습니다!", itemPrice: "175,000원", itemDescirption: "", location: "서초동 ・ ", time: "1분 전"),
        
        Item(itemImage: #imageLiteral(resourceName: "IMG_0990"), itemTitle: "종이학", itemPrice: "20,000원", itemDescirption: "", location: "서초동 ・ ", time: "1분 전"),
        
        Item(itemImage: #imageLiteral(resourceName: "IMG_0993"), itemTitle: "(새상품 미개봉) 여담 수제비누 3구 선물세트 (향이 아주 좋아요~^^)", itemPrice: "10,000원", itemDescirption: "", location: "서초동 ・ ", time: "1분 전"),
        
        Item(itemImage: #imageLiteral(resourceName: "IMG_0997"), itemTitle: "(풀박스) 아이폰se3 미드나이트 64gb", itemPrice: "61,000원", itemDescirption: "", location: "서초동 ・ ", time: "1분 전"),
        
        Item(itemImage: #imageLiteral(resourceName: "IMG_0999"), itemTitle: "샤오미 자동 커피머신기", itemPrice: "50,000원", itemDescirption: "", location: "서초동 ・ ", time: "1분 전")
    ]
    
    //MARK: - Properties
    
    private var tableView = UITableView()
    
    private let addButton = AddButton()
    
    
    //MARK: - Lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkIfUserLoggedIn()
        setupNaviBar()
   
    }
    
    
    //MARK: - API
    
    func checkIfUserLoggedIn() {
        if Auth.auth().currentUser?.uid == nil {
            DispatchQueue.main.async {
                let nav = UINavigationController(rootViewController: MainController())
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true, completion: nil)
            }
        } else {
            configureUI()
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            DispatchQueue.main.async {
                let nav = UINavigationController(rootViewController: MainController())
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true, completion: nil)
            }
            } catch {
                print("DEBUG: Error signing out")
            }
        }
    
    
    //MARK: - Action

    @objc func goToSearch() {
        print("DEBUG: show search view...")
    }
    
    
    
    //MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = UIColor(hex: "212123")
        configureTabelView()
        configureButton()
        

    }
    
    func configureTabelView() {
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 144
        tableView.register(ItemViewCell.self, forCellReuseIdentifier: reuseIdentifer)
        tableView.backgroundColor = UIColor(hex: "212123")
        
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = .init(top: 0, left: 15, bottom: 0, right: 15)
        // top, bottom 값은 적용되지않는다.
        
        view.addSubview(tableView)
        tableView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
    }

    func setupNaviBar() {
        let searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(goToSearch))
        searchButton.tintColor = .white
        
        let label = UILabel()
        label.text = "서초동"
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .heavy)
        
//        let topline = CALayer()
//        topline.frame = CGRect(x: 0, y: 0, width: 100, height: 0.5)
//        topline.backgroundColor = UIColor(hex: "3F3E43").cgColor
    
        
        navigationItem.rightBarButtonItem = searchButton
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: label)
        
        // (네비게이션바 설정관련) iOS버전 업데이트 되면서 바뀐 설정⭐️⭐️⭐️
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()  // 불투명으로
        appearance.backgroundColor = UIColor(hex: "212123")
        navigationController?.navigationBar.tintColor = .systemBlue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    
    func configureButton() {
        
        addButton.delegate = self
        
        view.addSubview(addButton)
        addButton.anchor(bottom: view.bottomAnchor, right: view.rightAnchor, paddingBottom: 12.5, paddingRight: 20)
        addButton.setDimension(width: 55, height: 55)
    }
}

//MARK: - UITableViewDataSource


extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifer, for: indexPath) as! ItemViewCell
        // dequeueReusableCell은 실제로 ItemViewCell이지만 리턴값이 UITableViewCell타입이므로 타입캐스팅을 해줘야함)
        
        //indexPath.section = 그룹
        //indexPath.row = 행
    
        cell.itemImageView.image = itemArray[indexPath.row].itemImage
        cell.itemTitleLabel.text = itemArray[indexPath.row].itemTitle
        cell.itemPriceLabel.text = itemArray[indexPath.row].itemPrice
        cell.locationLabel.text = itemArray[indexPath.row].location
        cell.timeLabel.text = itemArray[indexPath.row].time
                
        cell.selectionStyle = .none
        
        return cell
    }
}

// MARK: - UITableViewDelegate


extension HomeViewController: UITableViewDelegate {
    
    // 셀이 선택이 되었을때 어떤 동작을 할 것인지 뷰컨트롤러에게 물어봄
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 다음화면으로 이동
        let vc = ItemDetailViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
}

// MARK: - AddButtonDelegate

extension HomeViewController: AddButtonDelegate {
    func goToNext() {
                
        let vc = ItemAddController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
}








