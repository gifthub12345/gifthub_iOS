//
//  CategoryView.swift
//  GiftHub
//
//  Created by 235 on 5/5/24.
//

import SwiftUI

struct CategoryView: View {
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    @Binding var path: NavigationPath
    var body: some View {

            ScrollView {
                LazyVGrid(columns: columns){
                    ForEach(Category.allCases, id: \.self) { category in
                        NavigationLink(destination: CategoryDetailView(category: category)) {
                                                  CategoryGridView(category: category)
                                              }

                    }
                }

            }.navigationBarBackButtonHidden()
            .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {path.append(NavigationRoutes.setting)}, label: {
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
//#Preview {
//    CategoryView()
//}
