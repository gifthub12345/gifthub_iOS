//
//  CategoryGridView.swift
//  GiftHub
//
//  Created by 235 on 5/5/24.
//

import SwiftUI

struct CategoryGridView: View {
    var category: Category
    var body: some View {
        VStack(spacing: 4) {
            Image(category.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 160, height: 160)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(color: Color.black.opacity(0.5), radius: 10, x: 5, y: 12)
            Text(category.rawValue)
                .font(.system(size: 16))
                .foregroundStyle(.black)
        }.padding(.bottom, 16)
    }
}
