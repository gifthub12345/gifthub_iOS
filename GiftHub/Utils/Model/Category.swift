//
//  Category.swift
//  GiftHub
//
//  Created by 235 on 5/11/24.
//

import Foundation
enum Category: String, CaseIterable {
    case pizzaChickenBurger = "피자/치킨/햄버거"
    case cafeBakery = "카페/베이커리"
    case iceCreamShavedIce = "아이스크림/빙수"
    case movieTheaterThemePark = "영화관/테마파크"
    case chineseJapanese = "중식/일식"
    case porkFeetBossamMeat = "족발/보쌈/고기"
    case money = "상품권"
    case etc = "기타"
    var imageName: String {
        switch self {
        case .pizzaChickenBurger: return "chicken"
        case .cafeBakery: return "cafe"
        case .iceCreamShavedIce: return "iceCream"
        case .movieTheaterThemePark: return "theater"
        case .chineseJapanese: return "chinese"
        case .porkFeetBossamMeat: return "beef"
        case .money: return "money"
        case .etc: return "giftHubLogo"
        }
    }
    var id: Int {
        switch self {
        case .pizzaChickenBurger:
            return 1
        case .cafeBakery:
            return 2

        case .iceCreamShavedIce:
            return 3
        case .movieTheaterThemePark:
            return 4
        case .chineseJapanese:
            return 5
        case .porkFeetBossamMeat:
            return 6
        case .money:
            return 7
        case .etc:
            return 8
        }
    }
}
