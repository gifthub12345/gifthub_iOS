//
//  JoinDialogView.swift
//  GiftHub
//
//  Created by 235 on 5/5/24.
//

import SwiftUI

struct JoinDialogView: View {
    @Binding var isPresented: Bool
    @Binding var isSucceed: Bool
    @State var joinCode: String = ""
    var body: some View {
        VStack(spacing: 0) {

            ZStack {
                Text("방에 참여하기")
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
            }.padding(.vertical, 24)
            TextField("참여하려는 방의 코드를 입력해주세요" , text: $joinCode)
                .padding()
                .textFieldStyle(.roundedBorder)
                .padding(.bottom,16)
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("참여")
                    .foregroundStyle(Color.black)
                    .frame(width: 100, height:  38)
                    .background(Color.purple)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }).padding(.bottom, 16)
        }
        .background(.white).clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
