//
//  CategoryView.swift
//  GiftHub
//
//  Created by 235 on 5/5/24.
//

import SwiftUI

struct CategoryView: View {
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns){
                    ForEach(Category.allCases, id: \.self) { category in
                        NavigationLink(destination: CategoryDetailView(category: category)) {
                                                  CategoryGridView(category: category)
                                              }

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
