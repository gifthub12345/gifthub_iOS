//
//  SettingView.swift
//  GiftHub
//
//  Created by 235 on 5/11/24.
//

import SwiftUI
enum Settings: CaseIterable {
    case lookCode
    case lookParticipant
    case outRoom
    case logout
    case delete
    var title: String {
        switch self {
        case .lookCode:
            "내가 만든 방 코드보기"
        case .lookParticipant:
            "현재 방 참여자보기"
        case .outRoom:
            "방 나가기"
        case .logout:
            "로그아웃"
        case .delete:
            "계정탈퇴"
        }
    }
}
struct SettingView: View {

    var body: some View {
        List(Settings.allCases, id: \.self) { setting in
            Text(setting.title)
        }.listStyle(.plain)
        .navigationTitle("설정")
    }
}

#Preview {
    SettingView()
}
