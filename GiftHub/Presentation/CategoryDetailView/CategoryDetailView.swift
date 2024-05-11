//
//  CategoryDetailView.swift
//  GiftHub
//
//  Created by 235 on 5/5/24.
//

import SwiftUI
import PhotosUI
struct CategoryDetailView: View {
    @StateObject private var viewModel = CategoryViewModel()
    var category: Category
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
       var body: some View {
           ScrollView {
               LazyVGrid(columns: columns){

               }}.navigationBarTitleDisplayMode(.large)
               .navigationTitle(category.rawValue)
               .toolbar {
                   ToolbarItem(placement: .topBarTrailing) {
                       PhotosPicker(selection: $viewModel.imageSelection, matching: .images) {
                           Image(systemName: "plus")
                       }.photosPickerAccessoryVisibility(.hidden, edges: .bottom)
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
               .overlay {
                   if viewModel.isSucceed {
                       if let selectedImage = viewModel.selectedImage {
                           AddGiftModal(image: selectedImage, expirationDate: $viewModel.OCRString, isOpen: $viewModel.isSucceed)
                       }
                   }

               }
//               .fullScreenCover(isPresented: $viewModel.isSucceed, content: {
////                   if let ocrString = viewModel.OCRString,
//
//
//               })
       }
}

#Preview {
    NavigationStack {
        CategoryDetailView(category: .cafeBakery)
    }
}
