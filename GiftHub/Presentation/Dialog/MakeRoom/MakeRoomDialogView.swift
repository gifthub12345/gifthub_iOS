//
//  InputRoomDialogView.swift
//  GiftHub
//
//  Created by 235 on 5/5/24.
//

import SwiftUI


struct MakeRoomDialogView: View {
    @Binding var isPresented: Bool
    @Binding var isSucceed: Bool
    @State var roomTitle: String = ""
    @State private var openCode:Bool = false
    @ObservedObject var viewModel: MakeRoomDialogViewModel
    private let pasteboard = UIPasteboard.general
    var body: some View {
        VStack(spacing: 0) {
            if openCode {
                VStack {
                    Text("코드를 친구나 가족에게 공유하세요")
                        .padding(.vertical, 8)
                    HStack {
                        Spacer()
                        Text(viewModel.roomCode)
                        Button(action: {
                            pasteboard.string = viewModel.joinCodeString
                        }, label: {
                            Image(systemName: "doc.on.clipboard")
                                .resizable()
                                .foregroundStyle(Color.black)
                                .frame(width: 16,height: 16)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                        })
                        Spacer()
                    }
                    Button(action: {
                        isSucceed = true
                        isPresented = false
                    }, label: {
                        Text("다음")
                            .foregroundStyle(Color.black)
                            .frame(width: 100, height:  38)
                            .background(Color.purple)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }).padding(.bottom, 16)
                }
            }
            else {
                ZStack {
                    Text("방 만들기")
                        .font(.system(size: 16, weight: .bold))

                    HStack {
                        Spacer()
                        Button {
                            isPresented = false
                        } label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 16,height: 16)
                                .foregroundStyle(Color.red)
                        }
                    }.padding(.trailing, 28)
                }.padding(.top, 24)

                TextField("방 제목을 정해주세요" , text: $viewModel.joinCodeString)
                    .padding()
                    .textFieldStyle(.roundedBorder)
                    .padding(.bottom,16)
                Button(action: {viewModel.makeRoom()}, label: {
                    Text("제작")
                        .foregroundStyle(Color.black)
                        .frame(width: 100, height:  38)
                        .background(Color.purple)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }).padding(.bottom, 16)
            }
        }
        .onChange(of: viewModel.isSucceed, { oldValue, newValue in
            openCode = newValue
//            isPresented = false
        })
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))

    }
}


//#Preview {
//    MakeRoomDialogView(isPresented: .constant(true))
////    MakeRoomDialogView(isPresented: .constant(true))
//}
