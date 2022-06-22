//
//  ItemAddController.swift
//  CarrotMarket
//
//  Created by 민호 on 2022/06/19.
//

import Foundation
import UIKit



class ItemAddController: UIViewController {
    
    let reuseIdentifier = "AddItemCell"
    
    let data = ["글 제목", "카테고리 선택", "가격"]

    
    //MARK: - Properties
    
    
    let titleView = TitleView()

    
    let pickerButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "camera.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.white), for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = .init(gray: 1, alpha: 0.15)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(handlePickerPhoto), for: .touchUpInside)
        
        
       return button
    }()
    
    
    let tableView = UITableView()
    


    
    
    //MARK: - Lifecycle

    

  

       
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = baseColor
        
        configureTableView()
        configureUI()
        self.hideKeyboardWhenTappedAround()

        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
         self.view.endEditing(true)
   }
    
    
    //MARK: - Actions

    @objc func handlePickerPhoto() {
        let picker = UIImagePickerController()
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
    

    
    //MARK: - Helpers
    
    
    
    func configureUI() {
        
        titleView.delegate = self
        
        view.addSubview(titleView)
        titleView.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor)
        titleView.setDimension(width: view.frame.width, height: 90)
        
    }
    
    
    func configureTableView() {
        
        tableView.backgroundColor = baseColor
        tableView.dataSource = self
        tableView.rowHeight = 70
        tableView.separatorInset = .init(top: 0, left: 15, bottom: 0, right: 15)
        tableView.register(AddItemCell.self, forCellReuseIdentifier: reuseIdentifier)
        
        
        let header = AddItemHeaderView(frame: CGRect(x: 0, y: 90, width: view.frame.width, height: 159))
        
        let footer = AddItemFooterView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 500))
        footer.delegate = self // textView에는 place홀더없어서 placeholder 델리게이트 활성화
        
        
        tableView.tableHeaderView = header
        tableView.tableFooterView = footer

        
        view.addSubview(tableView)
        tableView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 50)
        
        header.addSubview(pickerButton)
        pickerButton.anchor(top: header.topAnchor, left: header.leftAnchor, bottom: header.bottomAnchor, paddingTop: 70, paddingLeft: 15, paddingBottom: 30)
        pickerButton.setDimension(width: 60, height: 70)
        
    }

    
    
    
    
}


    //MARK: - UITableViewDataSource

extension ItemAddController: UITableViewDataSource, UITextFieldDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! AddItemCell
        
        if indexPath.row == 0 {
            
            cell.inputField.placeholder = "글 제목"
            cell.delegate = self
            
        } else if indexPath.row == 1 {
            
            cell.inputField.text = "카테고리 선택"

            
        } else {
            
            cell.inputField.placeholder = "₩ 가격"
            cell.delegate = self

        }
        
        cell.selectionStyle = .none
        
        return cell
        
    }
}

    //MARK: - TitleViewDelegate


extension ItemAddController: TitleViewDelegate {
    func goNext() {
        print("fetch Item...")
    }
    
    func goBefore() {
        dismiss(animated: true, completion: nil)
    }
}

    //MARK: - UITextViewDelegate

let textViewPlaceHolder = "다정동에 올릴 게시글 내용을 작성해주세요.(가품 및 판매금지품목은 게시가 제한될 수 있어요.)"


extension ItemAddController: UITextViewDelegate {
        
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == textViewPlaceHolder {
            textView.text = nil
            textView.textColor = .white
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            textView.text = textViewPlaceHolder
            textView.textColor = UIColor(hex: "51545B")
        }
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let inputString = text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let oldString = textView.text, let newRange = Range(range, in: oldString) else { return true }
        let newString = oldString.replacingCharacters(in: newRange, with: inputString).trimmingCharacters(in: .whitespacesAndNewlines)

        return true
    }
}

// TextView는 placeHolder를 제공하지 않으므로 델리게이트를 이용해서 만들어야함

//MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate


extension ItemAddController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as? UIImage
        pickerButton.setImage(image?.withRenderingMode(.alwaysOriginal), for: .normal)
        pickerButton.layer.borderWidth = 0
        pickerButton.imageView?.contentMode = .scaleAspectFill
        
        dismiss(animated: true, completion: nil)
    }
    
}

//MARK: - AddCellDelegate

extension ItemAddController: AddCellDelegate {
    func settingsCell(value: String) {
        
    }
}

extension ItemAddController: AddItemFooterViewDelegate {
    func extractContents(value: String) {
        
        
    }
}


