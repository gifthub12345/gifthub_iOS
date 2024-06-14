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
    @StateObject private var viewModel = SettingViewModel()
    @State private var showingAlert = false
    @Binding var path: NavigationPath

    @Environment(\.presentationMode) var presentationMode
       @Environment(\.dismiss) var dismiss
    var body: some View {
        List(Settings.allCases, id: \.self) { setting in
            Text(setting.title)
                .onTapGesture {
                    handleSettingTap(setting)
                }
        }.listStyle(.plain)
        .navigationTitle("설정")
        .alert(isPresented: $showingAlert) {
                   Alert(
                       title: Text("회원탈퇴"),
                       message: Text("정말 계정을 삭제하시겠습니까?"),
                       primaryButton: .destructive(Text("예")) {
                           deleteUser()
                       },
                       secondaryButton: .cancel(Text("취소"))
                   )
               }
    }
    private func handleSettingTap(_ setting: Settings) {
        switch setting {
        case .lookCode:
            break
        case .lookParticipant:
            break
        case .outRoom:
            break
        case .logout:
            break
        case .delete:
            showingAlert = true
        }
    }
    private func deleteUser() {
        viewModel.deleteUser { success in
            if success {
                path.removeLast(2)
            } else {
                // Handle deletion failure if needed
                path.removeLast(2)
            }
        }
    }
}

