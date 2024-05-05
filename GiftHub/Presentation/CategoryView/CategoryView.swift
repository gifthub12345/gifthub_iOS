//
//  CategoryView.swift
//  GiftHub
//
//  Created by 235 on 5/5/24.
//

import SwiftUI
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
}
struct CategoryView: View {
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns){
                    ForEach(Category.allCases, id: \.self) { category in
                        CategoryGridView(category: category)
                    }
                }

            }.navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {}, label: {
                            Image(systemName: "gear")
                                .foregroundStyle(Color.black)
                        })
                    }
                    ToolbarItem(placement: .principal) {
                        Text("방제목(구성수)")
                    }
                }
        }
    }
}
#Preview {
    CategoryView()
}
