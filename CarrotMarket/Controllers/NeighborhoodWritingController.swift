//
//  NeighborhoodWriting.swift
//  CarrotMarket
//
//  Created by 민호 on 2022/06/19.
//

import UIKit

class NeighborhoodWritingController: UIViewController {
    
    //MARK: - Properties
    
    let titleView = TitleView()
    
    private let textViewField = TextViewField()
    
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboardByTappingOutside))
        
        self.view.addGestureRecognizer(tap)
    }
    
 
    //MARK: - Actions
    
    @objc func hideKeyboardByTappingOutside() {
        self.view.endEditing(true)
    }
    
    
    
    //MARK: - Helpers
    
    
    func configureUI() {
        
        titleView.delegate = self
        
        view.addSubview(titleView)
        titleView.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor)
        titleView.setDimension(width: view.frame.width, height: 90)
        titleView.mainLabel.text = "동네생활 글쓰기"
        
        view.addSubview(textViewField)
        textViewField.anchor(top: titleView.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor ,right: view.rightAnchor)
        textViewField.placeholderLabel.text = "서초동 우리 동네 관련된 질문이나 이야기를 해보세요."
        
    }
}




//MARK: - TitleViewDelegate

extension NeighborhoodWritingController: TitleViewDelegate {
    func goBefore() {
        dismiss(animated: true, completion: nil)
    }
    
    func goNext() {
        guard let textViewText = textViewField.text else { return }
        
        PostService.shared.uploadPost(caption: textViewText) { err, ref in
            if let error = err {
                print(error.localizedDescription)
                return
            }
            self.dismiss(animated: true, completion: nil)
        }
    }
}


// MARK: - 수정해야할것
// responder가 TextView나 textFieldView에 가 있으면 TitleView의 button이 작동하지 않음
// photoView의 화면을 클릭해야만 넘어감


