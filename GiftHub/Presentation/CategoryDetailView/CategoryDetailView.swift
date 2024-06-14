//
//  CategoryDetailView.swift
//  GiftHub
//
//  Created by 235 on 5/5/24.
//
import Kingfisher
import SwiftUI
import PhotosUI
struct CategoryDetailView: View {
    @ObservedObject var viewModel: CategoryViewModel
    @Environment(DIContainer.self) var container
    //    var roomid: Int
    //    @State private var dialogPresentation = DialogPresentation()
    @State private var isFullScreen = false
    @State private var selectedImageURL: String? // 전체화면에 표시할 이미지 URL
    @State private var imageURLToDelete: String?
    @State private var selectedImageID: Int?
    @State private var showAlert = false
    var category: Category
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    var body: some View {
        @Bindable var dialogPresentation = container.dialogPresentation
        ZStack {
            if let selectedImage = selectedImageURL {
                KFImage(URL(string: selectedImage))
                    .resizable()
                    .scaledToFill()
                //                    .frame(width: .infinity, height: .infinity)
                    .gesture(DragGesture(minimumDistance: 0,coordinateSpace: .local)
                        .onEnded({ value in
                            if value.translation.width < 0 {
                                //left
                                selectedImageURL = nil
                            }
                            else if value.translation.width > 0 {
                                //right
                                print("right")
                                showAlert.toggle()
                            }
                        })).navigationBarBackButtonHidden()
            }
            else {
                ScrollView {
                    LazyVGrid(columns: columns){
                        ForEach(viewModel.imageDetails) { imageUrl in
                            KFImage(URL(string: imageUrl.url))
                                .resizable()
                                .scaledToFill()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .padding(4)
                                .onTapGesture {
                                    selectedImageURL = imageUrl.url
                                    selectedImageID = imageUrl.id
                                    isFullScreen.toggle()
                                }
                        }
                    }

                }.navigationBarTitleDisplayMode(.large)
                    .navigationTitle(category.rawValue)
                    .customDialog(presentationManager: container.dialogPresentation)
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
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("사용하셨습니까?"),
                  primaryButton: .destructive(Text("예")) {
                if let selectid = selectedImageID {
                    viewModel.deletetoServer(category: category, giftconId: selectid)

                }
            }, secondaryButton: .cancel())
        }
        .onReceive(viewModel.deleteResultPublisher) { success in
                   if success {
                       selectedImageID = nil
                       selectedImageURL = nil
                   }
               }
        .onChange(of: viewModel.isSucceed, { oldValue, newValue in
            if newValue == true{
                if let selectedImage = viewModel.selectedImage {
                    container.dialogPresentation.show(content: .addGiftDialog(image: selectedImage, expirationDate: viewModel.expireOCRString, isPresented: $dialogPresentation.isPresented, viewModel: viewModel, category: category))

                }
            }
        })
        .onChange(of: dialogPresentation.isPresented) { oldValue, newValue in
            if !newValue {
                viewModel.isSucceed = false
            }
        }
        .onAppear {
            viewModel.getDetailImages(category: category)
        }
    }

}
//
//#Preview {
//    NavigationStack {
//        CategoryDetailView(category: .cafeBakery)
//    }
//}
