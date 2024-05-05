//
//  NoEnterView.swift
//  GiftHub
//
//  Created by 235 on 5/5/24.
//

import SwiftUI

struct NoEnterView: View {
    @State private var dialogPresentation = DialogPresentation()
    var body: some View {
        VStack {
        Text("현재 참여중인 방이 없습니다.\n방을 참여하거나 새로 개설해주세요")
            .font(.system(size: 24, weight: .medium))
            .multilineTextAlignment(.center)
            .padding(.bottom,27)
        Image("noRoom")
            .padding(.bottom, 48)
        Button(action: {
            dialogPresentation.show(content: .joinDialog(isPresented: $dialogPresentation.isPresented))
        }, label: {
            VStack {
                Text("방에 참여하기")
                    .font(.system(size: 24))
                    .padding(.bottom, 8)
                Text("이미 누군가가 방을 만들었다면 참여해요")
                    .font(.system(size: 14))
            }.frame(width: 273, height: 81).background(Color.gray)
                .clipShape(RoundedRectangle(cornerRadius: 15))
        })
        .padding(.bottom,48)
        Button(action: {
            dialogPresentation.show(content: .makeRoomDialog(isPresented: $dialogPresentation.isPresented))
        }, label: {
            VStack {
                Text("방에 만들기")
                    .font(.system(size: 24))
                    .padding(.bottom, 8)
                Text("내가 제 일먼저 방을 만들어 보아요")
                    .font(.system(size: 14))
            }.frame(width: 273, height: 81).background(Color.gray)
                .clipShape(RoundedRectangle(cornerRadius: 15))
        })}
        .customDialog(presentationManager: dialogPresentation)
    }
}

#Preview {
    NoEnterView()
}
