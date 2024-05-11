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
    var roomCode: String = "123iofjewjfio"
    private let pasteboard = UIPasteboard.general
    var body: some View {
        VStack(spacing: 0) {
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

            Text("코드를 친구나 가족에게 공유하세요")
                .padding(.vertical, 8)
            HStack {
                Spacer()
                Text(roomCode)
                Button(action: {
                    pasteboard.string = roomCode
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
            TextField("방 제목을 정해주세요" , text: $roomTitle)
                .padding()
                .textFieldStyle(.roundedBorder)
                .padding(.bottom,16)
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("제작")
                    .foregroundStyle(Color.black)
                    .frame(width: 100, height:  38)
                    .background(Color.purple)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }).padding(.bottom, 16)
        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))

    }
}


//#Preview {
//    MakeRoomDialogView(isPresented: .constant(true))
////    MakeRoomDialogView(isPresented: .constant(true))
//}
