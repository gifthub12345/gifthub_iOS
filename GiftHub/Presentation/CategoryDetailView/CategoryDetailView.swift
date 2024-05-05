//
//  CategoryDetailView.swift
//  GiftHub
//
//  Created by 235 on 5/5/24.
//

import SwiftUI

struct CategoryDetailView: View {
    var category: Category
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
       var body: some View {
           ScrollView {
               LazyVGrid(columns: columns){

               }}.navigationBarTitleDisplayMode(.large)
               .navigationTitle(category.rawValue)
               .toolbar {
                   ToolbarItem(placement: .topBarTrailing) {
                       Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                           Image(systemName: "plus")
                       })
                   }
               }
               .safeAreaInset(edge: .top) {
                   VStack(spacing: 8) {
                       Divider()
                       HStack {
                           Text("유효기간 임박순입니다.")
                               .font(.system(size: 14, weight: .semibold))
                               .foregroundStyle(.red)
                           Spacer()
                       }
                       .padding(.leading, 4 )
                   }.padding(.horizontal, 16 )
               }
       }
}

//#Preview {
//    CategoryDetailView()
//}
