//
//  SettingsViewModel.swift
//  CarrotMarket
//
//  Created by 민호 on 2022/06/18.
//

import UIKit

enum SettingsSections: Int, CaseIterable {
    case myActivity
    case ourNeighborhood
    case ownerMenu
    case other
    
    var description: String {
        switch self {
        case .myActivity: return "나의 활동"
        case .ourNeighborhood: return "우리 동네"
        case .ownerMenu: return "사장님 메뉴"
        case .other: return "기타"
        }
    }
}

// myActivity 부터 원시값을 0~4까지 매칭되어있음 


